# METHODS template — functional annotation

Copy into `work/function/release/<TAG>/METHODS.md` and fill FILLs.  
Cite only venues you actually used ([`CITATIONS.md`](CITATIONS.md); journal allowlist in [`RECENT_HIGH_QUALITY.md`](RECENT_HIGH_QUALITY.md)).

```text
Functional annotation. Representative protein sequences (one translation per
gene model) were compared with DIAMOND blastp to UniProt Swiss-Prot (release FILL)
and annotated with eggNOG-mapper vFILL (eggNOG database FILL; taxonomic scope FILL)
and InterProScan vFILL. Gene ontology and KEGG orthology terms were taken from
eggNOG-mapper (and/or KofamScan, FILL). Domain architectures were taken from
InterProScan. Optional human-readable descriptions were assigned with AHRD (FILL).
Optional MapMan4 BINs were assigned with Mercator4 (job date FILL; Schwacke et al.
Mol. Plant 2019). Optional transcription-factor / kinase families were predicted
with iTAK (Zheng et al. Mol. Plant 2016). Optional NLR candidates were listed from
InterProScan domain hits and/or HRP (FILL). Per-gene tables were merged with the
vitis-gene-annotation functional pipeline (functional_master.tsv). Protein-set
completeness was summarized with BUSCO (lineage FILL; mode proteins).
```

**Do not** claim this repository mirrors another lab’s private pipeline; cite the
tools and papers above.
