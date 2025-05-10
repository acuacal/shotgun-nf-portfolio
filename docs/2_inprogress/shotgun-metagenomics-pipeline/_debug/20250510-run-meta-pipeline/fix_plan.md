# Fix Plan for SampleSheet Staging Failure

- [ ] **네트워크 접근성 확인**:
    - WSL 터미널에서 다음 명령을 실행하여 샘플시트 URL에 접근 가능한지 확인합니다:
      ```bash
      curl -ILS https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/delete_me/microbiome/illumina_PE_ERR123456_subset.csv
      ```
    - 또는 `wget https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/delete_me/microbiome/illumina_PE_ERR123456_subset.csv` 명령으로 다운로드를 시도합니다.
- [ ] **로컬 파일 사용 (네트워크 문제 지속 시)**:
    - 만약 네트워크 접근성 문제가 해결되지 않으면, 샘플시트 파일을 수동으로 작업 공간 내 (예: `assets/`)에 다운로드합니다.
    - `main.nf` 또는 `nextflow.config`에서 `params.input` 값을 해당 로컬 파일 경로로 수정합니다. (예: `params.input = 'assets/illumina_PE_ERR123456_subset.csv'`)
- [ ] **파이프라인 재실행**: 
    - 문제가 해결되면 파이프라인을 `-resume` 옵션과 함께 재실행합니다.
      `make run slug=fix-staging args="-profile docker -resume"` 