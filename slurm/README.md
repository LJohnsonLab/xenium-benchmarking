# SLURM Job Scripts

SLURM batch scripts for running Xenium Ranger resegmentation on the University of Kentucky MCC cluster.

## Scripts

### `20251229b_task_slide1_resegmentation_0_3micrometers.sh`
Runs two parallel resegmentation jobs (0µm and 3µm expansion):
- Resource allocation: 32 CPUs, 256GB RAM, 48-hour limit
- Each job uses 16 cores and 128GB RAM

### `20251230_task_slide1_resegmentation_10_20micrometers.sh`
Runs two parallel resegmentation jobs (10µm and 20µm expansion):
- Resource allocation: 64 CPUs, 256GB RAM, 48-hour limit
- Each job uses 32 cores and 128GB RAM

## Usage

Submit a job to SLURM:
```bash
sbatch 20251229b_task_slide1_resegmentation_0_3micrometers.sh
```

## Configuration
- **Input data**: `/scratch/jar301/ranger/dataset/akhil/slide1`
- **Xenium Ranger version**: 4.0
- **Account**: `coa_lajo247_uksr`
- **Email notifications**: Sent to `jm.arbones@uky.edu`
