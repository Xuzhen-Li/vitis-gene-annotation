# Related software

Public tools and workflows useful when teaching or running plant gene annotation.  
This repo is a **biology-general gene-annotation playbook** (*Vitis*/plant notes are examples). Links below are for citation and further reading, not a statement that any third-party project was copied wholesale.

## Functional

| Software | Notes in this repo |
|----------|-------------------|
| [eggnog-mapper](https://github.com/eggnogdb/eggnog-mapper) | Default F1/F2 |
| [InterProScan](https://www.ebi.ac.uk/interpro/download/) | Domains / GO |
| [DIAMOND](https://github.com/bbuchfink/diamond) | SwissProt / NR hits |
| [AHRD](https://github.com/groupschoof/AHRD) · [eifunannot](https://github.com/EI-CoreBioinformatics/eifunannot) | Readable names (F4) |
| [EnTAP](https://gitlab.com/PlantGenomicsLab/EnTAP) | Optional F3 frame |
| [Trinotate](https://github.com/Trinotate/Trinotate) | Transcriptome FA (F5) |
| [HRP](https://github.com/AndolfoG/HRP) | Plant NLR focus (optional F8) |
| Mercator4 / MapMan | Plant BINs (optional F6) |
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

## Newer peers (2026-09)

| Software | Notes |
|----------|-------|
| [GALBA2](https://github.com/Gaius-Augustus/GALBA2) | Structure S2 peer (protein-only, large genomes) — see structure repo |
| [TOGA2](https://github.com/hillerlab/TOGA2) | Vertebrate WGA transfer / orthology — structure repo |
| [funannotate2](https://github.com/nextgenusfs/funannotate2) (+ [addons](https://github.com/nextgenusfs/funannotate2-addons)) | Fungi/eukaryote structure+FA; eggNOG/IPS align with F1 |
| [AnnotationTOGA](https://github.com/harvardinformatics/AnnotationTOGA) | Harvard TOGA wrapper |

Canonical structure playbook: [gene-structure-annotation](https://github.com/Xuzhen-Li/gene-structure-annotation) `docs/PEER_PIPELINES.md`.

## Mainstream / AI structure peers (upstream)

| Software | Notes |
|----------|-------|
| MAKER2 | High-citation full stack (Holt & Yandell 2011) |
| Helixer | *Nat Methods* 2025 AI ab initio |
| Tiberius | *Bioinformatics* 2024 AI ab initio (AUGUSTUS lab) |
| [ANNEVO](https://github.com/xjtu-omics/ANNEVO) | Kai Ye 叶凯 lab genomic LM; non-commercial license |

Details: [gene-structure-annotation](https://github.com/Xuzhen-Li/gene-structure-annotation) `docs/PEER_PIPELINES.md`.

## FA KO / GO peers (2026-09-13)

| Software | Notes |
|----------|-------|
| BlastKOALA / GhostKOALA | Kanehisa *JMB* 2016 — classic KEGG KO web |
| KofamScan / KofamKOALA | HMM KO (optional F1b) |
| [DeepKOALA](https://github.com/zhaoxi120/deepkoala) | DL KO assignment; fast batch |
| DeepGOPlus (DeepGO family) | DL GO — post-F1 optional |

Structure haul (EviAnn / FINDER / CAT / LiftOn / Earl Grey / MetaEuk): [gene-structure-annotation PEER_PIPELINES](https://github.com/Xuzhen-Li/gene-structure-annotation/blob/main/docs/PEER_PIPELINES.md).
