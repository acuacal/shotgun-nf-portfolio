# Fix Plan for Pipeline Pulling Failure

- [ ] **네트워크 접근성 확인**:
    - WSL 터미널에서 다음 명령들을 실행하여 GitHub API 및 리포지토리 접근성을 확인합니다:
      ```bash
      curl -I https://api.github.com
      curl -I https://github.com/nf-core/bagobugs
      # nf-core/bagobugs 리포지토리의 nextflow.config 파일 직접 접근 시도
      curl -L https://raw.githubusercontent.com/nf-core/bagobugs/master/nextflow.config
      ```
- [ ] **WSL 네트워크 설정 확인 (사용자)**:
    - 만약 위 명령들이 실패하거나 비정상적인 결과를 반환하면, WSL의 네트워크 설정을 확인해야 합니다.
        - DNS 설정 (예: `/etc/resolv.conf`)
        - 프록시 설정 (환경 변수 `http_proxy`, `https_proxy` 등)
        - 방화벽 설정
    - 필요한 경우, 네트워크 설정을 수정하거나 시스템 관리자에게 문의합니다.
- [ ] **파이프라인 재실행**: 
    - 네트워크 문제가 해결되었다고 판단되면 파이프라인을 `-resume` 옵션과 함께 재실행합니다.
      `make run slug=fix-pulling args="-profile docker -resume"` 