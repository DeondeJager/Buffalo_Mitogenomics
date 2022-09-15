#!/bin/bash
#PBS -l select=1:ncpus=24:nodetype=haswell_reg
#PBS -P CBBI1030
#PBS -q smp
#PBS -l walltime=1:00:00
#PBS -o /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/A_243_14/mapping.out
#PBS -e /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/A_243_14/mapping.err
#PBS -m abe
#PBS -N A_243_14_mitomapping
#PBS -M dejager4@gmail.com

# Check health of node
module add chpc/healthcheck/0.2
healthcheck -v || exit 1
module del chpc/healthcheck/0.2

# Navigate to directory
cd /mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap/A_243_14

# Load required modules
module add chpc/BIOMODULES
module add bwa/0.7.17
module add samtools/1.9

# Set up environment variables
REF=/mnt/lustre/users/djager/mtgenomesNOVOplasty/Mitogenomes_to_remap
READS=/mnt/lustre/users/djager/buf_clean/read_files

# Index mitogenome
bwa index -p A_243_14 -a is A_243_14.fasta

# Map reads
bwa mem -M -a -t 24 $REF/A_243_14/A_243_14 $READS/A_243_14_DSW37619_HCT32ALXX_L8_clean_1P.fq.gz $READS/A_243_14_DSW37619_HCT32ALXX_L8_clean_2P.fq.gz | samtools view -@ 24 -b - | samtools sort -@ 24 -o $REF/A_243_14/A_243_14.mitogenome.bwa.sorted.bam -O bam /dev/stdin

# Index the BAM file
samtools index -@ 24 A_243_14.mitogenome.bwa.sorted.bam

