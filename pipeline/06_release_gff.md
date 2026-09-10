# Release a curated GFF

Checklist:

- [ ] `CURATED_GFF` validates (`gffread` / `genometools gff3validator` if available)
- [ ] Protein set regenerated; BUSCO + PSAURON re-run (`01`)
- [ ] `changelog.tsv` summarizes counts by error class
- [ ] Tag `RELEASE_TAG` (e.g. `vitis_ann.v0.1`)
- [ ] Public files only: GFF3 + protein FASTA + short METHODS.md — **no** private BAMs

Record lineage odb version and tool versions in METHODS.md.
