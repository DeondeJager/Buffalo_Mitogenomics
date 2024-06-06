#!/bin/bash
#SBATCH --job-name=mrbayes_buffaloMitogenomes         # Job name
#SBATCH --mail-type=begin,end,fail      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dejager4@gmail.com  # Where to send mail	
#SBATCH --nodes=1                       # Run all processes on a single node
#SBATCH --ntasks=8                      # Run several tasks
#SBATCH --cpus-per-task=1               # Number of CPU cores per task
#SBATCH --mem-per-cpu=20G                # Memory required per CPU
#SBATCH --time=01:00:00                 # Time limit hrs:min:sec
#SBATCH --output=/projects/mjolnir1/people/username/buffalo_mitogenomes/mrbayes/mrbayes_n86_%j.out        # Standard output log
#SBATCH --error=/projects/mjolnir1/people/username/buffalo_mitogenomes/mrbayes/mrbayes_n86_%j.err         # Standard error log

# The %j in the --output & --error lines tells SLURM to substitute the job ID in the name of the output file
# See: https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts#Sample_SLURM_Scripts 
# and https://help.rc.ufl.edu/doc/Annotated_SLURM_Script

# Print compute node name and the date
hostname; date

# This line prints how many CPUs are being used
# It's a sanity check against your SLURM and software-specific settings
echo "Running job on $SLURM_CPUS_ON_NODE CPU cores"

# Load modules and set up enviroment variables
module purge
module load openmpi/4.1.6
module load mrbayes/3.2.7a

# Navigate to working directory
cd /projects/mjolnir1/people/username/buffalo_mitogenomes/mrbayes

# Insert commands here:
mpirun -np 8 mb WholeMitogenome_n86_MAFFT_MrBayes.nex


