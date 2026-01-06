#!/bin/bash
#SBATCH --job-name=xenium_reseg_slide1.2
#SBATCH --output=xenium_reseg1_%j.out
#SBATCH --error=xenium_reseg1_%j.err
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=256G
#SBATCH --account=coa_lajo247_uksr
#SBATCH --partition=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jm.arbones@uky.edu

export PATH=/scratch/jar301/ranger/xeniumranger-xenium4.0:$PATH

# Slide 1: resegmentation at 10 µm and 20 µm
# Each pipeline is capped to 32 cores and 128 GB RAM

xeniumranger resegment \
  --id=resegment_slide1_10um \
  --xenium-bundle=/scratch/jar301/ranger/dataset/akhil/slide1 \
  --expansion-distance=10 \
  --jobmode=local \
  --localcores=32 \
  --localmem=128 &

xeniumranger resegment \
  --id=resegment_slide1_20um \
  --xenium-bundle=/scratch/jar301/ranger/dataset/akhil/slide1 \
  --expansion-distance=20 \
  --jobmode=local \
  --localcores=32 \
  --localmem=128 &

wait

