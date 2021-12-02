# Tutorial caches.py

from m5.objects import Cache
from m5.objects import CoherentXBar
from m5.objects import SnoopFilter

class L1Cache(Cache):
    assoc = 2
    tag_latency = 2
    data_latency = 2
    response_latency = 2
    mshrs = 4
    tgts_per_mshr = 20
        
    def __init__(self, options=None):
        super(L1Cache, self).__init__()
        pass

    def connectCPU(self, cpu):
        # Define this in classes which extend this
        raise NotImplementedError

    def connectBus(self, bus):
        self.mem_side = bus.cpu_side_ports

class L1ICache(L1Cache):
    size = '16kB'
    assoc = 2

    def __init__(self, options=None):
        super(L1ICache, self).__init__(options)
        if options and options.l1i_size:
            self.size = options.l1i_size
        if options and options.l1i_assoc:
            self.assoc = options.l1i_assoc
        return

    def connectCPU(self, cpu):
        self.cpu_side = cpu.icache_port

class L1DCache(L1Cache):
    size = '64kB'
    assoc = 2
    writeback_clean = True

    def __init__(self, options=None):
        super(L1DCache, self).__init__(options)
        if options and options.l1d_size:
            self.size = options.l1d_size
        if options and options.l1d_assoc:
            self.assoc = options.l1d_assoc
        return

    def connectCPU(self, cpu):
        self.cpu_side = cpu.dcache_port

class VictimCache(Cache):
    size = '1kB'
    assoc = 16
    tag_latency = 0
    data_latency = 0
    response_latency = 0
    mshrs = 4
    tgts_per_mshr = 20
    clusivity = 'mostly_excl'
    writeback_clean = True
    
    def __init__(self, options=None):
        super(VictimCache, self).__init__()
        if options and options.victim_size:
            self.size = options.victim_size
        if options and options.victim_assoc:
            self.assoc = options.victim_assoc
        return

    def connectCPUSideBus(self, bus):
        self.cpu_side = bus.mem_side_ports

    def connectMemSideBus(self, bus):
        self.mem_side = bus.cpu_side_ports

class L2Cache(Cache):
    
    size = '256kB'
    assoc = 8
    tag_latency = 20
    data_latency = 20
    response_latency = 20
    mshrs = 20
    tgts_per_mshr = 12
    clusivity = 'mostly_excl'

    def __init__(self, options=None):
        super(L2Cache, self).__init__()
        if options and options.l2_size:
            self.size = options.l2_size
        if options and options.l2_assoc:
            self.assoc = options.l2_assoc
        return
    
    def connectCPUSideBus(self, bus):
        self.cpu_side = bus.mem_side_ports

    def connectMemSideBus(self, bus):
        self.mem_side = bus.cpu_side_ports

class VictimXBar(CoherentXBar) :
    # 256-bit crossbar by default
    width = 256

    # Assume that most of this is covered by the cache latencies, with
    # no more than a single pipeline stage for any packet.
    frontend_latency = 0
    forward_latency = 0
    response_latency = 0
    snoop_response_latency = 0

    # Use a snoop-filter by default, and set the latency to zero as
    # the lookup is assumed to overlap with the frontend latency of
    # the crossbar
    snoop_filter = SnoopFilter(lookup_latency = 0)

    # This specialisation of the coherent crossbar is to be considered
    # the point of unification, it connects the dcache and the icache
    # to the first level of unified cache.
    point_of_unification = False
