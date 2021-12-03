./build/X86/gem5.opt -d DerivO3CPU_CCa_l2_victim_128B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=1 --l2_victim_size=128B --l2_victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l2_victim_256B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=1 --l2_victim_size=256B --l2_victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=1 --l2_victim_size=512B --l2_victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l2_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=1 --l2_victim_size=1kB --l2_victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l2_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=1 --l2_victim_size=4kB --l2_victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_no_l2_victim configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l2_victim=0 --cpu_type=DerivO3CPU

./build/X86/gem5.opt -d DerivO3CPU_MC_l2_victim_128B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=1 --l2_victim_size=128B --l2_victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_l2_victim_256B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=1 --l2_victim_size=256B --l2_victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_l2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=1 --l2_victim_size=512B --l2_victim_assoc=8 --cpu_type=DerivO3CPU 
./build/X86/gem5.opt -d DerivO3CPU_MC_l2_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=1 --l2_victim_size=1kB --l2_victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_l2_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=1 --l2_victim_size=4kB --l2_victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_no_l2_victim configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l2_victim=0 --cpu_type=DerivO3CPU

./build/X86/gem5.opt -d DerivO3CPU_MCS_l2_victim_128B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=1 --l2_victim_size=128B --l2_victim_assoc=2 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l2_victim_256B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=1 --l2_victim_size=256B --l2_victim_assoc=4 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=1 --l2_victim_size=512B --l2_victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l2_victim_1kB configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=1 --l2_victim_size=1kB --l2_victim_assoc=16 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l2_victim_4kB configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=1 --l2_victim_size=4kB --l2_victim_assoc=64 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_no_l2_victim configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l2_victim=0 --cpu_type=DerivO3CPU