## Root Cause
- `main.nf`의 `BAGOBUGS` 프로세스 내에서 `nextflow run nf-core/bagobugs` 명령을 실행할 때, Nextflow가 GitHub에서 `nf-core/bagobugs` 파이프라인의 소스 코드(manifest, `nextflow.config`, `main.nf` 등)를 가져오는 데 실패했습니다.
- 오류 메시지:
  ```
  Pulling nf-core/bagobugs ...
  WARN: Cannot read project manifest -- Cause: Remote resource not found: https://api.github.com/repos/nf-core/bagobugs/contents/nextflow.config
  Remote resource not found: https://api.github.com/repos/nf-core/bagobugs/contents/main.nf
  ```
- 이는 실행 환경(예: WSL)에서 `api.github.com` 또는 관련 GitHub 리소스에 대한 네트워크 연결 문제일 가능성이 높습니다. 이전 샘플시트 다운로드 실패와 유사한 원인일 수 있습니다.

## Evidence
- **오류 로그 (`error_log.txt`)** (위의 오류 메시지 부분 참조) 