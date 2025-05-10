// main.nf
// Main Nextflow script for the Shotgun Metagenomics Pipeline

nextflow.enable.dsl=2

// Define parameters
params.input = 'assets/samplesheet_paired_end_gg200.csv' // Path to samplesheet.csv, e.g., 'samplesheet.csv'
params.outdir = 'results' // This will be the main outdir for the meta-pipeline
params.multiqc_title = "Shotgun Metagenomics Portfolio Pipeline"

// Define sub-pipeline output directories
params.bagobugs_outdir = "${params.outdir}/bagobugs_results"
params.funcscan_outdir = "${params.outdir}/funcscan_results"


workflow {
    ch_input_samplesheet = Channel.fromPath(params.input)

    // 1. Run nf-core/bagobugs
    BAGOBUGS ( ch_input_samplesheet )

    // 2. Run nf-core/funcscan using output from bagobugs
    FUNCSCAN ( BAGOBUGS.out.bagobugs_results_path )
}

// Process to run nf-core/bagobugs
process BAGOBUGS {
    tag "bagobugs_on_${params.input.split('/')[-1]}"

    input:
    path samplesheet

    output:
    path params.bagobugs_outdir, emit: bagobugs_results_path

    script:
    """
    echo "Running nf-core/bagobugs..."
    mkdir -p ${params.bagobugs_outdir} 
    
    nextflow run nf-core/bagobugs \
        --input ${samplesheet} \
        --outdir ${params.bagobugs_outdir} \
        -profile test,${workflow.profile} \
        -resume 
    """
}

// Process to run nf-core/funcscan
process FUNCSCAN {
    tag "funcscan_after_bagobugs"

    input:
    path предыдущий_output_dir // Placeholder, will be bagobugs_output_dir from BAGOBUGS.out.bagobugs_results_path

    output:
    path params.funcscan_outdir, emit: funcscan_results_path

    script:
    // The input 'предыдущий_output_dir' corresponds to 'bagobugs_output_dir' from the workflow.
    """
    echo "Running nf-core/funcscan on outputs from ${предыдущий_output_dir}..."
    mkdir -p ${params.funcscan_outdir}

    nextflow run nf-core/funcscan \
        --input ${предыдущий_output_dir} \
        --outdir ${params.funcscan_outdir} \
        -profile test,${workflow.profile} \
        -resume
    """
}

log.info """
         S H O T G U N  M E T A G E N O M I C S     P I P E L I N E
         ===========================================================
         Input Samplesheet: ${params.input}
         Output Directory : ${params.outdir}
         Profile          : ${workflow.profile ?: 'none'}

         See docs/README.md for more information.
""" 