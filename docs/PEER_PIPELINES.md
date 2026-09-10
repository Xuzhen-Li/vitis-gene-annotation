# Peer annotation pipelines (字爹)

| Peer | Stack | Idea used here |
|------|--------|----------------|
| **Dario Copetti** ([Rabiosa / MAKER-P](https://doi.org/10.25739/1e5z-pc33); [BRAKER#949](https://github.com/Gaius-Augustus/BRAKER/issues/949)) | EDTA → HISAT/StringTie → BRAKER → stage BUSCO + mono:multi; TSEBRA rescue; MAKER-P classical | [`peers/copetti.md`](peers/copetti.md); `A5d_stage_counts.sh` |
| [ryandkuster/ragnarok](https://github.com/ryandkuster/ragnarok) (preprint 2025) | Helixer + Mikado + RNA/protein; EDTA; NLR extras | [`peers/ragnarok.md`](peers/ragnarok.md); S13 |
| [Plant-Food-Research-Open/genepal](https://github.com/Plant-Food-Research-Open/genepal) | EDTA/RM → STAR → BRAKER C/D → Liftoff → TSEBRA → AGAT | [`peers/genepal.md`](peers/genepal.md) |
| [nauvalrajwaa/PlantGenotationFlow](https://github.com/nauvalrajwaa/PlantGenotationFlow) | Asm → EDTA → Liftoff/GALBA | [`peers/plantgenotationflow.md`](peers/plantgenotationflow.md) |
| GeneCAD preprint | PlantCAD2 sequence-only models | [`peers/genecad.md`](peers/genecad.md) |
| [KrabbenhoftLab/genome_annotation_pipeline](https://github.com/KrabbenhoftLab/genome_annotation_pipeline) | Softmask → HISAT → BRAKER → GeMoMa → EVM → eggNOG | Numbered stages; ProtExcluder; dual then EVM |
| [plantgenomicslab/Sylvan](https://github.com/plantgenomicslab/Sylvan) / [wyim-pgl/Sylvan2](https://github.com/wyim-pgl/Sylvan2) | Helixer + EVM/PASA + RF filter (+ Liftoff) | Multi-predictor; spurious filter |
| [keen-laras/GenomeAnnotation](https://github.com/keen-laras/GenomeAnnotation) | EviAnn + BRAKER merge | Evidence backbone + orphans |
| [Gaius-Augustus/BRAKER](https://github.com/Gaius-Augustus/BRAKER) / [GALBA](https://github.com/Gaius-Augustus/GALBA) / [TSEBRA](https://github.com/Gaius-Augustus/TSEBRA) | Engines | Draft + combiner |
| [KatharinaHoff/BRAKER-TSEBRA-Workshop](https://github.com/KatharinaHoff/BRAKER-TSEBRA-Workshop) | Teaching notebooks | BRAKER1/2/3 + GALBA practice |
| [alekseyzimin/EviAnn_release](https://github.com/alekseyzimin/EviAnn_release) | Evidence-first | Long-read drafts |
| [NBISweden/AGAT](https://github.com/NBISweden/AGAT) | GFF toolkit | Stats / fix |
| [PGSB-HMGU/plant.annot](https://github.com/PGSB-HMGU/plant.annot) | Snakemake | Iso-seq/RNA/protein config |
| [baozg/assembly-annotation-pipeline](https://github.com/baozg/assembly-annotation-pipeline) | Plant notes | NLR → manual curation |
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) | Manual curator | Last mile (Chen et al. 2026) |
| SynGAP (Wu et al. 2024) | Synteny polish | Stage 05 |
| [ncbi/egapx](https://github.com/ncbi/egapx) · [Beenome100 protocol](https://github.com/Beenome100/EGAPx_annotation_protocol) | Gnomon / NCBI | Optional rosids path |
| [agshumate/Liftoff](https://github.com/agshumate/Liftoff) · [nhu92/HomologousAnnotationPipeline](https://github.com/nhu92/HomologousAnnotationPipeline) | Lift annotation | Fast haplotype transfer |
| [Datapotumas/GetaFilter](https://github.com/Datapotumas/GetaFilter) | FPKM + Pfam filter | Soft post-filter (protect NLRs) |
| [DessimozLab/OMArk](https://github.com/DessimozLab/OMArk) | Orthology QC | Complement BUSCO |
| [huangnengCSU/compleasm](https://github.com/huangnengCSU/compleasm) | miniprot completeness | Fast proteome check |
| [oushujun/EDTA](https://github.com/oushujun/EDTA) | Plant TE | Soft-mask input |

Rewritten for *Vitis*; no vendored cluster paths.
