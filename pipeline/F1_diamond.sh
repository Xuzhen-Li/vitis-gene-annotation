#!/usr/bin/env bash
# DIAMOND blastp vs SwissProt/UniProt for functional hits (F1/F4).
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
THREADS="${THREADS:-32}"
DIAMOND_DB="${DIAMOND_DB:?set DIAMOND_DB to swissprot.dmnd}"
OUT="$WORK_DIR/function/diamond"
mkdir -p "$OUT"
echo "[INFO] diamond blastp → $OUT/swissprot.tsv"
cat <<CMD
diamond blastp --threads $THREADS --query $PROTEINS_FA --db $DIAMOND_DB \\
  --out $OUT/swissprot.tsv --outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore stitle \\
  --evalue 1e-5 --max-target-seqs 5
CMD
echo "[STOP] Run the printed diamond command (module/container), then continue F2/F4"
