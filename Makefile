commit:
	@./scripts/vc.sh "$(msg)"

run:
	@./scripts/run_nf.sh $(slug) $(args)
# 사용 예: make run slug=db-path args="-profile docker -resume"