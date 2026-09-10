# A1 — Choose the draft engine

From [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) skill defaults:

| Evidence you have | Engine | Notes |
|-------------------|--------|-------|
| RNA-seq **and** proteins | **BRAKER3** | OrthoDB Viridiplantae or eudicots — not Metazoa |
| Proteins only, close relatives | **GALBA** | Good when RNA is thin |
| Project from a close annotated genome | **GeMoMa** | Fast transfer; still needs QC |
| Strong Iso-seq / RNA alignments | **EviAnn** (or similar evidence-first) | Prefer when long-read transcriptome is deep |

Set `DRAFT_ENGINE=braker3|galba|gemoma|eviann` in `config/local.env`.
