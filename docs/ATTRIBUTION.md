# Attribution (字爹)

Scripts and notes are **rewritten** for this *Vitis* grain. No third-party genotypes.

## Curation / QC

| Peer | Role |
|------|------|
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) · Chen et al. 2026 *The Innovation* | WYSIWYG curation |
| SynGAP · Wu et al. 2024 *Genome Biology* | Synteny polish |
| PSAURON · BUSCO · [OMArk](https://github.com/DessimozLab/OMArk) · [compleasm](https://github.com/huangnengCSU/compleasm) | Protein / orthology QC |
| [GetaFilter](https://github.com/Datapotumas/GetaFilter) | Expression+domain screen pattern |

## Draft / merge / plant pipelines

| Peer | Role |
|------|------|
| KrabbenhoftLab genome_annotation_pipeline | Softmask → BRAKER → GeMoMa → EVM |
| Sylvan / Sylvan2 | Helixer, EVM/PASA, Liftoff, RF filter |
| keen-laras GenomeAnnotation | EviAnn backbone merge |
| BRAKER / GALBA / TSEBRA | Engines / combiner |
| EviAnn | Evidence-first draft |
| AGAT | GFF statistics |
| PGSB plant.annot · baozg pipeline | Plant Snakemake / NLR warning |
| [ncbi/egapx](https://github.com/ncbi/egapx) | Optional NCBI Gnomon path (rosids OK) |
| Liftoff | Homologous lift from PN40024-like refs |
| [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) | Sibling plant-trap skill |

See [`PEER_PIPELINES.md`](PEER_PIPELINES.md).
