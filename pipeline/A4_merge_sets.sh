#!/usr/bin/env bash
# Merge two structural annotation sets into one draft for QC.
# Modes (set MERGE_MODE):
#   tsebra  — TSEBRA combiner (BRAKER-family GTFs; official)
#   evm     — EVidenceModeler weights (Krabbenhoft BRAKER+GeMoMa pattern)
#   evi_backbone — keep EviAnn loci; add BRAKER genes with zero coverage on EviAnn (keen-laras)
set -euo pipefail

: "${WORK_DIR:?}"
: "${DRAFT_GFF:?primary GFF/GTF}"
: "${DRAFT_GFF_B:?secondary GFF/GTF}"
MERGE_MODE="${MERGE_MODE:-tsebra}"
MERGED_GFF="${MERGED_GFF:-$WORK_DIR/draft/merged.gff3}"
mkdir -p "$(dirname "$MERGED_GFF")" "$WORK_DIR/merge"

case "$MERGE_MODE" in
  tsebra)
    echo "[INFO] TSEBRA — https://github.com/Gaius-Augustus/TSEBRA"
    echo "  tsebra.py -g $DRAFT_GFF,$DRAFT_GFF_B -o $MERGED_GFF ..."
    echo "[STOP] Wire TSEBRA cfg (default.cfg) for your pair of sets"
    ;;
  evm)
    echo "[INFO] EVidenceModeler — weight BRAKER vs GeMoMa (Krabbenhoft step 8)"
    echo "  Prepare gene_predictions.gff3 + transcript/protein evidence + weights.txt"
    echo "  Then: EVidenceModeler --genome \$GENOME_FA --weights weights.txt ..."
    echo "[STOP] Copy Krabbenhoft run_EVM.sh logic to your cluster modules"
    ;;
  evi_backbone)
    echo "[INFO] EviAnn backbone + BRAKER orphans (keen-laras/GenomeAnnotation)"
    command -v bedtools >/dev/null || { echo "need bedtools"; exit 1; }
    # gene BED from both (GFF3 gene features)
    awk 'BEGIN{OFS="\t"} $3=="gene"{
      id=$9; sub(/.*ID=/,"",id); sub(/;.*/,"",id);
      print $1,$4-1,$5,id
    }' "$DRAFT_GFF_B" > "$WORK_DIR/merge/evi.gene.bed"
    awk 'BEGIN{OFS="\t"} $3=="gene"{
      id=$9; sub(/.*ID=/,"",id); sub(/;.*/,"",id);
      print $1,$4-1,$5,id
    }' "$DRAFT_GFF" > "$WORK_DIR/merge/braker.gene.bed"
    # BRAKER genes with zero coverage on EviAnn
    bedtools coverage -a "$WORK_DIR/merge/braker.gene.bed" -b "$WORK_DIR/merge/evi.gene.bed" \
      | awk '$NF==0{print $4}' > "$WORK_DIR/merge/braker_orphan_ids.txt"
    echo "[OK] orphan BRAKER gene IDs -> $WORK_DIR/merge/braker_orphan_ids.txt"
    echo "Next: extract those genes from BRAKER GFF, concat with protein-coding EviAnn genes,"
    echo "      sort by chr/start, gffread -o $MERGED_GFF"
    ;;
  *)
    echo "unknown MERGE_MODE=$MERGE_MODE"; exit 1
    ;;
esac
