./build/X86/gem5.opt -d DerivO3CPU_CCa_victim_128B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=1 --victim_size=128B --victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_victim_256B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=1 --victim_size=256B --victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=1 --victim_size=1kB --victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=1 --victim_size=4kB --victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_no_victim configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --victim=0 --cpu_type=DerivO3CPU

./build/X86/gem5.opt -d DerivO3CPU_MC_victim_128B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=1 --victim_size=128B --victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_victim_256B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=1 --victim_size=256B --victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 
./build/X86/gem5.opt -d DerivO3CPU_MC_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=1 --victim_size=1kB --victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=1 --victim_size=4kB --victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_no_victim configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --victim=0 --cpu_type=DerivO3CPU

./build/X86/gem5.opt -d DerivO3CPU_MCS_victim_128B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=1 --victim_size=128B --victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_victim_256B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=1 --victim_size=256B --victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=1 --victim_size=1kB --victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=1 --victim_size=4kB --victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_no_victim configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --victim=0 --cpu_type=DerivO3CPU

./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_victim_128B configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=1 --victim_size=128B --victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_victim_256B configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=1 --victim_size=256B --victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_victim_512B configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=1 --victim_size=1kB --victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=1 --victim_size=4kB --victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_M_Dyn_no_victim configs/project/victim_cache.py --binary=../bench_tests/M_Dyn/bench.X86 --victim=0 --cpu_type=DerivO3CPU