Context: Feature folder entered *In Progress*.

1. Parse README/spec/design and generate `task_list.md`:
   - Init Git repo & push remote
   - Install Nextflow & Docker
   - Pull nf-core/bagobugs mini-dataset
   - Integrate nf-core/funcscan
   - Add Makefile targets (setup, demo, ci)
   - Capture MultiQC/Krona screenshots
   - Draft portfolio README
2. Suggest creating `implementation_notes.md` for daily progress.
3. Output both file contents.
4. Continue executing tasks unless told otherwise.
5. After writing task_list.md run:
     ./scripts/vc.sh "docs: add task list for {{FEATURE_NAME}}"
6. For **each** task you complete, finish with:
     ./scripts/vc.sh "feat: {{TASK_SUMMARY}}"