# Functional annotation — detailed guide

Work layout:

```text
$WORK_DIR/function/
  diamond/   emapper/   interpro/   ahrd/   entap/   merge/   release/
```

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
mkdir -p "$WORK_DIR/function"/{diamond,emapper,interpro,ahrd,entap,merge,release}
```

**Prerequisite:** one protein per gene preferred (`pipeline/A3_proteins_from_gff.sh` if you have a GFF).

---

## F0 — Protein QC

```bash
busco -i "$PROTEINS_FA" -l viridiplantae_odb12 -m proteins \
  -o prot_busco --out_path "$WORK_DIR/function" -c "$THREADS"
# optional: bash pipeline/A5b_omark_compleasm.sh
```

Done when BUSCO summary is saved. Junk-heavy proteomes → fix structure upstream first.

---

## F1 — Default full functional set

### 1. DIAMOND vs SwissProt / UniProt

```bash
bash pipeline/F1_diamond.sh
# → function/diamond/swissprot.tsv
```

### 2. eggNOG-mapper

```bash
bash pipeline/F2_eggnog.sh
# → function/emapper/*.emapper.annotations
```

### 3. InterProScan

```bash
bash pipeline/F3_interproscan.sh
# → function/interpro/*.tsv
```

### 4. Merge

```bash
python3 pipeline/F_merge_tables.py \
  --proteins "$PROTEINS_FA" \
  --emapper "$WORK_DIR/function/emapper"/*.emapper.annotations \
  --ips "$WORK_DIR/function/interpro"/*.tsv \
  --diamond "$WORK_DIR/function/diamond/swissprot.tsv" \
  --out "$WORK_DIR/function/merge/functional_master.tsv"
```

Optional: attach to GFF with AGAT / custom script; copy master TSV to `function/release/`.

---

## F2 — Fast path

Only eggNOG-mapper (F2_eggnog.sh). Optional [KEGGaNOG](https://github.com/ilypopv/KEGGaNOG) for pathway heatmaps.

---

## F3 — EnTAP

Follow https://gitlab.com/PlantGenomicsLab/EnTAP (moved from GitHub). Point `PROTEINS_FA` or CDS; export tables into `function/entap/`, then merge.

---

## F4 — AHRD names

BLAST/DIAMOND tabular hits → [AHRD](https://github.com/groupschoof/AHRD) or [eifunannot](https://github.com/EI-CoreBioinformatics/eifunannot).  
Readable descriptions → join into `functional_master.tsv`.

---

## F5 — Trinotate

Use when starting from transcriptome/TransDecoder peptides: https://github.com/Trinotate/Trinotate

---

## F6 — Mercator / MapMan

Plant BIN ontology (web Mercator4 or local if licensed). Export BIN assignments; join by protein id.

---

## F7 — OrthoFinder panel

Run OrthoFinder on grape + relatives; annotate OG representative with F1; propagate majority labels (document rules in METHODS).

---

## F8 — NLR / special families

HRP ([`tools/hrp.md`](tools/hrp.md)) + InterPro NLR domains; never drop NLRs on FPKM alone.

---

## Release checklist (functional)

- [ ] Protein set version / GFF tag recorded  
- [ ] eggNOG DB version / InterProScan version / DIAMOND DB date in METHODS  
- [ ] One-row-per-gene master TSV  
- [ ] GO/KEGG/Pfam columns explained  
- [ ] NLR/special sets listed if claimed  
- [ ] No private sequences in git  

Peers: [`PEER_PIPELINES.md`](PEER_PIPELINES.md) functional section.
