# Main process — functional annotation

**Goal:** attach function to a stable gene set.  
**Input:** representative `PROTEINS_FA` (+ optional `CURATED_GFF`).  
**Output:** TSVs (GO, KEGG, domains, descriptions) and optionally GFF column-9 attributes under `$WORK_DIR/function/`.

```text
curated proteins (+ GFF)
  → F0 protein QC
  → branch F1–F8
  → merge tables
  → release functional package + METHODS
```

If you lack a GFF/proteins, run upstream [`MAIN.md`](MAIN.md) (structural S1–S14) first, or import someone else’s release.

| ID | When | Core tools |
|----|------|------------|
| **F1** | Default / paper | eggNOG-mapper + InterProScan + DIAMOND SwissProt |
| **F2** | Fast / HPC light | eggNOG-mapper only (+ KEGGaNOG optional) |
| **F3** | Non-model frame | EnTAP |
| **F4** | Human-readable names | AHRD / eifunannot |
| **F5** | Transcriptome CDS | Trinotate |
| **F6** | Plant pathways | Mercator4 / MapMan (optional web/local) |
| **F7** | Multi-genome | OrthoFinder → annotate OG representatives |
| **F8** | NLR / families | HRP + Pfam/InterPro filters |

Recipes: [`../SCENARIOS_FUNCTIONAL.md`](../SCENARIOS_FUNCTIONAL.md).  
Commands: [`../FUNCTIONAL_GUIDE.md`](../FUNCTIONAL_GUIDE.md).
