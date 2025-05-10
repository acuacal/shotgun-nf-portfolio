commit:
	@./scripts/vc.sh "$(msg)"

run:
	@./scripts/run_nf.sh $(slug) $(args)
# 사용 예: make run slug=db-path args="-profile docker -resume"

.PHONY: setup demo ci clean package commit run

setup:
	@echo "Setting up environment..."
	@mkdir -p ~/metadb/
	@echo "Mini-databases for -profile test will be downloaded automatically by Nextflow."
	@echo "Ensure Docker is running and WSL integration is enabled if on Windows."

demo:
	@echo "Running demo pipeline with initial-test slug and docker profile..."
	@./scripts/run_nf.sh initial-test "-profile test,docker"

ci:
	@echo "Running CI tests... (nf-core download & test)"
	@nextflow run . -profile test,docker --outdir ./results_ci_test

clean:
	@echo "Cleaning up Nextflow work directory and logs..."
	@rm -rf work .nextflow* results* main_nf_out task_list.md.bak implementation_notes.md.bak # Add other files/dirs to clean as needed
	@echo "Cleanup complete."

package:
	@echo "Packaging pipeline code..."
	@zip -r shotgun-nf-portfolio-$(shell date +%Y%m%d).zip . -x "*.git*" "*work/*" "*.nextflow*" "*results*" "*~" "*.DS_Store" "*shotgun-nf-portfolio.zip"
	@echo "Pipeline packaged."