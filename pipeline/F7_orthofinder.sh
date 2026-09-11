#!/usr/bin/env bash
# OrthoFinder on a panel of proteomes, then point FA at OG representatives.
# Usage: put *.faa in $FUNCTION_DIR/orthofinder/input/ then RUN=1 bash pipeline/F7_orthofinder.sh
set -euo pipefail
: "${WORK_DIR:?}"
: "${THREADS:?}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
IN="$FUNCTION_DIR/orthofinder/input"
OUT="$FUNCTION_DIR/orthofinder/run"
mkdir -p "$IN" "$OUT"
if [[ "${RUN:-0}" != "1" ]]; then
  echo "[dry] place proteomes in $IN then: RUN=1 bash $0"
  exit 0
fi
command -v orthofinder >/dev/null || { echo "[ERR] orthofinder not on PATH"; exit 1; }
n=$(find "$IN" -maxdepth 1 \( -name '*.faa' -o -name '*.fasta' -o -name '*.fa' \) | wc -l)
[[ "$n" -ge 2 ]] || { echo "[ERR] need ≥2 proteomes in $IN"; exit 1; }
orthofinder -f "$IN" -t "$THREADS" -a "$THREADS" -o "$OUT"
echo "[OK] OrthoFinder → $OUT"
echo "Next: pick OG representatives → set PROTEINS_FA → run F1/F2; see docs/SCENARIOS_FUNCTIONAL.md F7"
