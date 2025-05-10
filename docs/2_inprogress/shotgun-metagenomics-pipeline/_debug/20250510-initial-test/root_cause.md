# Root Cause Analysis for 20250510-initial-test

## Root Cause

The pipeline failed due to two main issues in `main.nf`:
1.  **Undefined Parameter Access**: The script attempts to access `params.profile` (e.g., in the conceptual `BAGOBUGS` process script block: `${params.profile ? "-profile ${params.profile}" : ""}`), but `params.profile` is not explicitly initialized with a default value in `main.nf` or `nextflow.config`. When `nextflow run` is invoked with `-profile <name>`, this activates a configuration profile but doesn't automatically populate a `params.profile` variable with the profile name string.
2.  **Invalid Input Channel**: The input channel `ch_input` is created using `Channel.fromPath(params.input)`. The default value for `params.input` is `false` (as defined in `main.nf`), which is not a valid file path. This leads to the "Missing `fromPath` parameter" error.

## Evidence

Log snippets from `docs/2_inprogress/shotgun-metagenomics-pipeline/_debug/20250510-initial-test/error_log.txt`:

```
WARN: Access to undefined parameter `profile` -- Initialise it to a default value eg. `params.profile = some_value`

S H O T G U N  M E T A G E N O M I C S     P I P E L I N E
===========================================================
Input Samplesheet: false
Output Directory : results
Profile          : none  // This 'none' comes from ${params.profile ?: 'none'}

See docs/README.md for more information.

Missing `fromPath` parameter -- Check script 'main.nf' at line: 16 or see '.nextflow.log' file for more details
```

Relevant `main.nf` lines:

Line 7: `params.input = false`
Line 16: `ch_input = Channel.fromPath(params.input)`
Line 42 (conceptual BAGOBUGS process): `${params.profile ? "-profile ${params.profile}" : ""}` 