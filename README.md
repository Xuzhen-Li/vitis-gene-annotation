# vitis-gene-annotation

Full path: **genome assembly → branched annotation routes → qualified GFF**.

| Doc | |
|-----|--|
| **[`docs/DETAILED_GUIDE.md`](docs/DETAILED_GUIDE.md)** | **Every step detailed (commands + outputs)** |
| **[`docs/TOOLS.md`](docs/TOOLS.md)** | **How to install & use each tool** |
| [`docs/PLAYBOOK.md`](docs/PLAYBOOK.md) | Spine + qualification checklist |
| [`docs/SCENARIOS.md`](docs/SCENARIOS.md) | S1–S12 step-by-step how to annotate |
| [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) | Stage index |
| [`docs/PEER_PIPELINES.md`](docs/PEER_PIPELINES.md) | Blueprints |

**Tool order (S1):** hifiasm → YaHS → BUSCO(genome) → ProtExcluder → RepeatMasker → HISAT2/STAR → BRAKER3 → GeMoMa/Liftoff → EVM → AGAT/gffread → BUSCO+PSAURON → GSAman → re-QC/release.  Full table: [`docs/TOOLS.md`](docs/TOOLS.md).


## Branch flowchart

```mermaid
flowchart TD
  start([Raw reads HiFi / ONT / Hi-C]) --> Asm0[Asm0 Assemble / phase / scaffold / purge]
  Asm0 --> Asm1{Asm1 Assembly QC gate}
  Asm1 -->|fail| Asm0
  Asm1 -->|pass| A0[A0 Soft-mask TE + ProtExcluder]
  A0 --> pick{Evidence / goal?}

  pick -->|RNA + proteins| S1[S1 BRAKER3 + GeMoMa/Liftoff → EVM]
  pick -->|proteins only| S2[S2 GALBA / GeMoMa + Liftoff]
  pick -->|deep Iso-seq| S3[S3 EviAnn backbone + BRAKER orphans]
  pick -->|thin evidence| S6[S6 Homology-first provisional]
  pick -->|quick synteny IDs| S11[S11 Liftoff only provisional]

  S1 --> multi{Many haplotypes?}
  S2 --> multi
  S3 --> multi
  S6 --> multi
  S11 --> QC

  multi -->|yes| S4[S4 Lift / SynGAP panel]
  multi -->|no| draft[Merged draft GFF]
  S4 --> draft

  draft --> focus{Publication or family focus?}
  focus -->|T2T paper| S5[S5 Extra QC + deeper GSAman]
  focus -->|NLR / QTL only| S7[S7 Window curation]
  focus -->|standard| QC[A5 AGAT → A3 proteins → BUSCO + PSAURON]
  S5 --> QC
  S7 --> QC

  QC --> problems{Problems?}
  problems -->|TE gene inflation| S10[S10 Remask + filter → re-draft]
  problems -->|high BUSCO-D| S9[S9 Annotate haplotypes separately]
  problems -->|need NCBI compare| S8[S8 EGAPx parallel set]
  problems -->|OK| pri[Priority list → GSAman]
  S10 --> pick
  S9 --> S4
  S8 --> pri

  pri --> stop{S12 Stop rules}
  stop -->|more curation| pri
  stop -->|stable| qual[Qualification checklist]
  qual --> release([Qualified GFF release + METHODS])
```

## Default line (most projects)

`Asm0 → Asm1 → A0 → S1 → AGAT/BUSCO/PSAURON → GSAman (priority) → qualified release`

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
# Follow docs/SCENARIOS.md S1 after assembly + soft-mask
```

## This is not

- Not a HiFi assembler package — Asm0 is a hand-off checklist  
- Not TE-only — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)  
- Not graphs — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)

No private FASTQ/BAM in git.

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
