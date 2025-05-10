# Fix Plan for Syntax Error in main.nf

- [ ] `main.nf` 파일의 92번째 줄에서 `log.info \"\"\"`를 `log.info """`로 수정합니다.
- [ ] `task_list.md`의 `Bug-fixes (20250510-fix-initial-params)` 섹션에서 "Correct Syntax in `main.nf`" 항목을 완료([x])로 표시합니다.
- [ ] 수정된 파이프라인을 다시 실행합니다: `make run slug=fix-syntax-error args="-profile docker -resume"`.
- [ ] `task_list.md`의 `Bug-fixes (20250510-fix-initial-params)` 섹션에서 "Re-run the pipeline" 항목을 완료([x])로 표시합니다 (성공 시). 