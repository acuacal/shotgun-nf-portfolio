#!/usr/bin/env bash
set -x # Enable debug output
# Usage: ./scripts/run_nf.sh <slug> <nextflow-args…>
# Example: ./scripts/run_nf.sh db-path-fail -profile docker -resume

slug="$1"; shift                       # 첫 인수 = 짧은 설명
ts=$(date +%Y%m%d)
dbg_dir="docs/2_inprogress/shotgun-metagenomics-pipeline/_debug/${ts}-${slug}"

mkdir -p "$dbg_dir"

# 실제 Nextflow 실행 ⬇; 모든 STDOUT/ERR 을 로그 파일로 tee
nextflow run main.nf "$@" 2>&1 | tee "${dbg_dir}/error_log.txt"
exit_code=${PIPESTATUS[0]}

if [[ $exit_code -ne 0 ]]; then
  echo -e "\n❌ Pipeline failed (exit $exit_code)."
  echo "   Error log saved to ${dbg_dir}/error_log.txt"
  echo "   Next step: ask Cursor ⇒  Run debug gate for @${dbg_dir#docs/}/error_log.txt"
else
  echo -e "\n✅ Pipeline finished successfully."
fi

exit $exit_code

if [[ $exit_code -ne 0 ]]; then
  # (1) capture metadata of the failed run
  nf_log="${dbg_dir}/nextflow_meta.log"
  nextflow log $(nextflow log | tail -1 | awk '{print $1}') > "$nf_log"

  # (2) OPTIONAL: pull last 200 lines of each failed Batch job
  jq -r '.processes[] | select(.status=="FAILED") | .containerId' "$nf_log" | while read jobid; do
      aws logs get-log-events \
          --log-group-name /aws/batch/job \
          --log-stream-name "${jobid}/default" \
          --limit 200 \
          --output text > "${dbg_dir}/cw_${jobid}.txt" || true
  done
fi
