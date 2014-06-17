#!/bin/bash
#
# ns3 serial PBS job.
#
#PBS -q production
#PBS -N ns3_pmodel
#PBS -l select=1:ncpus=1
#PBS -l place=free
#PBS -V

# Find out name of compute node
hostname
# Change to working directory
PBS_HOME=/home/c.alvarez/build

cd $PBS_O_WORKDIR
pmodel=(1 2 3 4)
     for i in "${pmodel[@]}"; do
        /home/c.alvarez/build/scratch/main-propagation-loss --pmodel=$i --out=plot$i.ps > plots/$i.out 2>&1
     done

