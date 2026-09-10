# A6 — Functional annotation (optional, after structure is stable)

Krabbenhoft steps 9–10 pattern:

- **eggNOG-mapper** (or InterProScan) on representative proteins
- Optional reciprocal DIAMOND vs UniProt / a grape proteome

Do this **after** last-mile structural curation, or you will re-annotate junk ORFs.
Functional TSVs can live under `work/function/` — do not treat them as gene models.
