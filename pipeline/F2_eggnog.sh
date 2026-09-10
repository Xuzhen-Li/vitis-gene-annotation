#!/usr/bin/env bash
# eggNOG-mapper functional annotation (default F1/F2).
# Prefer official Singularity image — https://github.com/eggnogdb/eggnog-mapper
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
THREADS="${THREADS:-32}"
OUT="$WORK_DIR/function/emapper"
mkdir -p "$OUT"
TAX_SCOPE="${EGGNOG_TAX_SCOPE:-Viridiplantae}"
echo "[INFO] emapper → $OUT (tax_scope=$TAX_SCOPE)"
cat <<CMD
# Example v2-style; for v3 see upstream USAGE.md / Apptainer image:
emapper.py -i $PROTEINS_FA --output vitis_fun --output_dir $OUT \\
  --cpu $THREADS --type proteins -m diamond --tax_scope $TAX_SCOPE \\
  --go_evidence non-electronic --pfam_realign realtime
CMD
echo "[STOP] Wire emapper DB + binary/container; expect *.emapper.annotations"
