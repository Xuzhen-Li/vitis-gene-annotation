#!/usr/bin/env bash
# DIAMOND blastp vs SwissProt. Set RUN=1 to execute.
set -euo pipefail
: "${PROTEINS_FA:?}"
: "${WORK_DIR:?}"
: "${DIAMOND_DB:?set DIAMOND_DB in config/local.env}"
THREADS="${THREADS:-32}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
OUT="$FUNCTION_DIR/diamond"
mkdir -p "$OUT"
CMD=(diamond blastp --threads "$THREADS" --query "$PROTEINS_FA" --db "$DIAMOND_DB"
  --out "$OUT/swissprot.tsv"
  --outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore stitle
  --evalue 1e-5 --max-target-seqs 5)
printf '[CMD]'; printf '%q ' "${CMD[@]}"; echo
if [[ "${RUN:-0}" == "1" ]]; then
  "${CMD[@]}"
  echo "[OK] $OUT/swissprot.tsv ($(wc -l <"$OUT/swissprot.tsv") lines)"
else
  echo "[DRY] export RUN=1 to execute"
fi
