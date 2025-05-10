# Fix Plan for 20250510-fix-initial-params

- [ ] **Correct Syntax in `main.nf`**:
    - Modify `main.nf` at line 90 to remove the erroneous backslashes before the triple quotes in the `log.info` block.
    - Change `log.info \"\"\"` back to `log.info """`.
- [ ] **Re-run the pipeline**:
    - After applying the fix, re-run with `make run slug=fix-syntax-error args="-profile docker -resume"` (using a new slug). 