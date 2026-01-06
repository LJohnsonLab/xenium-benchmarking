# Resegmented Xenium Ranger Outputs from SLIDE 1

## Overview

This directory contains multiple Xenium Ranger resegmentation analyses of Slide1, each using different cell expansion parameters. The purpose is to benchmark how different cell boundary expansion distances affect downstream analysis results.

## Directory Structure

The repository is organized into five subdirectories, each representing a different cell expansion parameter:

-   `expansion0um/` - (no expansion)
-   `expansion3um/` - 3 micrometer cell boundary expansion
-   `expansion5um/` - 5 micrometer cell boundary expansion **DEFAULT**
-   `expansion10um/` - 10 micrometer cell boundary expansion
-   `expansion20um/` - 20 micrometer cell boundary expansion

### Common Output Files

Each expansion subdirectory contains identical Xenium Ranger output file structures:

| File/Directory | Description |
|----------------------------------------|--------------------------------|
| `analysis/` | Directory containing analysis outputs and visualizations |
| `analysis_summary.html` | HTML summary report of the analysis |
| `analysis.zarr.zip` | Compressed zarr archive of analysis data |
| `aux_outputs/` | Auxiliary output files |
| `cell_boundaries.csv.gz` | Cell boundary coordinates (compressed CSV) |
| `cell_boundaries.parquet` | Cell boundary coordinates (Parquet format) |
| `cell_feature_matrix/` | Gene expression matrix directory |
| `cell_feature_matrix.h5` | Gene expression matrix (HDF5 format) |
| `cell_feature_matrix.zarr.zip` | Gene expression matrix (compressed zarr) |
| `cells.csv.gz` | Cell metadata (compressed CSV) |
| `cells.parquet` | Cell metadata (Parquet format) |
| `cells.zarr.zip` | Cell metadata (compressed zarr) |
| `experiment.xenium` | Xenium experiment metadata |
| `gene_panel.json` | Gene panel definition |
| `metrics_summary.csv` | Summary metrics for the analysis |
| `morphology_focus/` | Morphology focus stack images |
| `nucleus_boundaries.csv.gz` | Nuclear boundary coordinates (compressed CSV) |
| `nucleus_boundaries.parquet` | Nuclear boundary coordinates (Parquet format) |
| `transcripts.parquet` | Individual transcript locations and assignments |

## Data Transfer Scripts

Each subdirectory contains a shell script for downloading the corresponding Xenium Ranger output from remote compute resources:

### `expansion3um/00-rsync_fromMCC.sh`

Transfers 3um expansion results from University of Kentucky MCC cluster: - Source: `jar301@mcc.uky.edu:/scratch/jar301/ranger/resegment_slide1_3um/outs/` - Excludes: `morphology.ome.tif`, `transcripts.zarr.zip` (large files)

### `expansion5um/00-rsync_fromT9.sh`

Transfers 5um expansion results (default analysis) from local T9 drive: - Source: `/Volumes/T9/Xenium_ARIA/Slide1_output-XETG00118__0021991__Region_1__20250606__202953` - Excludes: `morphology.ome.tif`, `transcripts.zarr.zip`

### `expansion10um/00-rsync_fromMCC.sh`

Transfers 10um expansion results from MCC cluster: - Source: `jar301@mcc.uky.edu:/scratch/jar301/ranger/resegment_slide1_10um/outs/` - Excludes: `morphology.ome.tif`, `transcripts.zarr.zip`

### `expansion20um/00-rsync_fromMCC.sh`

Transfers 20um expansion results from MCC cluster: - Source: `jar301@mcc.uky.edu:/scratch/jar301/ranger/resegment_slide1_20um/outs/` - Excludes: `morphology.ome.tif`, `transcripts.zarr.zip`

## Usage

### Running Data Transfer

To download or update data for a specific expansion parameter:

1.  Navigate to the target subdirectory:

    ``` bash
    cd Slide1_resegmented_XeniumRanger/expansion3um
    ```

2.  Execute the rsync script:

    ``` bash
    bash 00-rsync_fromMCC.sh
    # or for expansion5um
    bash 00-rsync_fromT9.sh
    ```

The rsync command uses the following options: - `-P`: Show progress and allow resuming interrupted transfers - `-a`: Archive mode (preserves permissions, timestamps) - `-z`: Compress data during transfer - `-v`: Verbose output

### File Exclusions

The large morphology and zarr transcript files are excluded from transfer to save space and time: - `morphology.ome.tif` - High-resolution morphology images - `transcripts.zarr.zip` - Large zarr-format transcript data

These can be downloaded separately if needed by removing the `--exclude` flags.

## Data Sources

-   **MCC Cluster**: University of Kentucky Medical Center Computing cluster runs (3um, 10um, 20um expansions)
-   **T9 Drive**: Local external drive containing the default/5um analysis