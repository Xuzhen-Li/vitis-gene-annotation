#!/usr/bin/env bash
# NLR list from InterProScan TSV (+ optional HRP note).
set -euo pipefail
: "${WORK_DIR:?}"
: "${REPO_ROOT:?}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
FUN_PREFIX="${FUN_PREFIX:-ann}"
IPS="${1:-$FUNCTION_DIR/interpro/${FUN_PREFIX}_ips.tsv}"
OUTDIR="$FUNCTION_DIR/nlr"
mkdir -p "$OUTDIR"
[[ -f "$IPS" ]] || { echo "[ERR] missing IPS TSV: $IPS"; exit 1; }
python3 "$REPO_ROOT/pipeline/F8_list_nlr_from_ips.py" \
  --ips "$IPS" \
  --out "$OUTDIR/nlr_candidates.tsv"
echo "[OK] $OUTDIR/nlr_candidates.tsv"
echo "Optional: run HRP on proteins (docs/tools/hrp.md) → $OUTDIR/hrp/"
