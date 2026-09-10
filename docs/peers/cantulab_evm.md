**Merged main-process steps:** [`../steps/dclab/`](../steps/dclab/).

# CantuLab AnnotationPipeline2 (EVM-based, DC Lab)

**Upstream (follow for full commands):**  
https://github.com/CantuLab/AnnotationPipeline2-EVM_based-DClab  

**v1 (Andrea Minio / DC Lab):**  
https://github.com/andreaminio/AnnotationPipeline-EVM_based-DClab  

**Used in *Vitis* papers** (see their README): Massonnet et al. 2025/2026 *G3* (*Ren6/Ren7*, *PdR1* haplotype graphs).

This is the **grape-lab EVM playbook** (PASA-trained Augustus/GeneMark → EVM → PASA polish → filter → rename). It is the concrete “DC Lab” pipeline that sits next to Copetti-style TE/BRAKER diagnostics ([`copetti.md`](copetti.md)).

We do **not** vendor their cluster paths. We map their steps into this repo and keep their weights / filter rules as *Vitis*-tuned defaults.

## Their order → ours

| Their step | What they do | Our home |
|------------|--------------|----------|
| 00 Setup | Vars: `GENOME_FASTA`, `REPEAT_LIB`, `THREADS`, tool dirs | `config/example.env` |
| 01 External evidences | Iso-Seq HQ / related CDS / RNA assemblies | S3 / A1b; [`../DETAILED_GUIDE.md`](../DETAILED_GUIDE.md) |
| 02 Repeat annotation | RepeatMasker `-xsmall` + repeats GFF3 **into EVM** | A0; [`../tools/repeatmasker.md`](../tools/repeatmasker.md) |
| 03 Training set | GMAP/pblat → **PASA** transcript models | [`../tools/pasa.md`](../tools/pasa.md) |
| 04 Predictor training | Train **Augustus** + **GeneMark-ET** on PASA genes | below + S14 |
| 05 Ab initio | Genome-wide Augustus / GeneMark / PASA tracks | S14 draft |
| 06 Evidence alignment | Transcript alignment GFF3 for EVM | A1b / GMAP |
| 07 EVM + PASA polish | Weighted consensus → PASA update (UTRs/splices) | A4 + [`../tools/evm.md`](../tools/evm.md) |
| 08 Filtering | Drop no-stop / &lt;50 aa | `pipeline/A5e_filter_proteins.sh` |
| 09 Renaming | Standardized gene IDs | `pipeline/A6b_rename_gff.py` |

## Default EVM weights (from their `weights.txt`)

```text
ABINITIO_PREDICTION	AUGUSTUS	9
ABINITIO_PREDICTION	GeneMark.hmm3	9
TRANSCRIPT	gmap	7
TRANSCRIPT	BLAT	6
TRANSCRIPT	PASA_assemblies	20
OTHER_PREDICTION	PASA_transdecoder	25
```

PASA evidence dominates — correct when Iso-Seq / deep transcripts exist (**S3/S14**).  
If you only have BRAKER+GeMoMa (our **S1**), keep our lower ab initio / higher homology weights instead.

## EVM run skeleton (adapted)

Full parallel partition recipe lives upstream step 07. Condensed:

```bash
# After predictions.gff3 + transcript_alignments.gff3 + repeats.gff3 exist:
# partition_EVM_inputs.pl → write_EVM_commands.pl → parallel → recombine → convert → EVM.all.gff3
# Then filter incomplete models; then PASA polish (their 7.3).
```

Wire into `MERGE_MODE=evm` notes in `pipeline/A4_merge_sets.sh` / [`../tools/evm.md`](../tools/evm.md).

## Filtering rules we keep

1. Protein without `*` stop in translation → remove.  
2. Protein length &lt; 50 aa → remove.  
3. Optional: their `GFF_extract_features.py` flags (`-l -c -i -n`) for incomplete CDS / internal stops — use upstream script or our `A5e`.

## When to choose S14 (this pipeline) vs S1 (BRAKER3)

| Prefer **S14 CantuLab/EVM** | Prefer **S1 BRAKER3** |
|----------------------------|------------------------|
| Strong Iso-Seq / PASA training set | Want GeneMark-ETP+Augustus one-shot |
| Matching published Cantu *Vitis* METHODS | Faster modern default |
| Need PASA UTR polish cycle | Will GSAman heavily anyway |

Many labs run **both** and AGAT/BUSCO-compare before GSAman.

## METHODS citation stub

> Structural annotation followed the Cantu Lab EVM-based pipeline (AnnotationPipeline2-EVM_based-DClab; derived from AnnotationPipeline-EVM_based-DClab), with RepeatMasker soft-masking, PASA-trained Augustus/GeneMark, EVidenceModeler consensus, PASA polishing, and length/stop filtering; last-mile curation as in Chen et al. 2026 where applied.
