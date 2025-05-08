# Product Requirements Document (PRD)

## Title
Shotgun Metagenomics **Nextflow** Pipeline – *nf-core/bagobugs + nf-core/funcscan*

---

### 1. Purpose & Vision
Provide a **one-day, fully reproducible** workflow that performs  
1. **Taxonomic + functional profiling** via **nf-core/bagobugs**  
2. **Resistome (ARG) profiling** via **nf-core/funcscan** (CARD & ResFinder)  

The pipeline is portfolio-oriented yet scales to HPC/cloud for larger studies.

---

### 2. Scope
| In-scope | Out-of-scope |
|----------|--------------|
| Short-read FASTQ input | Long-read MAG creation (nf-core/mag) |
| Pull mini tutorial DBs & containers | Building custom DBs from scratch |
| MultiQC, Krona, HUMAnN, hAMRonization reports | Extra dashboards |
| Docker / Singularity / Conda profiles | Kubernetes or CWL wrappers |
| GitHub repo + example dataset | Statistical downstream analyses |

---

### 3. Personas & Use-Cases
| Persona | Need |
|---------|------|
| **Candidate (you)** | Demonstrate workflow skills in < 1 day |
| Hiring manager / PI | Evidence of reproducibility & clear reports |
| Student | Learn nf-core + resistome basics |

---

### 4. Functional Requirements
| ID | Requirement |
|----|-------------|
| FR-1 | Accept `samplesheet.csv` or auto-pull demo FASTQs with `-profile test`. |
| FR-2 | Run **nf-core/bagobugs ≥ 2.4.0** with MetaPhlAn 4 and HUMAnN 3. |
| FR-3 | After bagobugs, run **nf-core/funcscan ≥ 2.1.0** (RGI + ABRicate) and merge via **hAMRonization**. |
| FR-4 | Produce: `multiqc_report.html`, `*_krona.html`, HUMAnN TSVs, `hamronization_summary.html`. |
| FR-5 | Tutorial run ≤ 30 min wall-time, peak RAM ≤ 4 GB on a laptop. |
| FR-6 | All software in containers; versions locked in `software_versions.yml`. |
| FR-7 | Configurable for SLURM HPC via `-profile singularity`. |
| FR-8 | Provide Makefile targets for setup, demo run, clean, package. |

---

### 5. Non-Functional Requirements
| NFR | Description |
|-----|-------------|
| Reproducibility | Identical outputs with fixed tags & image digests |
| Portability | Linux, macOS, WSL2; Docker or Singularity |
| Performance | Demo finishes < 30 min, ≤ 4 GB RAM |
| Usability | One-page README with copy-paste commands |
| Maintainability | Pure nf-core DSL2; documented upgrade path |

---

### 6. Workflow Diagram
```mermaid
graph TD;
  A[Input FASTQs] --> B(bagobugs: QC + profiling);
  B --> C[bagobugs reports];
  B --> D[Clean reads / contigs];
  D --> E(funcscan: ARG detection);
  E --> F[hAMRonization summary];
  C --> G(MultiQC merge);
  F --> G;
  G --> H[Portfolio package];

