import argparse
import m5
from m5.objects import *
from caches import *

parser = argparse.ArgumentParser(description='2-level cache')
parser.add_argument('--binary', default='', nargs='?', type=str, help='Path to the binary to execute')
parser.add_argument('--num', default='65536', nargs='?', type=str, help='Path to the binary to execute')
parser.add_argument('--l1i_size', help='L1ICache Size, default 16kB')
parser.add_argument('--l1d_size', help='L1DCache Size, default 64kB')
parser.add_argument('--l2_size',  help='L2Cache Size, default 256kB')
parser.add_argument('--victim_size',  help='victim Size, default 1kB')
parser.add_argument('--l1i_assoc', help='L1ICache Associativity, default 2-way')
parser.add_argument('--l1d_assoc', help='L1DCache Associativity, default 2-way')
parser.add_argument('--l2_assoc',  help='L2Cache Associativity, default 8-way')
parser.add_argument('--victim_assoc',  help='Victim Associativity, This number need to be set as victim_size/64B to ensure fully associative, default 16')
parser.add_argument('--victim',  default='0', help='Enable Victim Cache')
parser.add_argument('--cpu_type', help='CPU Type, default is TimingSimpleCPU')
parser.add_argument('--clk_freq', help='Clock frequencey, default is 1GHz')
parser.add_argument('--mem_type', help='Memory DRAM type, default is DDR3_1600_8x8')

options = parser.parse_args()

#Create system
system = System()

#Create clock and voltage domain
system.clk_domain = SrcClockDomain()
if options.clk_freq == '2GHz' :
    system.clk_domain.clock = '2GHz'
elif options.clk_freq == '4GHz' :
    system.clk_domain.clock = '4GHz'
else :
    system.clk_domain.clock = '1GHz'

system.clk_domain.voltage_domain = VoltageDomain()

#Memmory mode & range
system.mem_mode = 'timing'
system.mem_ranges = [AddrRange('512MB')]

# CPU type - TimingSimpleCPU is in-order non-pipelined, MinorCPU is in-order pipelined, Derive03CPU is out-of-order pipelined
if options.cpu_type == 'MinorCPU' :
    system.cpu = MinorCPU()
elif options.cpu_type == 'DerivO3CPU' :
    system.cpu = DerivO3CPU()
else :
    system.cpu = TimingSimpleCPU()

# Memory bus,  connect cpu and system to memory bus
system.membus = SystemXBar()

# Connect cpu side ports to memory bus - cpu.xcache_port acts like a requestor and membus.cpu_side_ports acts like responder
#system.cpu.icache_port = system.membus.cpu_side_ports
#system.cpu.dcache_port = system.membus.cpu_side_ports

# Caches
# Create cpu caches
system.cpu.icache = L1ICache(options)
system.cpu.dcache = L1DCache(options)

# connect cpu icache & dache to cpu
system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

#L2 bus
system.l2bus = L2XBar()
if options.victim == '1' :
    #victim bus
    system.victimbus = VictimXBar()

# connect icache to l2 bus
system.cpu.icache.connectBus(system.l2bus)

if options.victim == '1' :
    # connect dcache to victim bus
    system.cpu.dcache.connectBus(system.victimbus)
    # Create victim cache
    system.victimcache = VictimCache(options)
    # connect victim bus to victim cache
    system.victimcache.connectCPUSideBus(system.victimbus)
    # connect victim to l2 bus
    system.victimcache.connectMemSideBus(system.l2bus)
else :
    # connect dcache to l2 bus
    system.cpu.dcache.connectBus(system.l2bus)

# Create L2 cache
system.l2cache = L2Cache(options)

# connect l2 bus to l2 cache
system.l2cache.connectCPUSideBus(system.l2bus)

# connect l2cache to memory
system.l2cache.connectMemSideBus(system.membus)

# Interrupt controller - why is this needed? 
system.cpu.createInterruptController()
# Connect IC to mem, these three lines will not be requires for Arm ISA
system.cpu.interrupts[0].pio = system.membus.mem_side_ports
system.cpu.interrupts[0].int_requestor = system.membus.cpu_side_ports
system.cpu.interrupts[0].int_responder = system.membus.mem_side_ports

# Finally connect system port to cpu, not sure what this is doing..
system.system_port = system.membus.cpu_side_ports

# Memory controller to access mem, this needs to be connected to membus obviously, also select DRAM type and range
system.mem_ctrl = MemCtrl()
if options.mem_type == 'DDR3_2133_8x8' :
    system.mem_ctrl.dram = DDR3_2133_8x8()
elif options.mem_type == 'LPDDR2_S4_1066_1x32' :
    system.mem_ctrl.dram = LPDDR2_S4_1066_1x32()
elif options.mem_type == 'HBM_1000_4H_1x64' :
    system.mem_ctrl.dram = HBM_1000_4H_1x64()
else :
    system.mem_ctrl.dram = DDR3_1600_8x8()
system.mem_ctrl.dram.range = system.mem_ranges[0]
system.mem_ctrl.port =  system.membus.mem_side_ports

# Test to run starts from here
# Pass the binary
binary = options.binary
num = options.num

system.workload = SEWorkload.init_compatible(binary)

process = Process()
process.cmd = [binary]+[num]
system.cpu.workload = process
system.cpu.createThreads()

# Run in Syscall Emulation (SE) mode - good for running only programs
# If you want to model a full system (OS + Hardware), go with Full System (FS)
root = Root(full_system = False, system = system)

m5.instantiate()

print("Begin Simulation :)")
exit_event = m5.simulate()

print('Exiting @ tick {} because {}'.format(m5.curTick(), exit_event.getCause()))
