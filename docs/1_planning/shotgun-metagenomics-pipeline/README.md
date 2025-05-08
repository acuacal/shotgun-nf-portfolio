# README: Shotgun Metagenomics Pipeline

## 목표 (Goal)
nf-core/bagobugs 및 nf-core/funcscan을 사용하여 하루 안에 완전 재현 가능한 워크플로우를 제공하여 다음을 수행합니다:
1. **분류학적 + 기능적 프로파일링** (nf-core/bagobugs 사용)
2. **항생제 내성 유전체(ARG) 프로파일링** (nf-core/funcscan 사용 - CARD & ResFinder)

파이프라인은 포트폴리오 지향적이지만 대규모 연구를 위해 HPC/클라우드로 확장 가능합니다.

## 주요 요구 사항 (Key Requirements)
- `samplesheet.csv` 또는 `-profile test`를 사용하여 데모 FASTQ 자동 가져오기를 허용합니다 (FR-1).
- MetaPhlAn 4 및 HUMAnN 3을 사용하여 **nf-core/bagobugs ≥ 2.4.0**을 실행합니다 (FR-2).
- bagobugs 실행 후, **nf-core/funcscan ≥ 2.1.0** (RGI + ABRicate)을 실행하고 **hAMRonization**을 통해 병합합니다 (FR-3).
- `multiqc_report.html`, `*_krona.html`, HUMAnN TSV, `hamronization_summary.html` 보고서를 생성합니다 (FR-4).
- 노트북에서 튜토리얼 실행 시간 ≤ 30분, 최대 RAM ≤ 4 GB (FR-5).
- 모든 소프트웨어는 컨테이너에 포함되며 버전은 `software_versions.yml`에 고정됩니다 (FR-6).
- `-profile singularity`를 통해 SLURM HPC용으로 구성 가능합니다 (FR-7).
- 설정, 데모 실행, 정리, 패키징을 위한 Makefile 타겟을 제공합니다 (FR-8).

## 대상 사용자 (Target Audience)
- **후보자 (본인)**: 하루 안에 워크플로우 기술을 시연합니다.
- **채용 관리자 / PI**: 재현성 및 명확한 보고서의 증거를 확인합니다.
- **학생**: nf-core + 항생제 내성 유전체 기초를 학습합니다.

## 미해결 질문 (Open Questions)
*(현재 PRD에는 명시적인 미해결 질문이 없습니다. 구현 중에 추가될 수 있습니다.)* 