# Peer annotation pipelines (字爹)

What we borrowed into this playbook. Upstream URLs for install and citation.

| Peer | Stack | Idea used here |
|------|--------|----------------|
| [KrabbenhoftLab/genome_annotation_pipeline](https://github.com/KrabbenhoftLab/genome_annotation_pipeline) | RepeatModeler/Masker → softmask → HISAT2 → BRAKER3 → GeMoMa → **EVM** → eggNOG | Numbered stages; ProtExcluder-compatible BLAST; dual BRAKER+GeMoMa then EVM merge |
| [plantgenomicslab/Sylvan](https://github.com/plantgenomicslab/Sylvan) | STAR/HISAT + Helixer/AUGUSTUS + PASA/EVM + RF filter | Multi-predictor + spurious-gene filter; TidyGFF for release |
| [keen-laras/GenomeAnnotation](https://github.com/keen-laras/GenomeAnnotation) | EviAnn + BRAKER → bedtools coverage merge | Evidence backbone + keep BRAKER-only orphans |
| [Gaius-Augustus/BRAKER](https://github.com/Gaius-Augustus/BRAKER) / [GALBA](https://github.com/Gaius-Augustus/GALBA) / [TSEBRA](https://github.com/Gaius-Augustus/TSEBRA) | Official engines | Draft + combiner of prediction sets |
| [alekseyzimin/EviAnn_release](https://github.com/alekseyzimin/EviAnn_release) | Evidence-first | Long-read / transcript-heavy drafts |
| [NBISweden/AGAT](https://github.com/NBISweden/AGAT) | GFF toolkit | Stats, fix, filter before/after merge |
| [PGSB-HMGU/plant.annot](https://github.com/PGSB-HMGU/plant.annot) | Snakemake plant annot | Iso-seq + protein + RNA config pattern |
| [baozg/assembly-annotation-pipeline](https://github.com/baozg/assembly-annotation-pipeline) | Plant HiFi + annot notes | Warns NLR/metabolic clusters need manual curation; points to GSAman |
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) | Manual curator | Last mile (stages 03–04) |
| SynGAP (Wu et al. 2024 *Genome Biol*) | Synteny polish | Stage 05 |

We **rewrite** steps for *Vitis*; we do not vendor their cluster paths or containers.
