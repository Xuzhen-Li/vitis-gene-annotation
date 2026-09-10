# A2c — Liftoff transfer (fast homologous draft)

Peers: [agshumate/Liftoff](https://github.com/agshumate/Liftoff),
[nhu92/HomologousAnnotationPipeline](https://github.com/nhu92/HomologousAnnotationPipeline),
Sylvan2 (Liftoff among evidence sources).

Use when you have a **well-curated close reference** (e.g. PN40024 → new cultivar haplotype).

```bash
# Example — polish optional
liftoff -g "$REF_GFF" -o "$WORK_DIR/draft/liftoff.gff3" \
  -dir "$WORK_DIR/draft/liftoff_int" \
  -p "$THREADS" \
  -polish \
  "$GENOME_FA" "$REF_FA"
```

## How it fits *Vitis*

| Role | Advice |
|------|--------|
| Primary draft | Prefer BRAKER3/EviAnn when RNA is rich |
| Second / third set | Liftoff or GeMoMa from PN40024 — both homology; pick one or merge carefully |
| Haplotype panel | Liftoff each haplotype from a curated reference before GSAman |

Watch: `valid_ORF=False` / low coverage in Liftoff attributes → priority for GSAman.
Do not treat Liftoff-only as publication-grade without QC.
