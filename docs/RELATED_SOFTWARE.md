# Related software

Public tools and workflows useful when teaching or running plant gene annotation.  
This repo **integrates a *Vitis*-focused playbook**; links below are for citation and further reading, not a statement that any third-party project was copied wholesale.

## Functional

| Software | Notes in this repo |
|----------|-------------------|
| [eggnog-mapper](https://github.com/eggnogdb/eggnog-mapper) | Default F1/F2 |
| [InterProScan](https://www.ebi.ac.uk/interpro/download/) | Domains / GO |
| [DIAMOND](https://github.com/bbuchfink/diamond) | SwissProt / NR hits |
| [AHRD](https://github.com/groupschoof/AHRD) · [eifunannot](https://github.com/EI-CoreBioinformatics/eifunannot) | Readable names (F4) |
| [EnTAP](https://gitlab.com/PlantGenomicsLab/EnTAP) | Optional F3 frame |
| [Trinotate](https://github.com/Trinotate/Trinotate) | Transcriptome FA (F5) |
| [HRP](https://github.com/AndolfoG/HRP) | NLR focus (F8) |
| Mercator4 / MapMan | Plant BINs (F6) |
| KofamScan | Optional KO |

## Structural (upstream)

| Software | Notes in this repo |
|----------|-------------------|
| [BRAKER](https://github.com/Gaius-Augustus/BRAKER) / [BRAKER4](https://github.com/Gaius-Augustus/BRAKER4) | S1–S3 runners |
| [TSEBRA](https://github.com/Gaius-Augustus/TSEBRA) / [GALBA](https://github.com/Gaius-Augustus/GALBA) | Combiners / protein-guided |
| EvidenceModeler · PASA | Consensus / polish (incl. S14) |
| [GSAman](https://github.com/CJ-Chen/GSAman) | Last-mile curation |
| Liftoff · LiftOn · EviAnn | Transfer / evidence drafts |
| EDTA · RepeatMasker | Soft-mask |
| AGAT · BUSCO · OMArk · compleasm · PSAURON | GFF / protein QC |
| [nf-annotate](https://github.com/nschan/nf-annotate) · [nf-core/genomeannotator](https://github.com/nf-core/genomeannotator) | Nextflow examples |
| [funannotate](https://github.com/nextgenusfs/funannotate) · MAKER-family stacks | Alternate eukaryote stacks |

Short notes (optional reading): [`notes/`](notes/).
