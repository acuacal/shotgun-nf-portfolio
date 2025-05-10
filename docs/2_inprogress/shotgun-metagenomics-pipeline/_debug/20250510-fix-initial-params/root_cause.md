# Root Cause Analysis for 20250510-fix-initial-params

## Root Cause
- `main.nf` 파일의 92번째 줄 `log.info` 블록 시작 부분에 잘못된 백슬래시(`\`)가 사용되어 Nextflow 스크립트 컴파일 오류가 발생했습니다.

## Evidence
- **오류 로그 (`error_log.txt`)**:
  ```
  ERROR ~ Script compilation error
  - file : /home/acuacal/project/shotgun-nf-portfolio/main.nf
  - cause: Unexpected character: '\' @ line 92, column 10.
     log.info \"\"\"
              ^
  ```
- **`main.nf` (오류 발생 지점)**:
  ```groovy
  // ... 이전 코드 ...
  log.info \"\"\"
           S H O T G U N  M E T A G E N O M I C S     P I P E L I N E
  // ... 이후 코드 ...
  ```
Path to error log: `docs/2_inprogress/shotgun-metagenomics-pipeline/_debug/20250510-fix-initial-params/error_log.txt` 