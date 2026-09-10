# Stage reference

**Human entry point:** [`PLAYBOOK.md`](PLAYBOOK.md) (complete flow + scenario index).  
**Situations:** [`SCENARIOS.md`](SCENARIOS.md).

```mermaid
flowchart TD
  A[Assembly] --> B[TE lib + ProtExcluder]
  B --> C[Soft-mask]
  C --> D[HISAT2/STAR/Iso-seq]
  D --> E1[BRAKER3 / GALBA / Helixer / EGAPx]
  C --> E2[GeMoMa / EviAnn / Liftoff]
  E1 --> F[Merge TSEBRA / EVM / evi_backbone]
  E2 --> F
  F --> G[AGAT + optional expression/domain screen]
  G --> H[Proteins]
  H --> I[BUSCO + PSAURON + OMArk/Compleasm]
  I --> J[Priority loci]
  J --> K[GSAman]
  K --> L[Optional SynGAP]
  L --> M[Release GFF]
  M --> N[Optional eggNOG]
```

## Stage table

| Stage | Path |
|-------|------|
| A0 / A0b | `pipeline/A0_softmask.md` · `A0b_protexcluder.md` |
| A1 / A1b | `A1_choose_engine.md` · `A1b_rna_align.md` |
| A2 / A2b / A2c / A2d | draft · second · Liftoff · EGAPx |
| A4 | `A4_merge_sets.sh` |
| A5 / A5b / A5c | AGAT · OMArk/compleasm · GetaFilter-style |
| A3 | `A3_proteins_from_gff.sh` |
| 01–06 | last mile |
| A6 | functional optional |

Default *Vitis*: BRAKER3 + GeMoMa/Liftoff → EVM → AGAT → BUSCO/PSAURON → GSAman (NLR-first).
