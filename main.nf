// main.nf
// Main Nextflow script for the Shotgun Metagenomics Pipeline

nextflow.enable.dsl=2

// Define parameters
params.input = '''https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/delete_me/microbiome/illumina_PE_ERR123456_subset.csv''' // Path to samplesheet.csv, e.g., 'samplesheet.csv'
params.outdir = 'results'
params.multiqc_title = "Shotgun Metagenomics Portfolio Pipeline"

/*
// Include nf-core modules/subworkflows if this were a custom pipeline from scratch
// For now, we are chaining two full nf-core pipelines.

workflow {
    // Channel for input samplesheet
    ch_input = Channel.fromPath(params.input)

    // 1. Run nf-core/bagobugs
    BAGOBUGS ( ch_input ) // Assuming bagobugs can take a samplesheet channel directly

    // 2. Run nf-core/funcscan using output from bagobugs
    // We need to define how to get the correct input for funcscan from bagobugs' output
    // This is a simplified representation. Actual connection will be more complex.
    // For example, funcscan might need paths to QC'd reads or assemblies.
    FUNCSCAN ( BAGOBUGS.out.cleaned_reads ) // Placeholder for actual output channel

    // 3. (Optional) hAMRonization is typically part of funcscan or run after it.
    // If funcscan itself produces the hAMRonization summary, we don't need a separate step.
    // Otherwise, we'd call it here using funcscan's ARG outputs.

    // 4. MultiQC will be run by Nextflow automatically if `multiqc` module is present
    // or by the nf-core pipelines themselves.
}

// Subworkflow/process definitions for BAGOBUGS and FUNCSCAN
// These would typically be `include { BAGOBUGS } from 'nf-core/bagobugs/main.nf'` if using as modules
// But here we are trying to invoke them as full pipeline runs. This approach is non-standard.

// A more standard nf-core way to chain pipelines is often manual or via helper scripts,
// or by developing a new pipeline that IMPORTS modules/subworkflows from existing ones.

// For now, let's assume scripts/run_nf.sh handles the sequential execution
// and this main.nf might be a conceptual placeholder or used for a more integrated setup later.

// Placeholder for BAGOBUGS process (conceptual)
process BAGOBUGS {
    input:
    path samplesheet

    output:
    // Define expected outputs, e.g., path "cleaned_reads/*" into cleaned_reads
    path "results_bagobugs" // Placeholder

    script:
    """
    nextflow run nf-core/bagobugs \
        --input ${samplesheet} \
        --outdir results_bagobugs \
        ${params.profile ? "-profile ${params.profile}" : ""} \
        // Add other bagobugs specific parameters here
        --metaphlan_db '~/metadb/mpa_vJan21_CHOCOPhlAnSGB_202103' \
        --humann_db '~/metadb/humann_db/'
    """
}

// Placeholder for FUNCSCAN process (conceptual)
process FUNCSCAN {
    input:
    path cleaned_reads_dir // Placeholder for input from bagobugs

    output:
    path "results_funcscan"

    script:
    // Funcscan needs a samplesheet or direct input paths.
    // If taking reads, we'd need to create a samplesheet for it from bagobugs output.
    """
    echo "Funcscan would run here with input from ${cleaned_reads_dir}" 
    // This is highly simplified. A real implementation needs to create a samplesheet for funcscan
    // or pass arguments for --reads, --contigs etc.
    // nextflow run nf-core/funcscan \
    //    --input <funcscan_samplesheet> \
    //    --outdir results_funcscan \
    //    ${params.profile ? "-profile ${params.profile}" : ""} \
    //    // Add other funcscan specific parameters
    mkdir results_funcscan // Create dummy output for now
    """
}
*/

log.info \"\"\"
         S H O T G U N  M E T A G E N O M I C S     P I P E L I N E
         ===========================================================
         Input Samplesheet: ${params.input}
         Output Directory : ${params.outdir}
         Profile          : ${workflow.profile ?: 'none'}

         See docs/README.md for more information.
\"\"\".stripIndent() 