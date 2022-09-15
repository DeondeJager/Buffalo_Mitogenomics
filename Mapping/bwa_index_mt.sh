#!/bin/bash
#PBS -l select=1:ncpus=24:nodetype=haswell_reg
#PBS -P CBBIXXXX
#PBS -q smp
#PBS -l walltime=4:00:00
#PBS -o /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/bwa_index_mt.out
#PBS -e /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/bwa_index_mt.err
#PBS -m abe
#PBS -N bwa_index_mt
#PBS -M dejager4@gmail.com

module add chpc/BIOMODULES
module add bwa/0.7.17

cd /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/A_268_14
bwa index -p A_268_14 -a is A_268_14.fasta

cd ../B98_161
bwa index -p B98_161 -a is B98_161.fasta

cd ../B98_396
bwa index -p B98_396 -a is B98_396.fasta

cd ../B98_597
bwa index -p B98_597 -a is B98_597.fasta

cd ../HC_20
bwa index -p HC_20 -a is HC_20.fasta

cd ../HC_32
bwa index -p HC_32 -a is HC_32.fasta

cd ../HC_41
bwa index -p HC_41 -a is HC_41.fasta

cd ../HC_48
bwa index -p HC_48 -a is HC_48.fasta

cd ../M_301_14
bwa index -p M_301_14 -a is M_301_14.fasta

cd ../M_306_14
bwa index -p M_306_14 -a is M_306_14.fasta

