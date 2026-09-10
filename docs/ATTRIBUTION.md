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

## 2026-09-10 peer wave (Copetti + Helixer/Mikado + papers)

- Dario Copetti — Rabiosa MAKER-P annotation dataset (doi:10.25739/1e5z-pc33); BRAKER issue #949 stage diagnostics (EDTA, StringTie, mono:multi, TSEBRA rescue).
- Langer/Kuster et al. RAGNAROK preprint (doi:10.1101/2025.10.03.680343) — Helixer + Mikado plant pipeline.
- Plant & Food Research genepal — BRAKER C/D + Liftoff + AGAT merge patterns.
- PlantGenotationFlow — assembly-to-Liftoff/GALBA Snakemake outline.
- GeneCAD preprint (doi:10.1101/2025.10.31.685877) — sequence-only foundation-model annotation (pointer only).
- Chen, Chen & Xia (2026) GSAman / *The Innovation* — last-mile curation (already core).

## CantuLab EVM pipeline

- [CantuLab/AnnotationPipeline2-EVM_based-DClab](https://github.com/CantuLab/AnnotationPipeline2-EVM_based-DClab) — step order, EVM weights, filter/rename practice; v1 [andreaminio/AnnotationPipeline-EVM_based-DClab](https://github.com/andreaminio/AnnotationPipeline-EVM_based-DClab).
- Filter/rename helpers here are Python3 rewrites inspired by their `scripts/`; for exact lab scripts use upstream.

## 2026-09-10 annotation-repo wave

- Gaius-Augustus/BRAKER4 — Snakemake BRAKER modes (ET/EP/ETP/IsoSeq/Dual).
- nschan/nf-annotate — Liftoff-weighted EVM + HRP NLR (AndolfoG/HRP); weights → config/evm_weights_nf_annotate.txt.
- nf-core/genomeannotator, nf-core/isoseq — Nextflow eukaryote / Iso-seq annotation.
- meiyang12/Genome-annotation-pipeline — BRAKER+miniprot+EVM+PASA spine.
- nextgenusfs/funannotate, juliawiggeshoff/AugusMake, bwang27/Gene_Annotation_Pipeline — alternate stacks / AED.

## Functional focus (2026-09-10)

Repo primary product reframed to functional annotation. Peers: eggnog-mapper, KEGGaNOG, EnTAP, AHRD/eifunannot, Trinotate, HRP.

## T2T / recent FA survey (2026-09-10)

Cell Genomics T2T collection (assembly-first); Camellia nitidissima Sci Data FA = IPS+emapper+PANNZER2+Mercator4; GeneForge FA extras; LiftOn; T2T-Hub.
