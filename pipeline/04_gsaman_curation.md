# Manual curation with GSAman

Upstream: https://github.com/CJ-Chen/GSAman/releases  
Paper: Chen et al. 2026 *The Innovation* doi:10.1016/j.xinn.2026.101471

## Practice for this lab

1. Load genome + draft GFF + evidence tracks.
2. Work **priority.tsv** top-down; tag each fix with an [error class](../docs/ERROR_CLASSES.md).
3. Prefer Iso-seq-supported intron boundaries; check canonical GT-AG when flipping splice sites.
4. For tandem arrays: zoom out, count paralogs against protein hits — do not accept one collapsed CDS without evidence.
5. Export curated GFF3 frequently; keep a short changelog (`work/changelog.tsv`: gene_id, class, note).

GSAman is local / offline-friendly relative to Apollo2 server stacks.
Respect upstream non-commercial terms on the release page.
