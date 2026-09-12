#!/usr/bin/env bash
# eggNOG-mapper. Set RUN=1 to execute. Needs emapper.py on PATH or EGGNOG_SIF.
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
THREADS="${THREADS:-32}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
OUT="$FUNCTION_DIR/emapper"
mkdir -p "$OUT"
TAX="${EGGNOG_TAX_SCOPE:-auto}"
FUN_PREFIX="${FUN_PREFIX:-ann}"
DATA_ARGS=()
[[ -n "${EGGNOG_DATA_DIR:-}" ]] && DATA_ARGS=(--data_dir "$EGGNOG_DATA_DIR")

if [[ -n "${EGGNOG_SIF:-}" ]]; then
  PRE=(singularity exec "$EGGNOG_SIF")
else
  PRE=()
fi

CMD=("${PRE[@]}" emapper.py -i "$PROTEINS_FA" --output "${FUN_PREFIX}_fun" --output_dir "$OUT"
  --cpu "$THREADS" --type proteins -m diamond --tax_scope "$TAX" "${DATA_ARGS[@]}")
printf '[CMD] '; printf '%q ' "${CMD[@]}"; echo
if [[ "${RUN:-0}" == "1" ]]; then
  "${CMD[@]}"
  ls -1 "$OUT"/*.emapper.annotations
else
  echo "[DRY] export RUN=1 to execute"
fi
