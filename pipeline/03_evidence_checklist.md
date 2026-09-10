# Evidence pack (before opening GSAman)

For each priority locus / window:

- [ ] Soft-masked genome track (TE from [vitis-te](https://github.com/Xuzhen-Li/vitis-te) if available)
- [ ] Draft GFF loaded
- [ ] Iso-seq or high-quality RNA alignments (BAM/CRAM) covering the locus
- [ ] Protein homology: Miniprot (or similar) hits from a trusted proteome (e.g. PN40024, related *Vitis*)
- [ ] Homolog gene models from a curated grape annotation (if public)
- [ ] Note tandem neighbors (±50–100 kb) — watch for collapse

TBtools-II plugins described in the GSAman paper can prepare some of these;
command-line equivalents are fine. Do not commit raw reads here.
