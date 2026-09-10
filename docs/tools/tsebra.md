# TSEBRA — combine two BRAKER-family GTFs

**Role:** Merge when both sets are BRAKER/GALBA-style (`MERGE_MODE=tsebra`).

## Get it
- https://github.com/Gaius-Augustus/TSEBRA

## Pattern
```bash
tsebra.py -g set1.gtf,set2.gtf -c default.cfg -o "$WORK_DIR/draft/tsebra.gtf"
gffread "$WORK_DIR/draft/tsebra.gtf" -o "$MERGED_GFF"
```

## When vs EVM
| TSEBRA | EVM |
|--------|-----|
| Two Augustus-family GTFs | Heterogeneous tracks (BRAKER + GeMoMa + Liftoff + PASA) |

## Pitfalls
- Feeding Liftoff GFF without conversion.  
- Ignoring `default.cfg` transcript support rules.
