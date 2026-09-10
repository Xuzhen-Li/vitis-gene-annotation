# Peer pipelines (字爹)

## Functional annotation peers (this repo’s main focus)

| Peer | Role |
|------|------|
| [eggnogdb/eggnog-mapper](https://github.com/eggnogdb/eggnog-mapper) | Default F1/F2 engine |
| [ilypopv/KEGGaNOG](https://github.com/ilypopv/KEGGaNOG) | KEGG views from emapper |
| [harta55/EnTAP](https://github.com/harta55/EnTAP) → [GitLab EnTAP](https://gitlab.com/PlantGenomicsLab/EnTAP) | F3 frame |
| [groupschoof/AHRD](https://github.com/groupschoof/AHRD) · [EI eifunannot](https://github.com/EI-CoreBioinformatics/eifunannot) | F4 descriptions |
| [Trinotate/Trinotate](https://github.com/Trinotate/Trinotate) | F5 transcriptome |
| [AndolfoG/HRP](https://github.com/AndolfoG/HRP) | F8 NLR |
| TropicalBreeding coffee OrthoFinder–Trinotate–GO | F7-style panel ideas |

---

# Peer annotation pipelines (字爹)


## 2026-09-10 wave — more annotation repos

| Peer | Stack | Idea used here |
|------|--------|----------------|
| [Gaius-Augustus/BRAKER4](https://github.com/Gaius-Augustus/BRAKER4) | Snakemake BRAKER (ET/EP/ETP/IsoSeq/Dual/ES) | [`peers/braker4.md`](peers/braker4.md); [`tools/braker4.md`](tools/braker4.md); preferred S1/S2/S3 runner |
| [nschan/nf-annotate](https://github.com/nschan/nf-annotate) | Liftoff+SNAP/Augustus/miniprot+PASA+EVM+HRP NLR+HiTE | [`peers/nf_annotate.md`](peers/nf_annotate.md); `config/evm_weights_nf_annotate.txt`; [`tools/hrp.md`](tools/hrp.md) |
| [nf-core/genomeannotator](https://github.com/nf-core/genomeannotator) | Nextflow Augustus/PASA/EVM | [`peers/nfcore_genomeannotator.md`](peers/nfcore_genomeannotator.md) |
| [nf-core/isoseq](https://github.com/nf-core/isoseq) | PacBio Iso-seq → FLNC / bed | Pointer for S3 read prep |
| [meiyang12/Genome-annotation-pipeline](https://github.com/meiyang12/Genome-annotation-pipeline) | RM→HISAT→BRAKER→miniprot→EVM→PASA | [`peers/meiyang_gap.md`](peers/meiyang_gap.md) |
| [nextgenusfs/funannotate](https://github.com/nextgenusfs/funannotate) | Fungal-leaning eukaryote annotator | [`peers/funannotate.md`](peers/funannotate.md) |
| [juliawiggeshoff/AugusMake](https://github.com/juliawiggeshoff/AugusMake) | Augustus Snakemake + Trinity | [`peers/augusmake.md`](peers/augusmake.md) |
| [bwang27/Gene_Annotation_Pipeline](https://github.com/bwang27/Gene_Annotation_Pipeline) | MAKER + AED plots | [`peers/maker_bwang.md`](peers/maker_bwang.md) |
| [AndolfoG/HRP](https://github.com/AndolfoG/HRP) | Full-length NB-LRR | [`tools/hrp.md`](tools/hrp.md) / S7 |

| Peer | Stack | Idea used here |
|------|--------|----------------|
| **[CantuLab/AnnotationPipeline2-EVM_based-DClab](https://github.com/CantuLab/AnnotationPipeline2-EVM_based-DClab)** (+ [v1 andreaminio](https://github.com/andreaminio/AnnotationPipeline-EVM_based-DClab)) | RepeatMasker → PASA → Augustus/GeneMark → EVM → PASA polish → filter → rename | [`peers/cantulab_evm.md`](peers/cantulab_evm.md); **S14**; `A5e`/`A6b`; `config/evm_weights_cantulab.txt` |
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
