#!/bin/bash
#SBATCH --job-name=xenium_reseg_slide1
#SBATCH --output=xenium_reseg1_%j.out
#SBATCH --error=xenium_reseg1_%j.err
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=256G
#SBATCH --account=coa_lajo247_uksr
#SBATCH --partition=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jm.arbones@uky.edu

export PATH=/scratch/jar301/ranger/xeniumranger-xenium4.0:$PATH

# Slide 1: resegmentation at 0 µm and 3 µm
# Each pipeline is capped to 16 cores and 128 GB RAM

xeniumranger resegment \
  --id=resegment_slide1_0um \
  --xenium-bundle=/scratch/jar301/ranger/dataset/akhil/slide1 \
  --expansion-distance=0 \
  --jobmode=local \
  --localcores=16 \
  --localmem=128 &

xeniumranger resegment \
  --id=resegment_slide1_3um \
  --xenium-bundle=/scratch/jar301/ranger/dataset/akhil/slide1 \
  --expansion-distance=3 \
  --jobmode=local \
  --localcores=16 \
  --localmem=128 &

wait

