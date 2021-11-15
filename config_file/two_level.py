import m5
from m5.objects import *
from caches import *
import sys

# simulation needs inputs of three parameters
# 1. CPU type   2. CPU clock frequency  3. Main Memory Type
cpu_type = int(sys.argv[1])        # 1-TimingSimpleCPU, 2-MinorCPU， 3-O3CPU

cf_type = int(sys.argv[2])         # 1-1GHZ,   2-2GHZ,     4-4GHZ

mem_type = int(sys.argv[3])        # 1-DDR3_1600_8x8
                              # 2-DDR3_2133_8x8
                              # 3-LPDDR2_S4_1066_1x32
                              # 4-HBM_1000_4H_1x64
bool_vic = int(sys.argv[4])   # whether to use victim cache
exe_path = str(sys.argv[5])   # specify executable path

print("cpu_type input:"+str(cpu_type))
print("cf_type input:"+str(cf_type))
print("mem_type input:"+str(mem_type))
print("bool_vic input:"+str(bool_vic))
print("executable path:"+"../../test/"+str(exe_path))

# create a system that we are going to simulate
system = System()

# set clock rate of the CPU
system.clk_domain = SrcClockDomain()

# set clock frequency
if cf_type == 1:
      system.clk_domain.clock = '1GHz'
      print("cf set to 1GHZ")
elif cf_type == 2:
      system.clk_domain.clock = '2GHz'
      print("cf set to 2GHZ")
elif cf_type == 4:
      system.clk_domain.clock = '4GHz'
      print("cf set to 4GHZ")
else:
      quit()

system.clk_domain.voltage_domain = VoltageDomain()

# use 'timing' memory mode, with 512 MB size
system.mem_mode = 'timing'
system.mem_ranges = [AddrRange('512MB')]

# set cpu type
if cpu_type == 1: 
      system.cpu = TimingSimpleCPU()
      print("cpu set to TimingSimpleCPU")
elif cpu_type == 2:
      system.cpu = MinorCPU()
      print("cpu set to MinorCPU")
elif cpu_type == 3:
      system.cpu = O3CPU()
      print("cpu set to O3CPU")
else:
      quit()

# now create L1 caches
system.cpu.icache = L1ICache()
system.cpu.dcache = L1DCache()

# connect the caches to the CPU ports
system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

# create a system-wide memory bus
system.membus = SystemXBar()

# we need to crate an L2 bus to connect L1 to L2
system.l2bus = L2XBar()

system.cpu.icache.connectBus(system.l2bus)
system.cpu.dcache.connectBus(system.l2bus)

system.l2cache = L2Cache()
system.l2cache.connectCPUSideBus(system.l2bus)
system.l2cache.connectMemSideBus(system.membus)

# Connecting the PIO and interrupt ports to the memory bus
system.cpu.createInterruptController()
system.cpu.interrupts[0].pio = system.membus.mem_side_ports
system.cpu.interrupts[0].int_requestor = system.membus.cpu_side_ports
system.cpu.interrupts[0].int_responder = system.membus.mem_side_ports

system.system_port = system.membus.cpu_side_ports

#  create a memory controller and connect it to the membus
system.mem_ctrl = MemCtrl()

# set memory type
if mem_type == 1:
      system.mem_ctrl.dram = DDR3_1600_8x8()
      print("mem set to DDR3_1600_8x8")
elif mem_type == 2:
      system.mem_ctrl.dram = DDR3_2133_8x8()
      print("mem set to DDR3_2133_8x8")
elif mem_type == 3:
      system.mem_ctrl.dram = LPDDR2_S4_1066_1x32()
      print("mem set to LPDDR2_S4_1066_1x32")
elif mem_type == 4:
      system.mem_ctrl.dram = HBM_1000_4H_1x64()
      print("mem set to HBM_1000_4H_1x64")
else:
      quit()


system.mem_ctrl.dram.range = system.mem_ranges[0]
system.mem_ctrl.port = system.membus.mem_side_ports

# get ISA for the binary to run.
isa = str(m5.defines.buildEnv['TARGET_ISA']).lower()

# grab the specific path to the binary
thispath = os.path.dirname(os.path.realpath(__file__))
#binary = os.path.join(thispath, '../../../',
#                      'hw4_cpp/',)

binary = os.path.join(thispath, '../../test',exe_path)

# for gem5 V21 and beyond, uncomment the following line
system.workload = SEWorkload.init_compatible(binary)

process = Process()
process.cmd = [binary, int(1000000)]
system.cpu.workload = process
system.cpu.createThreads()

root = Root(full_system = False, system = system)
m5.instantiate()

print("Beginning simulation!")
exit_event = m5.simulate()

print('Exiting @ tick {} because {}'
      .format(m5.curTick(), exit_event.getCause()))
