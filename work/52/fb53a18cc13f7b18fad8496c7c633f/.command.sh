#!/bin/bash -ue
echo "Running nf-core/bagobugs..."
mkdir -p results/bagobugs_results 

nextflow run nf-core/bagobugs         --input samplesheet_paired_end_gg200.csv         --outdir results/bagobugs_results         -profile test,docker         -resume
