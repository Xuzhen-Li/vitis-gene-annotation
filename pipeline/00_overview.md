# Last-mile overview

```
plant-gene-annotation (draft GFF)
        │
        ▼
01 QC ── BUSCO (proteins) + PSAURON
        │
        ▼
02 Priority list (worst scores + tandem neighborhoods + gene families of interest)
        │
        ▼
03 Evidence pack (Iso-seq / RNA BAM, Miniprot hits, homolog GFFs)
        │
        ▼
04 GSAman manual curation (priority first — not whole genome on day one)
        │
        ▼
05 Optional SynGAP polish (multi-haplotype / related species)
        │
        ▼
06 Versioned GFF release + changelog of error classes fixed
```

Honest scope: full-genome manual curation needs Iso-seq depth and person-months
(rice MH63 curated >10k loci). For *Vitis*, start with families that move your paper
(NLR, stilbene, flowering, disease QTL windows).
