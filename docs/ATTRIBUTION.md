# Attribution (字爹)

This playbook is adapted from public tools and papers. Scripts here are rewritten
for a *Vitis* lab grain; they do not vendor third-party binaries or genotype data.

| Peer | Role here |
|------|-----------|
| [CJ-Chen/GSAman](https://github.com/CJ-Chen/GSAman) · Chen et al. 2026 *The Innovation* ([doi:10.1016/j.xinn.2026.101471](https://doi.org/10.1016/j.xinn.2026.101471)) | Local WYSIWYG gene-structure curation; four error classes; MH63 case study metrics |
| SynGAP · Wu, Mai, Chen, Xia 2024 *Genome Biology* ([doi:10.1186/s13059-024-03359-8](https://doi.org/10.1186/s13059-024-03359-8)) | Synteny-based polishing across related haplotypes / species |
| EviAnn · Zimin et al. 2026 *Nat Methods* | Evidence-first automated draft (run via sibling [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) notes) |
| PSAURON · (see GSAman Methods) | ML score for whether a predicted CDS looks like a real coding region |
| BUSCO | Completeness of protein set vs lineage odb |
| Ji, Pertea & Salzberg 2026 *Nat Rev Genet* | Broader annotation-at-scale review (context only) |

Install GSAman from upstream releases (non-commercial terms on their page).
Do not commit private Iso-seq / RNA-seq into this repo.
