# 구현 노트: Shotgun Metagenomics Pipeline

## 날짜: YYYY-MM-DD

*   (여기에 오늘의 진행 상황, 문제점, 해결책 등을 기록하세요)

---
## 날짜: 2025-05-09

*   `nextflow run nibscbioinformatics/nf-core-bagobugs -profile test,docker --outdir ./results_bagobugs_test` 실행 시 `ERROR ~ No such file or directory: /Data/metagenomics/metaphlan_databases` 발생.
    *   원인: 파이프라인이 `test` 프로파일에서 MetaPhlAn 데이터베이스의 기본 경로를 `/Data/metagenomics/metaphlan_databases`로 예상하지만, 해당 경로가 존재하지 않음.
    *   해결 시도: `--metaphlan_database ./db/metaphlan_test_db` 파라미터를 추가하여 데이터베이스 경로를 명시적으로 지정함.
    *   수정된 명령어: `nextflow run nibscbioinformatics/nf-core-bagobugs -profile test,docker --outdir ./results_bagobugs_test --metaphlan_database ./db/metaphlan_test_db`

--- 