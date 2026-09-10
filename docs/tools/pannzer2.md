# PANNZER2 — GO + descriptions (Camellia T2T FA stack)

**Role:** High-quality plant/animal FA papers often add PANNZER2 beside eggNOG + InterProScan (*Camellia nitidissima* Sci Data 2025).

## Get it
- Web / container options exist (e.g. community Docker images).  
- Official PANNZER service historically at http://ekhidna2.biocenter.helsinki.fi/sanspanz/ (check current host).

## Use here

1. Submit `$PROTEINS_FA` (or run local container).  
2. Save tabular output under `$FUNCTION_DIR/pannzer/`.  
3. Join:

```bash
python3 "$REPO_ROOT/pipeline/F4b_join_pannzer.py" \
  --master "$FUNCTION_DIR/merge/functional_master.tsv" \
  --pannzer "$FUNCTION_DIR/pannzer/pannzer.out" \
  --out "$FUNCTION_DIR/merge/functional_master.with_pannzer.tsv"
```

Prefer PANNZER descriptions when AHRD not run; do not overwrite emapper GO blindly — keep both columns.
