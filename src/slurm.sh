#!/bin/tcsh
#
##SBATCH -p common                # Partition to submit to (comma separated)
#SBATCH -J splitRef5         # Job name
#SBATCH -n 1                     # Number of cores
#SBATCH -N 1                     # Ensure that all cores are on one machine
#SBATCH -t 24-00:00                # Runtime in D-HH:MM (or use minutes)
#SBATCH --mem 10000               # Memory in MB
#SBATCH -o _alignSplitRefs_%j.out # File for STDOUT (with jobid = %j) 
#SBATCH -e alignSplitRefs_%j.err       # File for STDERR (with jobid = %j)   


module load cutadapt/1.8.3-gcb01 
module load fastqc/0.11.5-fasrc01
module load java/1.7.0_60-fasrc01
module load jdk/9-gcb01

./splitSyncReadsMultiRef.pl 2 /data/taylorlab/embatalk/refs/AMA/AMA.fasta,/data/taylorlab/embatalk/refs/CSP/CSP.fasta /data/taylorlab/embatalk/out_phase_5 /data/taylorlab/embatalk/raw_reads/phase_5/1 /data/taylorlab/embatalk/raw_reads/phase_5/2 /data/taylorlab/embatalk/adapters/forwardPrimers.fasta /data/taylorlab/embatalk/adapters/reversePrimers.fasta
