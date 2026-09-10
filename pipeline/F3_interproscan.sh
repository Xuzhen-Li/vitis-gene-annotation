#!/usr/bin/env bash
# InterProScan domains / GO / pathways (F1).
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
THREADS="${THREADS:-32}"
OUT="$WORK_DIR/function/interpro"
mkdir -p "$OUT"
echo "[INFO] InterProScan → $OUT"
cat <<CMD
interproscan.sh -i $PROTEINS_FA -f tsv,gff3 -dp -cpu $THREADS -b $OUT/vitis_ips
# Optional: -appl Pfam,Gene3D,SUPERFAMILY,CDD,TIGRFAM
CMD
echo "[STOP] Install InterProScan data; then run F_merge_tables.py"
