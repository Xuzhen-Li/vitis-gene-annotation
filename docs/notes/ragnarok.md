# RAGNAROK (ryandkuster) — Helixer + Mikado plant annotator

- Repo: https://github.com/ryandkuster/ragnarok  
- Preprint: https://doi.org/10.1101/2025.10.03.680343  

**Stack:** Illumina and/or long RNA → protein (miniprot) → **Helixer** ab initio → **Mikado** selects best models (StringTie / TransDecoder / miniprot / Helixer weights). Optional EDTA/HiTE mask, Liftoff inputs, plant NLR extras. Benchmarked vs BRAKER3 / MAKER.

**Ideas used here:**

- Helixer as optional draft engine (GPU) — [`../tools/helixer.md`](../tools/helixer.md)  
- Mikado as EVM alternative combiner — [`../tools/mikado.md`](../tools/mikado.md)  
- Penalize Helixer microexons in plant scoring YAML (RAGNAROK note)  
- Scenario **S13** (Helixer+Mikado path)

Do not vendor their Nextflow; point users to the upstream repo for a full automated run.
