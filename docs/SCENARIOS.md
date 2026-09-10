**Full command-level detail:** [`DETAILED_GUIDE.md`](DETAILED_GUIDE.md).

# Branch recipes — how to annotate in each situation

Prerequisites for all branches unless noted: **Asm0 → Asm1 → A0** done; `config/local.env` filled.

Each scenario ends by rejoining: **A3 → 01 → 02 → GSAman → 06** (qualification).

---

## S1 — RNA + proteins (default)

**Goal:** Standard qualified annotation for one haplotype.

### Steps

1. **A1b** Align Illumina RNA → `RNA_BAM` (HISAT2 or STAR).  
2. **A2** `DRAFT_ENGINE=braker3` — BRAKER3 on `GENOME_SOFT` + OrthoDB eudicots/Viridiplantae + `RNA_BAM`.  
3. **A2b** Second set: GeMoMa **or** Liftoff from PN40024 → `DRAFT_GFF_B`.  
4. **A4** `MERGE_MODE=evm` (BRAKER+GeMoMa) or `tsebra` if both BRAKER-family → `MERGED_GFF`.  
5. **A5** `bash pipeline/A5_agat_stats.sh "$MERGED_GFF"`.  
6. `export DRAFT_GFF="$MERGED_GFF"` then **A3 → 01 → 02**.  
7. **03–04** GSAman on `priority.tsv` (NLR/stilbene boosted).  
8. **06** Re-QC; tick qualification checklist in PLAYBOOK.

### Commands (after cluster engines are wired)

```bash
set -a && source config/local.env && set +a
bash pipeline/A2_run_draft.sh          # produce DRAFT_GFF
# run second predictor → DRAFT_GFF_B
MERGE_MODE=evm bash pipeline/A4_merge_sets.sh
bash pipeline/A5_agat_stats.sh "$MERGED_GFF"
export DRAFT_GFF="$MERGED_GFF"
bash pipeline/A3_proteins_from_gff.sh
bash pipeline/01_qc_busco_psauron.sh
python3 pipeline/02_priority_loci.py -i "$PSAURON_TSV" -o "$PRIORITY_TSV"
# GSAman manually → CURATED_GFF; then pipeline/06_release_gff.md
```

---

## S2 — Proteins only

**Goal:** No usable RNA.

### Steps

1. Skip A1b (or keep BAM empty).  
2. **A2** `DRAFT_ENGINE=galba` **or** GeMoMa from close Vitaceae.  
3. **A2c** Liftoff from PN40024 as second set.  
4. Merge: homology backbone (GeMoMa/Liftoff) + GALBA orphans via EVM weights or manual AGAT keep list.  
5. **A5 → A3 → 01 → 02**.  
6. **Heavier GSAman** — splice sites weak without RNA.  
7. Release may stay `provisional` until RNA arrives.

```bash
DRAFT_ENGINE=galba bash pipeline/A2_run_draft.sh
# Liftoff → DRAFT_GFF_B (see A2c_liftoff.md)
MERGE_MODE=evm bash pipeline/A4_merge_sets.sh   # adjust weights toward homology
# then A5 → A3 → 01 → 02 → GSAman → 06
```

---

## S3 — Deep Iso-seq

**Goal:** Long-read transcriptome is the backbone.

### Steps

1. Map FLNC/Iso-seq (minimap2) per haplotype if phased → `ISOSEQ_BAM`.  
2. **A2** `DRAFT_ENGINE=eviann` → evidence GFF.  
3. **A2** BRAKER3 as secondary (species-specific genes).  
4. **A4** `MERGE_MODE=evi_backbone`.  
5. A5 → A3 → 01 → 02 → GSAman on conflicts + priority → 06.

```bash
DRAFT_ENGINE=eviann bash pipeline/A2_run_draft.sh    # → evidence GFF as DRAFT_GFF_B preferred
# BRAKER → DRAFT_GFF
MERGE_MODE=evi_backbone bash pipeline/A4_merge_sets.sh
# A5 → A3 → 01 → 02 → GSAman → 06
```

---

## S4 — Haplotype / cultivar panel

**Goal:** Consistent models across hap1/hap2 or cultivars.

### Steps

1. Choose **reference haplotype**; run **S1 or S3** to a curated GFF (`CURATED_GFF`).  
2. For each other haplotype: **A2c Liftoff** (or GeMoMa) from that curated ref.  
3. **05 SynGAP** between ref and each target — collect conflict BED.  
4. GSAman **only** SynGAP conflicts + priority families on each hap.  
5. Release: `ref.curated.gff3` + `hapN.lifted.gff3` with provenance.

```bash
# on ref (after S1 curation):
# for each hapN:
liftoff -g "$CURATED_GFF" -o hapN.liftoff.gff3 -polish hapN.fa "$REF_FA"
# SynGAP per pipeline/05_syngap_polish.md
# GSAman conflicts → release set
```

---

## S5 — T2T / publication-grade

**Goal:** Paper claims reference-quality structure.

### Steps

1. Asm1 must pass strict contigency / genome BUSCO.  
2. Run **S1** (or S3 if Iso-seq deep) fully.  
3. After first GSAman: **A5b** OMArk/Compleasm; expand priority to all fragmented BUSCOs + all tandem arrays.  
4. Second GSAman round; stop via S12.  
5. Optional **S8** EGAPx comparison table in supplement.  
6. METHODS: versions, lineages, RNA libs, merge weights; qualification checklist 100%.

---

## S6 — Thin evidence

**Goal:** Something usable; honesty over polish.

### Steps

1. **A2c** Liftoff/GeMoMa from closest grape = primary.  
2. Optional BRAKER3 protein-only = orphans only.  
3. Light merge; **A5 → A3 → 01**.  
4. GSAman on priority families only.  
5. Tag release `provisional`; plan Iso-seq → S3 upgrade.

---

## S7 — Family / QTL first

**Goal:** Correct models where the biology is; auto elsewhere.

### Steps

1. Run genome-wide **S1** draft + A5 + A3 + 01 (do not skip QC).  
2. Prepare `families.tsv` (`gene_id\\tfamily`).  
3. `python3 pipeline/02_priority_loci.py -i "$PSAURON_TSV" --families families.tsv -o "$PRIORITY_TSV"`.  
4. GSAman **only** those windows (± tandem neighbors).  
5. Release `auto.gff3` + `curated_regions.gff3` (or merge with `curated=yes` tags).

---

## S8 — NCBI EGAPx parallel

**Goal:** Gnomon-style comparison / GenBank path.

### Steps

1. Keep lab **S1** as primary.  
2. Run EGAPx (`A2d`) with *Vitis* taxid + multi-tissue RNA.  
3. AGAT + BUSCO both GFFs; spot-check NLR in GSAman.  
4. Publish primary lab GFF; EGAPx as comparative set unless EGAPx clearly wins QC and curation.

---

## S9 — Polyploid / high BUSCO-D

**Goal:** Do not purge real haplotypes.

### Steps

1. Asm1: interpret BUSCO-D with ploidy.  
2. Prefer **S4** (annotate hap1 & hap2) over collapsed primary.  
3. If collapsed primary unavoidable: document; expect fusion/split errors → more GSAman.  
4. Report BUSCO-C and -D separately in release.

---

## S10 — TE ORF inflation

**Goal:** Deflate fake gene count.

### Steps

1. Stop prediction. Rebuild TE lib + **A0b ProtExcluder**; re-soft-mask.  
2. Re-run **S1** (or S2).  
3. **A5c**: drop models lacking RNA **and** Pfam **and** homolog only.  
4. Protect NLR/stilbene from FPKM-only deletion.  
5. Re-QC gene count vs near relative × ploidy.

---

## S11 — Quick lift only

**Goal:** Provisional IDs for synteny / early popgen.

### Steps

1. Asm1 minimal OK. Soft-mask optional for Liftoff but recommended.  
2. **A2c** Liftoff from PN40024.  
3. AGAT counts; optional protein BUSCO.  
4. **No** claim of qualified reference — METHODS `status=provisional`.  
5. Upgrade path: S1 when RNA ready.

```bash
liftoff -g "$REF_GFF" -o "$WORK_DIR/draft/liftoff.gff3" -polish \
  "$GENOME_FA" "$REF_FA"
bash pipeline/A5_agat_stats.sh "$WORK_DIR/draft/liftoff.gff3"
```

---

## S12 — Stop rules (all branches)

| Signal | Action |
|--------|--------|
| Priority empty at PSAURON threshold | Freeze candidate GFF |
| BUSCO-C flat across 2 curation rounds | Stop genome-wide GSAman |
| Only TE-like residuals | Document; don’t chase |
| New Iso-seq | Re-enter S3 on affected chromosomes |

Qualified release = PLAYBOOK checklist, not “one more ab initio tool.”
