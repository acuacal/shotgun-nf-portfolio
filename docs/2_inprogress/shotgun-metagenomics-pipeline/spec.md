# Spec: Shotgun Metagenomics Pipeline

## 상세 흐름 (Detailed Flow)
1.  **입력**: 짧은 읽기 FASTQ 파일 (`samplesheet.csv` 또는 데모 데이터).
2.  **nf-core/bagobugs (≥ 2.4.0)** 실행:
    *   QC 수행.
    *   MetaPhlAn 4를 사용한 분류학적 프로파일링.
    *   HUMAnN 3을 사용한 기능적 프로파일링.
    *   QC된 읽기/컨티그 생성.
    *   bagobugs 관련 보고서 생성 (Krona 등).
3.  **nf-core/funcscan (≥ 2.1.0)** 실행:
    *   bagobugs의 QC된 출력 사용.
    *   CARD (RGI) 및 ResFinder (ABRicate)를 사용한 항생제 내성 유전자 (ARG) 검출.
4.  **hAMRonization**: funcscan 결과를 병합하고 요약 보고서 생성.
5.  **MultiQC**: 모든 파이프라인 단계의 로그 및 보고서를 단일 보고서로 통합.
6.  **출력**: `multiqc_report.html`, `*_krona.html`, HUMAnN TSV, `hamronization_summary.html`, 버전 정보 (`software_versions.yml`).

## 데이터베이스 크기 (DB Sizes)
- **튜토리얼/테스트**: `-profile test`는 작은 '미니' 데이터베이스를 자동으로 가져옵니다.
    - MetaPhlAn 4
    - HUMAnN 3 (ChocoPhlAn, UniRef)
    - CARD
    - ResFinder
- **실제 실행**: 전체 데이터베이스가 필요하며, 이는 상당한 디스크 공간과 다운로드 시간이 필요할 수 있습니다 (초기 범위 아님).

## nf-core 버전 (nf-core Versions)
- `nf-core/bagobugs`: ≥ 2.4.0
- `nf-core/funcscan`: ≥ 2.1.0
- 주요 도구:
    - MetaPhlAn: 4
    - HUMAnN: 3
    - RGI (CARD)
    - ABRicate (ResFinder)
- 모든 소프트웨어 버전은 `software_versions.yml`에 고정되어야 합니다.

## UI 처리 (UI Treatments)
이 파이프라인은 그래픽 사용자 인터페이스(GUI)를 가지지 않습니다. 주요 사용자 상호 작용 및 결과 표시는 다음 보고서 파일을 통해 이루어집니다:
- `multiqc_report.html`: 파이프라인 전반의 QC 메트릭 및 결과 요약.
- `*_krona.html`: 각 샘플에 대한 대화형 분류학적 분류 시각화.
- HUMAnN TSV 파일: 정량화된 기능적 경로 및 유전자 패밀리.
- `hamronization_summary.html`: 통합된 항생제 내성 유전자 프로파일 요약. 