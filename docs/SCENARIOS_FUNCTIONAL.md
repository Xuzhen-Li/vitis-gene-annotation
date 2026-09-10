# Functional scenarios F1–F8 (every command in-repo)

Install: [`INSTALL_FUNCTIONAL.md`](INSTALL_FUNCTIONAL.md) · Detail: [`FUNCTIONAL_GUIDE.md`](FUNCTIONAL_GUIDE.md)

```bash
set -a && source config/local.env && set +a
```

---

## F1 — Full (default, paper)

```bash
# F0
busco -i "$PROTEINS_FA" -l viridiplantae_odb12 -m proteins -o prot_busco --out_path "$FUNCTION_DIR/qc" -c "$THREADS"

# DIAMOND
RUN=1 bash "$REPO_ROOT/pipeline/F1_diamond.sh"

# eggNOG
RUN=1 bash "$REPO_ROOT/pipeline/F2_eggnog.sh"

# InterProScan
RUN=1 bash "$REPO_ROOT/pipeline/F3_interproscan.sh"

# optional Kofam
# RUN=1 bash "$REPO_ROOT/pipeline/F1b_kofam.sh"

python3 "$REPO_ROOT/pipeline/F_merge_tables.py" \
  --proteins "$PROTEINS_FA" \
  --emapper "$FUNCTION_DIR/emapper"/vitis_fun.emapper.annotations \
  --ips "$FUNCTION_DIR/interpro"/vitis_ips.tsv \
  --diamond "$FUNCTION_DIR/diamond/swissprot.tsv" \
  --out "$FUNCTION_DIR/merge/functional_master.tsv"

bash "$REPO_ROOT/pipeline/F_release.sh"

# Camellia-grade extras (recommended for T2T papers):
# 1) PANNZER2 → F4b_join_pannzer.py
# 2) Mercator4 web → F6_ingest_mercator.py
# See docs/RECENT_HIGH_QUALITY.md
```

---

## F2 — Fast

```bash
busco -i "$PROTEINS_FA" -l viridiplantae_odb12 -m proteins -o prot_busco --out_path "$FUNCTION_DIR/qc" -c "$THREADS"
RUN=1 bash "$REPO_ROOT/pipeline/F2_eggnog.sh"
python3 "$REPO_ROOT/pipeline/F_merge_tables.py" \
  --proteins "$PROTEINS_FA" \
  --emapper "$FUNCTION_DIR/emapper"/vitis_fun.emapper.annotations \
  --out "$FUNCTION_DIR/merge/functional_master.tsv"
bash "$REPO_ROOT/pipeline/F_release.sh"
```

---

## F3 — EnTAP

Install/run EnTAP (GitLab PlantGenomicsLab) → copy TSV to `$FUNCTION_DIR/entap/` → document in METHODS → optional join. See [`FUNCTIONAL_GUIDE.md`](FUNCTIONAL_GUIDE.md) F3.

---

## F4 — Names (after F1.1)

AHRD on DIAMOND (+ IPS) → `F4_join_ahrd.py` → release. See guide F4 · [`tools/ahrd.md`](tools/ahrd.md).

---

## F5 — Trinotate

TransDecoder FA → Trinotate → `$FUNCTION_DIR/trinotate/` · [`tools/trinotate.md`](tools/trinotate.md).

---

## F6 — Mercator4

Browser upload (steps in guide F6) → `F6_ingest_mercator.py` → release.

---

## F7 — OrthoFinder

`orthofinder -f …` then F1 on OG reps · guide F7.

---

## F8 — NLR

F1.3 InterProScan → `F8_list_nlr_from_ips.py` → optional HRP · [`tools/hrp.md`](tools/hrp.md).

---

## Chooser

| Goal | Branch |
|------|--------|
| Paper-ready | **F1** |
| Quick | **F2** |
| EnTAP lab | **F3** |
| Readable names | **F1 then F4** |
| MapMan BINs | **F1 then F6** |
| Transcriptome only | **F5** |
| Pan genomes | **F7** |
| NLR focus | **F1 then F8** |
