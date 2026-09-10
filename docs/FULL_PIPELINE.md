# Full *Vitis* gene-structure annotation pipeline

```mermaid
flowchart TD
  A[Assembly] --> B[TE lib + ProtExcluder]
  B --> C[Soft-mask]
  C --> D[HISAT2/STAR/Iso-seq]
  D --> E1[BRAKER3 / GALBA / Helixer / EGAPx]
  C --> E2[GeMoMa / EviAnn / Liftoff]
  E1 --> F[Merge TSEBRA / EVM / evi_backbone]
  E2 --> F
  F --> G[AGAT + optional GetaFilter-style screen]
  G --> H[Proteins]
  H --> I[BUSCO + PSAURON + OMArk/Compleasm]
  I --> J[Priority loci]
  J --> K[GSAman]
  K --> L[Optional SynGAP]
  L --> M[Release GFF]
  M --> N[Optional eggNOG]
```

## Stage table

| Stage | Path | Peer idea |
|-------|------|-----------|
| A0 / A0b | soft-mask · ProtExcluder | Krabbenhoft, vitis-te |
| A1 / A1b | engine · RNA | plant-gene-annotation, Sylvan |
| A2 / A2b / A2c / A2d | primary · second · Liftoff · EGAPx optional | BRAKER, GeMoMa, Liftoff, NCBI |
| A4 | merge | TSEBRA / EVM / keen-laras |
| A5 / A5b / A5c | AGAT · OMArk/compleasm · expression filter | AGAT, OMArk, GetaFilter |
| A3 | proteins | — |
| 01–06 | last mile | GSAman, SynGAP |
| A6 | function | eggNOG |

## Default *Vitis* path

1. Soft-mask (curated TE lib).  
2. Map RNA.  
3. **BRAKER3** + **GeMoMa or Liftoff** from PN40024.  
4. **EVM** (or TSEBRA / evi_backbone).  
5. AGAT → proteins → BUSCO + PSAURON (+ OMArk if installed).  
6. GSAman on NLR / stilbene / low-ORF Liftoff loci.  
7. Release; optional eggNOG.

Optional: run **EGAPx** as a parallel set for NCBI-style comparison (`A2d`).

Peers: [`PEER_PIPELINES.md`](PEER_PIPELINES.md). Config: [`../config/example.env`](../config/example.env).
