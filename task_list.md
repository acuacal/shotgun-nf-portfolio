# 작업 목록: Shotgun Metagenomics Pipeline

## 초기 설정
- [x] Git 저장소 초기화 및 원격 저장소 푸시 (`git init`, `git remote add ...`, `git push`)
- [x] Nextflow 설치 확인 또는 설치
- [x] Docker 설치 확인 또는 설치

## 파이프라인 구현
- [ ] nf-core/bagobugs 파이프라인 통합 (`>= 2.4.0`)
    - [ ] `-profile test` 또는 `samplesheet.csv`를 사용한 입력 처리 (FR-1)
    - [ ] MetaPhlAn 4 및 HUMAnN 3 사용 확인 (FR-2)
    - [ ] Krona 보고서 생성 확인 (`*_krona.html`) (FR-4)
    - [ ] HUMAnN TSV 출력 확인 (FR-4)
- [ ] nf-core/funcscan 파이프라인 통합 (`>= 2.1.0`)
    - [ ] bagobugs 출력 사용 (FR-3)
    - [ ] RGI (CARD) 및 ABRicate (ResFinder) 실행 (FR-3)
- [ ] hAMRonization 통합
    - [ ] funcscan 결과 병합 (FR-3)
    - [ ] `hamronization_summary.html` 보고서 생성 확인 (FR-4)
- [ ] MultiQC 통합
    - [ ] 모든 관련 보고서 통합 (FR-4)
    - [ ] `multiqc_report.html` 생성 확인 (FR-4)
- [ ] 소프트웨어 버전 고정 (`software_versions.yml`) (FR-6)

## Makefile 및 실행
- [ ] Makefile 생성
    - [ ] `setup`: 필요한 데이터베이스 또는 테스트 데이터 다운로드 (FR-1, FR-5)
    - [ ] `demo`: `-profile test`를 사용하여 데모 실행 (FR-5)
    - [ ] `run`: (선택 사항) 전체 데이터셋 실행용 (초기 범위 아님)
    - [ ] `clean`: 작업 디렉토리 및 결과 정리
    - [ ] `ci`: 지속적 통합 테스트용
    - [ ] `package`: 포트폴리오용 결과 패키징
- [ ] Singularity 프로파일 구성 (`-profile singularity`) (FR-7)
- [ ] 성능 제약 조건 충족 확인 (≤ 30분, ≤ 4 GB RAM for demo) (FR-5)

## 문서화 및 포트폴리오
- [ ] MultiQC 및 Krona 보고서 스크린샷 캡처
- [ ] 포트폴리오 README 초안 작성 