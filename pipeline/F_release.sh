#!/usr/bin/env bash
# Package functional release + METHODS stub.
set -euo pipefail
: "${WORK_DIR:?}"
: "${RELEASE_TAG:?}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
REL="$FUNCTION_DIR/release/${RELEASE_TAG}"
mkdir -p "$REL"
MASTER="$FUNCTION_DIR/merge/functional_master.tsv"
[[ -f "$MASTER" ]] || MASTER="$FUNCTION_DIR/merge/functional_master.with_mapman.tsv"
[[ -f "$MASTER" ]] || MASTER="$FUNCTION_DIR/merge/functional_master.with_ahrd.tsv"
if [[ ! -f "$MASTER" ]]; then
  echo "[ERR] no functional_master*.tsv under $FUNCTION_DIR/merge" >&2
  exit 1
fi
cp -L "$MASTER" "$REL/functional_master.tsv"
cp -L "$PROTEINS_FA" "$REL/proteins.faa" 2>/dev/null || true
[[ -d "$FUNCTION_DIR/qc" ]] && cp -r "$FUNCTION_DIR/qc" "$REL/" || true
cat > "$REL/METHODS.md" << MTX
# Functional annotation METHODS (${RELEASE_TAG})

- Protein set: \`proteins.faa\` (one representative CDS translation per gene)
- DIAMOND vs Swiss-Prot: see diamond/ (DB release: FILL)
- eggNOG-mapper: version FILL ; database FILL ; tax_scope FILL
- InterProScan: version FILL
- Optional: KofamScan / Mercator4 / AHRD — FILL dates
- Merge: plant FA playbook (this repo) pipeline/F_merge_tables.py
- QC: BUSCO protein summary under qc/

Do not distribute private BAM/FASTQ with this release.
MTX
echo "[OK] release at $REL"
ls -la "$REL"
