#! /bin/bash
# Reading Arguments

L1d=$1
L1i=$2
L2=$3
L1d_associativity=$4
L1i_associativity=$5
L2_associativity=$6
Cache_size=$7
Benchmark_401=$8
Benchmark_429=$9
Benchmark_456=${10}
Benchmark_458=${11}	
Benchmark_470=${12}

# Modifications for cache parameters

#cd ~/CA/Project1_SPEC/${Benchmark_401}

sed -i "s|time.*$|time \$GEM5_DIR/build/X86/gem5.opt -d ./m5out \$GEM5_DIR/configs/example/se.py -c \$BENCHMARK -o \$ARGUMENT -I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=${L1d} --l1i_size=${L1i} --l2_size=${L2} --l1d_assoc=${L1d_associativity} --l1i_assoc=${L1i_associativity} --l2_assoc=${L2_associativity} --cacheline_size=${Cache_size}|g" $(pwd)/Project1_SPEC/401.bzip2/runGem5.sh


#cd ..
#cd ~/CA/Project1_SPEC//${Benchmark_429}
#
sed -i "s|time.*$|time \$GEM5_DIR/build/X86/gem5.opt -d ./m5out \$GEM5_DIR/configs/example/se.py -c \$BENCHMARK -o \$ARGUMENT -I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=${L1d} --l1i_size=${L1i} --l2_size=${L2} --l1d_assoc=${L1d_associativity} --l1i_assoc=${L1i_associativity} --l2_assoc=${L2_associativity} --cacheline_size=${Cache_size}|g" $(pwd)/Project1_SPEC/429.mcf/runGem5.sh

#cd ..
#cd ~/CA/Project1_SPEC/${Benchmark_456}
#
sed -i "s|time.*$|time \$GEM5_DIR/build/X86/gem5.opt -d ./m5out \$GEM5_DIR/configs/example/se.py -c \$BENCHMARK -o \$ARGUMENT -I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=${L1d} --l1i_size=${L1i} --l2_size=${L2} --l1d_assoc=${L1d_associativity} --l1i_assoc=${L1i_associativity} --l2_assoc=${L2_associativity} --cacheline_size=${Cache_size}|g" $(pwd)/Project1_SPEC/456.hmmer/runGem5.sh


#cd ..
#cd ~/CA/Project1_SPEC/${Benchmark_458}
#
sed -i "s|time.*$|time \$GEM5_DIR/build/X86/gem5.opt -d ./m5out \$GEM5_DIR/configs/example/se.py -c \$BENCHMARK -o \$ARGUMENT -I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=${L1d} --l1i_size=${L1i} --l2_size=${L2} --l1d_assoc=${L1d_associativity} --l1i_assoc=${L1i_associativityiativity} --l2_assoc=${L2_associativity} --cacheline_size=${Cache_size}|g" $(pwd)/Project1_SPEC/458.sjeng/runGem5.sh


#cd ..
#cd  ~/CA/Project1_SPEC/${Benchmark_470}
#
sed -i "s|time.*$|time \$GEM5_DIR/build/X86/gem5.opt -d ./m5out \$GEM5_DIR/configs/example/se.py -c \$BENCHMARK -o '20 reference.dat 0 1 ./data/100_100_130_cf_a.of' -I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=${L1d} --l1i_size=${L1i} --l2_size=${L2} --l1d_assoc=${L1d_associativity} --l1i_assoc=${L1i_associativity} --l2_assoc=${L2_associativity} --cacheline_size=${Cache_size}|g" $(pwd)/Project1_SPEC/470.lbm/runGem5.sh

#cd ../..


# Compilation 
echo -e "****** Earlier files are deleted   ******\n"
cd ./gem5
rm -rf ./build/X86
echo -e "****** COMPILATION STARTS ******\n"
scons build/X86/gem5.opt -j 4 
cd ..


# Building output file for Benchmark 401.bzip2 
echo -e "****** EXECUTING BENCHMARK1 ******\n"
cd ./Project1_SPEC/${Benchmark_401}  
rm -rf m5out
sh runGem5.sh
cd ../..

echo -e "\n"

# Building output file for Benchmark 429.mcf
echo -e "****** EXECUTING BENCHMARK2 ******\n"
cd ./Project1_SPEC/${Benchmark_429} 
rm -rf m5out
sh runGem5.sh
cd ../..

echo -e "\n"

# Building output file for Benchmark 456.hmmer 
echo -e "****** EXECUTING BENCHMARK3 ******\n"
cd ./Project1_SPEC/${Benchmark_456}
rm -rf m5out
sh runGem5.sh
cd ../..

echo -e "\n"

# Building output file for Benchmark 458.sjeng 
echo -e "****** EXECUTING BENCHMARK4 ******\n"
cd ./Project1_SPEC/${Benchmark_458}
rm -rf m5out
sh runGem5.sh
cd ../..

echo -e "\n"

# Building output file for Benchmark 470.lbm 
echo -e "****** EXECUTING BENCHMARK5 ******\n"
cd ./Project1_SPEC/${Benchmark_470}
rm -rf m5out
sh runGem5.sh

echo -e "\n"

echo -e "****** OUTPUT *******\n"

cd /home/010/r/rx/rxl220014/CA/Project1_SPEC/401.bzip2/m5out
echo -e "****** 401.bzip2\n" >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.dcache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.icache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.l2.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
echo -e "\n"

cd /home/010/r/rx/rxl220014/CA/Project1_SPEC/429.mcf/m5out
echo -e "****** 429.mcf\n" >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.dcache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.icache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.l2.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
echo -e "\n"

cd /home/010/r/rx/rxl220014/CA/Project1_SPEC/456.hmmer/m5out
echo -e "****** 456.hmmer\n" >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.dcache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.icache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.l2.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
echo -e "\n"

cd /home/010/r/rx/rxl220014/CA/Project1_SPEC/458.sjeng/m5out
echo -e "****** 458.sjeng\n" >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.dcache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.icache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.l2.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
echo -e "\n"

cd /home/010/r/rx/rxl220014/CA/Project1_SPEC/470.lbm/m5out
echo -e "****** 470.lbm\n" >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.dcache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.cpu.icache.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt
cat stats.txt | grep system.l2.overall_misses >> /home/010/r/rx/rxl220014/CA/output.txt


#./new_final.sh 128kB 128kB 512kB 8 8 4 256 401.bzip2 429.mcf 456.hmmer 458.sjeng 470.lbm


