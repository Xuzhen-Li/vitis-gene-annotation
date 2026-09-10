# eggNOG-mapper — default functional engine

**Role:** F1/F2 — GO, KEGG, COG, PFAM transfer via orthology.

## Get it
https://github.com/eggnogdb/eggnog-mapper — prefer Apptainer image + eggNOG 7 (v3).

## Pattern
See `pipeline/F2_eggnog.sh`. Set `--tax_scope` toward Viridiplantae / auto.

## Pitfalls
- Mixing v2 DB with v3 binary.  
- Annotating before TE-inflated ORFs are cleaned (upstream S10).
