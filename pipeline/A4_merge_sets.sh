#!/usr/bin/env bash
# Merge two structural annotation sets. See docs/DETAILED_GUIDE.md Step 7.
set -euo pipefail
: "${WORK_DIR:?}"
: "${DRAFT_GFF:?primary GFF/GTF}"
: "${DRAFT_GFF_B:?second GFF/GTF}"
MERGE_MODE="${MERGE_MODE:-evm}"
MERGED_GFF="${MERGED_GFF:-$WORK_DIR/draft/merged.gff3}"
mkdir -p "$(dirname "$MERGED_GFF")" "$WORK_DIR/draft"

case "$MERGE_MODE" in
  evm)
    cat <<MSG
[EVM] Prepare EvidenceModeler inputs from:
  A=$DRAFT_GFF
  B=$DRAFT_GFF_B
Typical flow (Krabbenhoft / EVM wiki):
  1) Convert each GFF → gene_predictions.gff3 (EVM format)
  2) weights.txt example ideas:
       ABINITIO_PREDICTION	BRAKER	5
       OTHER_PREDICTION	GeMoMa	8
       OTHER_PREDICTION	Liftoff	7
       TRANSCRIPT	stringtie_or_pasa	10   # if you have it
  3) partition → EvmUtils → combine → $MERGED_GFF
Weight templates: config/evm_weights_cantulab.txt (PASA/S14) or config/evm_weights_s1_braker.txt (S1).
Full CantuLab partition commands: docs/peers/cantulab_evm.md and upstream step 07.
Wire your site’s run_EVM.sh here, then:
  # cp final.gff3 $MERGED_GFF
MSG
    echo "[STOP] EVM must be run with your installed EVidenceModeler"
    ;;
  tsebra)
    cat <<MSG
[TSEBRA] Two BRAKER-family GTFs:
  tsebra.py -g $DRAFT_GFF,$DRAFT_GFF_B -c default.cfg -o $WORK_DIR/draft/tsebra.gtf
  gffread $WORK_DIR/draft/tsebra.gtf -o $MERGED_GFF
MSG
    echo "[STOP] Install TSEBRA and run the printed command"
    ;;
  evi_backbone)
    cat <<MSG
[EviAnn backbone] Keep EviAnn genes from $DRAFT_GFF_B (or rename vars).
Add BRAKER genes from $DRAFT_GFF that do not overlap backbone (bedtools intersect -v).
Write union to $MERGED_GFF then AGAT clean.
MSG
    echo "[STOP] Implement overlap filter for your GFF attribute scheme"
    ;;
  *)
    echo "MERGE_MODE must be evm|tsebra|evi_backbone"; exit 1
    ;;
esac
