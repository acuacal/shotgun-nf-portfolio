Context: A feature spec has been moved into *Planning* (`docs/1_planning/`)  
and is referenced via @ (e.g., @shotgun-metagenomics-prd.md).

Instructions  
1. Read the referenced PRD and extract a short `feature-name`  
   → “shotgun-metagenomics-pipeline”.  
2. Create `docs/1_planning/<feature-name>/`.  
3. Inside that folder generate  
   - README.md  (Goal, Key Requirements, Target Audience, Open Questions)  
   - spec.md    (detailed flow, db sizes, nf-core versions, UI treatments)  
   - design.md  (mermaid workflow diagram, container layers, data paths)  
   Use `_templates/*` if helpful.
4. Populate files with content summarised/adapted from the PRD.  
5. Version-control
   - If `.git` does not exist, run:
       git init && git remote add origin <REMOTE>
   - Then run:
       ./scripts/vc.sh "feat: scaffold spec/design for {{FEATURE_NAME}}"
   - Output: “Planning stage complete”.