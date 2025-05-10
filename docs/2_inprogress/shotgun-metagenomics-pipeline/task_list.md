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