# genepal (Plant & Food Research) — Nextflow BRAKER ± Liftoff

- Repo: https://github.com/Plant-Food-Research-Open/genepal  

**Stack:** fa-lint → RepeatModeler/EDTA → RepeatMasker soft-mask → STAR RNA → BRAKER (workflow C/D) → optional Liftoff → TSEBRA intron support → AGAT merge/filters → eggNOG → BUSCO → MultiQC. Supports phased / pan panels.

**Ideas used here:**

- Explicit BRAKER workflow C (protein) vs D (RNA+protein) naming in tools/braker3  
- AGAT rules: drop Liftoff `valid_ORF=False`, tiny introns, non-coding lifts  
- TSEBRA “full intron support” pass after Liftoff+BRAKER  
- OrthoFinder / gffcompare as multi-genome extras (pointer only)

Scenario tip: genepal-like path ≈ our **S1** with Liftoff merge via AGAT instead of EVM — document which combiner you used.
