# Functional scenarios F1–F8

**Spine:** [`steps/FUNCTIONAL_MAIN.md`](steps/FUNCTIONAL_MAIN.md) · **Commands:** [`FUNCTIONAL_GUIDE.md`](FUNCTIONAL_GUIDE.md) · **AI:** [`AI_ASSIST.md`](AI_ASSIST.md)

## F1 — Full (default)

1. F0 BUSCO proteins  
2. DIAMOND SwissProt (`F1_diamond.sh`)  
3. eggNOG-mapper (`F2_eggnog.sh`)  
4. InterProScan (`F3_interproscan.sh`)  
5. Merge (`F_merge_tables.py`) → release  

## F2 — Fast

F0 → eggNOG only → optional KEGGaNOG → merge (emapper columns only).

## F3 — EnTAP frame

F0 → EnTAP (GitLab PlantGenomicsLab) → export → merge with any emapper/IPS you also ran.

## F4 — Readable descriptions

DIAMOND/BLAST → AHRD or eifunannot → join descriptions to master TSV.

## F5 — Transcriptome

TransDecoder peptides → Trinotate (+ optional emapper) → treat as provisional until genomic GFF exists.

## F6 — Plant pathway BINs

F1 or F2 → Mercator4/MapMan → BIN table joined by id.

## F7 — Multi-genome

OrthoFinder → pick OG reps → F1 on reps → propagate; document majority rule.

## F8 — NLR / QTL families

Structural GFF + proteins → HRP / IPS domain filter → curated list + F1 annotations for those loci.

## Choosing

| Goal | Branch |
|------|--------|
| Paper-ready function | **F1** |
| Quick look | **F2** |
| EnTAP lab standard | **F3** |
| Nice gene names | **F4** |
| RNA assembly only | **F5** |
| MapMan BINs | **F6** |
| Pan panel | **F7** |
| Disease-resistance focus | **F8** |
