# task_list.md

## 🚀 Quick-start run commands
- [x] Run pipeline via `make run slug=initial-test args="-profile docker"`
  > After each bug-fix, rerun with  
  > `make run slug=<new-slug> args="-profile docker -resume"`

## 🔨 Implementation tasks
- [ ] Install Docker Desktop & enable WSL integration
- [ ] Download mini databases to `~/metadb/`
- [ ] Add `conf/hybrid.config` for AWS Batch
- [ ] Verify `nextflow config -profile hybrid` merges correctly
- [ ] Capture MultiQC & Krona screenshots
- [ ] Add Makefile targets (setup, demo, ci)

## ✅ Definition of done
- [ ] Pipeline passes locally (`make run …` returns 0)
- [ ] Hybrid profile succeeds on AWS Batch
- [ ] README updated with exact commands & runtimes 

## 🔴 Bug-fixes (20250510-initial-test)
- [ ] **Initialize `params.input` in `main.nf`**:
    - Modify `main.nf` to provide a valid default for `params.input`.
    - For initial testing, use a relevant nf-core test samplesheet, for example:
      `params.input = '''https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/delete_me/microbiome/illumina_PE_ERR123456_subset.csv'''` (or a similar test samplesheet suitable for bagobugs/funcscan if this one is not appropriate).
- [ ] **Handle Profile Information Correctly in `main.nf`**:
    - For the `log.info` block in `main.nf`, change `params.profile ?: 'none'` to `workflow.profile ?: 'none'` to correctly display active profile(s).
    - Ensure `scripts/run_nf.sh` is correctly passing the `-profile` argument to sub-pipeline `nextflow run` commands. If so, direct usage of `params.profile` within `main.nf` process script blocks might be unnecessary and can be reviewed/removed to avoid conflicts.
- [ ] **Review and Refine `main.nf` Structure (as per Option A from task_list.md for now)**:
    - Given `scripts/run_nf.sh` is intended to handle sequential execution of nf-core pipelines, simplify `main.nf`.
    - The goal is to make `main.nf` a very basic Nextflow script, primarily for `nextflow info .` or as a placeholder if it evolves into a true meta-pipeline later.
    - This might involve removing or commenting out complex workflow/process blocks in `main.nf` that might conflict with `scripts/run_nf.sh`'s role.
- [ ] **Re-run the pipeline**:
    - After applying fixes, re-run with `make run slug=fix-initial-params args="-profile docker -resume"` (using a new slug).

## 🔴 Bug-fixes (20250510-fix-initial-params)
- [ ] **Correct Syntax in `main.nf`**:
    - Modify `main.nf` at line 90 to remove the erroneous backslashes before the triple quotes in the `log.info` block.
    - Change `log.info \"\"\"` back to `log.info """`.
- [ ] **Re-run the pipeline**:
    - After applying the fix, re-run with `make run slug=fix-syntax-error args="-profile docker -resume"` (using a new slug).