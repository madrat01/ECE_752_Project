./build/X86/gem5.opt -d DerivO3CPU_MC_l1_assoc_1_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l1d_assoc=1 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_l1_assoc_2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l1d_assoc=2 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MC_l1_assoc_4_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l1d_assoc=4 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 
./build/X86/gem5.opt -d DerivO3CPU_MC_l1_assoc_8_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MC/bench.X86 --l1d_assoc=8 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 

./build/X86/gem5.opt -d DerivO3CPU_MCS_l1_assoc_1_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l1d_assoc=1 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l1_assoc_2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l1d_assoc=2 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_MCS_l1_assoc_4_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l1d_assoc=4 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 
./build/X86/gem5.opt -d DerivO3CPU_MCS_l1_assoc_8_victim_512B configs/project/victim_cache.py --binary=../bench_tests/MCS/bench.X86 --l1d_assoc=8 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 

./build/X86/gem5.opt -d DerivO3CPU_CCa_l1_assoc_1_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l1d_assoc=1 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l1_assoc_2_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l1d_assoc=2 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU
./build/X86/gem5.opt -d DerivO3CPU_CCa_l1_assoc_4_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l1d_assoc=4 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 
./build/X86/gem5.opt -d DerivO3CPU_CCa_l1_assoc_8_victim_512B configs/project/victim_cache.py --binary=../bench_tests/CCa/bench.X86 --l1d_assoc=8 --victim=1 --victim_size=512B --victim_assoc=8 --cpu_type=DerivO3CPU 