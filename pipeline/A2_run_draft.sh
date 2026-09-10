#!/usr/bin/env bash
# Template launcher for the chosen draft engine.
# Real containers / modules differ by cluster — edit the case body for your site.
# Details: https://github.com/Xuzhen-Li/plant-gene-annotation
set -euo pipefail

: "${WORK_DIR:?}"
: "${GENOME_SOFT:?soft-masked FASTA}"
: "${DRAFT_GFF:?output GFF3 path}"
DRAFT_ENGINE="${DRAFT_ENGINE:-braker3}"
THREADS="${THREADS:-32}"
mkdir -p "$WORK_DIR/draft" "$(dirname "$DRAFT_GFF")"

case "$DRAFT_ENGINE" in
  braker3)
    : "${PROTEIN_DB:?OrthoDB Viridiplantae/eudicots FASTA}"
    : "${RNA_BAM:?HISAT2/STAR BAM or set RNA_BAM=none}"
    echo "[INFO] BRAKER3 template — wire to your module/container"
    if [[ "${RNA_BAM}" == "none" ]]; then
      echo "  braker.pl --genome=$GENOME_SOFT --prot_seq=$PROTEIN_DB --softmasking --threads=$THREADS ..."
    else
      echo "  braker.pl --genome=$GENOME_SOFT --prot_seq=$PROTEIN_DB --bam=$RNA_BAM --softmasking --threads=$THREADS ..."
    fi
    echo "[STOP] Fill the real braker.pl / singularity call for your cluster, then write $DRAFT_GFF"
    ;;
  galba)
    : "${PROTEIN_DB:?}"
    echo "[INFO] GALBA template"
    echo "  galba.pl --genome=$GENOME_SOFT --prot_seq=$PROTEIN_DB --softmasking --threads=$THREADS ..."
    echo "[STOP] Wire GALBA, write $DRAFT_GFF"
    ;;
  gemoma)
    : "${REF_GFF:?}" ; : "${REF_FA:?}"
    echo "[INFO] GeMoMa template — project $REF_GFF from $REF_FA onto $GENOME_SOFT"
    echo "[STOP] Wire GeMoMa CLI, write $DRAFT_GFF"
    ;;
  eviann)
    : "${ISOSEQ_BAM:?}" ; : "${PROTEIN_DB:?}"
    echo "[INFO] EviAnn-class evidence build — see Zimin et al. 2026 Nat Methods"
    echo "[STOP] Wire EviAnn, write $DRAFT_GFF"
    ;;
  *)
    echo "unknown DRAFT_ENGINE=$DRAFT_ENGINE"; exit 1
    ;;
esac

# When the real command finishes, copy/normalize:
#   cp braker/braker.gff3 "$DRAFT_GFF"
