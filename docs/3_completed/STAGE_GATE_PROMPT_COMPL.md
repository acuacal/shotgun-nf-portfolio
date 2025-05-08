Context: Feature is *Completed*.

1. Read README/spec/design/task_list/implementation_notes.
2. Create `summary.md` (1-3 paragraphs):
   - Purpose, what was built, key design calls, runtime benchmarks.
3. Produce single-line log entry for `_reference/completed_features_log.md`:
   **[Shotgun Metagenomics Pipeline]:** Completed 2025-05-02. One-day, reproducible nf-core workflow incl. ARG profiling.
4. Suggest which headings in `_reference/architecture.md` may need updates
   (e.g., "Workflow Catalog", "Container Strategy").
5. Print summary, log line, and suggestions.
6. Save summary.md then run:
     ./scripts/vc.sh "docs: add summary & log entry for {{FEATURE_NAME}}"