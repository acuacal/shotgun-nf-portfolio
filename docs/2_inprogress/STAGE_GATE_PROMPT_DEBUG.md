**Context**  
An error log was saved inside `_debug/<YYYYMMDD-slug>/error_log.txt`  
and referenced with `@` in this chat.

---

## Instructions

1. **Read the Error Log**  
   - Open the referenced `@error_log.txt`.  
   - Summarise the root cause in *max three* bullet points.
   - Search the same folder for any `cw_*.txt` or `nextflow_meta.log` and include relevant snippets in `root_cause.md` evidence.

2. **Write `root_cause.md`**  
   Include:  
   - **Root Cause** – concise description.  
   - **Evidence** – log snippets or file paths that prove it.
   - If the error stems from outdated or conflicting information in
     `README.md`, `spec.md`, or `design.md`, record that fact and quote the offending snippet.   

3. **Create `fix_plan.md`**  
   - A markdown checklist of concrete steps to resolve the issue.  
   - Typical items:  
     - `[ ]` Download / move missing database files.  
     - `[ ]` Update `nextflow.config › params.*` path(s).  
     - `[ ]` Re-run the pipeline with `-resume`.  
   - Put the file next to `root_cause.md` inside the same `_debug/…` folder.
   - Include code/database fixes **and** any required documentation edits
     (e.g. update examples, correct paths, revise design rationale).   

4. **Regenerate `task_list.md`**
   1. Load the current `task_list.md`.
   2. Mark any steps already completed during this debug session as checked.
   3. Remove or rewrite items that are no longer valid.
   4. Merge the checklist items from `fix_plan.md`
      into the appropriate sections (🚀 Quick-start, 🔨 Implementation tasks,
      or create a new 🔧 “Fixes in progress” if they don’t fit).
   5. Overwrite the original `task_list.md` with the updated content.
   6. Merge fix_plan items into the appropriate sections.
   7. If documentation needs changes, add a “📚 Docs-fixes” group or place the checklist within “🔨 Implementation tasks”.   

5. **Version-Control**  
   Run the helper script to snapshot this debug session:  
   ```bash
   ./scripts/vc.sh "fix: record $(basename $(dirname $PWD))/db-error & create fix plan"

6. **Output to Chat**
   - Show the contents of root_cause.md.
   - Show the contents of fix_plan.md.
   - Confirm that tasks were appended and commit was pushed.
   
7. Continue executing tasks unless told otherwise.

<!-- 7. **Stop**
   - Wait for the user to approve or edit fix_plan.md before executing any steps. -->

**Notes for Cursor**
   - Use the existing helper script scripts/vc.sh for Git add/commit/push.
   - Do not execute the fix steps yet—only create and commit the plan.
   - All paths are relative to the feature’s root folder.
   - The error log is always at `docs/2_inprogress/shotgun-metagenomics-pipeline/_debug/*/error_log.txt` so you can auto-detect the latest folder if the user doesn’t @-reference it.