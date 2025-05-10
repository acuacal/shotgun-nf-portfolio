# STAGE_GATE_PROMPT_PROG.md
> **Context**  
> A feature folder has been moved into `docs/2_inprogress/`  
> and referenced here with @ (e.g. @shotgun-metagenomics-pipeline).

---

## Instructions

1. **Analyse Plan**  
   Read `README.md`, `spec.md`, and `design.md` inside the referenced folder  
   to understand scope, database paths, hybrid profiles, etc.

2. **Generate `task_list.md`** inside the same folder with this structure:

   # task_list.md

   ## 🚀 Quick-start run commands
   - [ ] Run pipeline via `make run slug=initial-test args="-profile docker"`
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

3. Suggest creating implementation_notes.md for daily logs and decisions.

4. Version-control
   - ./scripts/vc.sh "docs: add task list & impl notes for {{FEATURE_NAME}}"

5. Output to chat

   - Render the new task_list.md checklist.
   - Confirm commit hash pushed to remote.

6. Continue executing tasks unless told otherwise.

**Notes for Cursor**
   - Replace {{FEATURE_NAME}} with the actual folder name.
   - make run relies on scripts/run_nf.sh; ensure the command example remains intact.