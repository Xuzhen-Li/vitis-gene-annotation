# Attribution (字爹)

Scripts and notes are **rewritten** for this *Vitis* grain. No third-party genotypes.

## Last-mile / curation

| Peer | Role |
|------|------|
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) · Chen et al. 2026 *The Innovation* | WYSIWYG curation; four error classes |
| SynGAP · Wu et al. 2024 *Genome Biology* | Synteny polish |
| PSAURON · BUSCO | Protein QC |

## Draft / merge / plant pipelines

| Peer | Role |
|------|------|
| [KrabbenhoftLab/genome_annotation_pipeline](https://github.com/KrabbenhoftLab/genome_annotation_pipeline) | Softmask → HISAT → BRAKER → GeMoMa → EVM → eggNOG |
| [plantgenomicslab/Sylvan](https://github.com/plantgenomicslab/Sylvan) | Helixer + EVM/PASA + RF filter + TidyGFF |
| [keen-laras/GenomeAnnotation](https://github.com/keen-laras/GenomeAnnotation) | EviAnn backbone + BRAKER orphans |
| [Gaius-Augustus/BRAKER](https://github.com/Gaius-Augustus/BRAKER), [GALBA](https://github.com/Gaius-Augustus/GALBA), [TSEBRA](https://github.com/Gaius-Augustus/TSEBRA) | Engines / combiner |
| [alekseyzimin/EviAnn_release](https://github.com/alekseyzimin/EviAnn_release) | Evidence-first draft |
| [NBISweden/AGAT](https://github.com/NBISweden/AGAT) | GFF statistics / fix |
| [PGSB-HMGU/plant.annot](https://github.com/PGSB-HMGU/plant.annot) | Plant Snakemake Iso-seq/RNA/protein |
| [baozg/assembly-annotation-pipeline](https://github.com/baozg/assembly-annotation-pipeline) | NLR cluster → manual curation warning |
| [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) | Sibling skill (plant traps) |

Full peer notes: [`PEER_PIPELINES.md`](PEER_PIPELINES.md).
