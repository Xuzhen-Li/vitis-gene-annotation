# Peer annotation pipelines (字爹)

| Peer | Stack | Idea used here |
|------|--------|----------------|
| [KrabbenhoftLab/genome_annotation_pipeline](https://github.com/KrabbenhoftLab/genome_annotation_pipeline) | Softmask → HISAT → BRAKER → GeMoMa → EVM → eggNOG | Numbered stages; ProtExcluder; dual then EVM |
| [plantgenomicslab/Sylvan](https://github.com/plantgenomicslab/Sylvan) / [wyim-pgl/Sylvan2](https://github.com/wyim-pgl/Sylvan2) | Helixer + EVM/PASA + RF filter (+ Liftoff in Sylvan2) | Multi-predictor; spurious filter; TidyGFF |
| [keen-laras/GenomeAnnotation](https://github.com/keen-laras/GenomeAnnotation) | EviAnn + BRAKER merge | Evidence backbone + orphans |
| [Gaius-Augustus/BRAKER](https://github.com/Gaius-Augustus/BRAKER) / [GALBA](https://github.com/Gaius-Augustus/GALBA) / [TSEBRA](https://github.com/Gaius-Augustus/TSEBRA) | Engines | Draft + combiner |
| [alekseyzimin/EviAnn_release](https://github.com/alekseyzimin/EviAnn_release) | Evidence-first | Long-read drafts |
| [NBISweden/AGAT](https://github.com/NBISweden/AGAT) | GFF toolkit | Stats / fix |
| [PGSB-HMGU/plant.annot](https://github.com/PGSB-HMGU/plant.annot) | Snakemake | Iso-seq/RNA/protein config |
| [baozg/assembly-annotation-pipeline](https://github.com/baozg/assembly-annotation-pipeline) | Plant notes | NLR → manual curation |
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) | Manual curator | Last mile |
| SynGAP (Wu et al. 2024) | Synteny polish | Stage 05 |
| [ncbi/egapx](https://github.com/ncbi/egapx) · [Beenome100 protocol](https://github.com/Beenome100/EGAPx_annotation_protocol) | Gnomon / NCBI | Optional rosids path; RNA tissue rules |
| [agshumate/Liftoff](https://github.com/agshumate/Liftoff) · [nhu92/HomologousAnnotationPipeline](https://github.com/nhu92/HomologousAnnotationPipeline) | Lift annotation | Fast haplotype transfer |
| [Datapotumas/GetaFilter](https://github.com/Datapotumas/GetaFilter) | FPKM + Pfam filter | Soft post-filter (protect NLRs) |
| [DessimozLab/OMArk](https://github.com/DessimozLab/OMArk) | Orthology QC | Complement BUSCO |
| [huangnengCSU/compleasm](https://github.com/huangnengCSU/compleasm) | miniprot completeness | Fast proteome check |

Rewritten for *Vitis*; no vendored cluster paths.
