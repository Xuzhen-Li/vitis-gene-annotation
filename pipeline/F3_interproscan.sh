#!/usr/bin/env bash
# InterProScan. Set RUN=1. Needs INTERPROSCAN_HOME pointing at install dir.
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
: "${INTERPROSCAN_HOME:?set INTERPROSCAN_HOME to directory containing interproscan.sh}"
THREADS="${THREADS:-32}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
OUT="$FUNCTION_DIR/interpro"
mkdir -p "$OUT"
IPS="$INTERPROSCAN_HOME/interproscan.sh"
CMD=("$IPS" -i "$PROTEINS_FA" -f tsv,gff3 -dp -cpu "$THREADS" -b "$OUT/vitis_ips")
printf '[CMD] '; printf '%q ' "${CMD[@]}"; echo
if [[ "${RUN:-0}" == "1" ]]; then
  "${CMD[@]}"
  ls -1 "$OUT"/vitis_ips.tsv
else
  echo "[DRY] export RUN=1 to execute"
fi
