#!/usr/bin/env bash
# Optional iTAK (plant TF / TR / kinases) — HR HSE-style METHODS add-on.
# Requires iTAK on PATH and PROTEINS_FA set.
set -euo pipefail
: "${WORK_DIR:?}"
: "${PROTEINS_FA:?}"
FUNCTION_DIR="${FUNCTION_DIR:-$WORK_DIR/function}"
OUT="$FUNCTION_DIR/itak"
mkdir -p "$OUT"
if [[ "${RUN:-0}" != "1" ]]; then
  echo "[dry] RUN=1 bash $0   # writes under $OUT"
  exit 0
fi
command -v iTAK >/dev/null 2>&1 || command -v itak >/dev/null 2>&1 || {
  echo "[ERR] iTAK not on PATH — see docs/tools/itak.md"
  exit 1
}
BIN=$(command -v iTAK 2>/dev/null || command -v itak)
# Common invocation; adjust if your build differs
"$BIN" -p "$PROTEINS_FA" -o "$OUT" || "$BIN" "$PROTEINS_FA" "$OUT"
echo "[OK] iTAK outputs under $OUT — cite Zheng et al. Mol Plant 2016 in METHODS"
