# vitis-gene-annotation

Full path: **genome assembly → main branched process → qualified GFF**.

| Doc | |
|-----|--|
| **[`docs/steps/MAIN.md`](docs/steps/MAIN.md)** | **Main process (all branches on one spine)** |
| **[`docs/AI_ASSIST.md`](docs/AI_ASSIST.md)** | **AI co-pilot: prompts, data, order, checks** |
| **[`docs/DETAILED_GUIDE.md`](docs/DETAILED_GUIDE.md)** | Step commands (S1 default + branch deltas) |
| **[`docs/TOOLS.md`](docs/TOOLS.md)** | Tool install & use |
| [`docs/SCENARIOS.md`](docs/SCENARIOS.md) | S1–S14 recipes |
| [`docs/steps/dclab/`](docs/steps/dclab/) | **S14 CantuLab EVM (merged)** |
| [`docs/PLAYBOOK.md`](docs/PLAYBOOK.md) | Qualification checklist |
| [`docs/PEER_PIPELINES.md`](docs/PEER_PIPELINES.md) | Blueprints |

**Tool order (S1):** hifiasm → YaHS → BUSCO(genome) → EDTA/ProtExcluder → RepeatMasker → HISAT2/STAR → **BRAKER4 (or BRAKER3)** → GeMoMa/Liftoff → EVM → AGAT → BUSCO+PSAURON → GSAman → release.  
**S14 order:** repeats → PASA → train Augustus/GeneMark → predict → EVM → PASA polish → filter → rename → same QC/GSAman/release.

## Branch flowchart (main process)

```mermaid
flowchart TD
  start([Raw reads HiFi / ONT / Hi-C]) --> Asm0[Asm0 Assemble / phase / scaffold / purge]
  Asm0 --> Asm1{Asm1 Assembly QC gate}
  Asm1 -->|fail| Asm0
  Asm1 -->|pass| A0[A0 Soft-mask TE + ProtExcluder / EDTA]
  A0 --> pick{Main branch pick}

  pick -->|S1 RNA+prot| S1[S1 BRAKER3 + GeMoMa/Liftoff → EVM]
  pick -->|S2 no RNA| S2[S2 GALBA/GeMoMa + Liftoff]
  pick -->|S3 Iso-seq| S3[S3 EviAnn + BRAKER orphans]
  pick -->|S6 thin| S6[S6 Homology provisional]
  pick -->|S11 lift only| S11[S11 Liftoff provisional]
  pick -->|S13 Helixer| S13[S13 Helixer + Mikado]
  pick -->|S14 CantuLab| S14[S14 PASA → Augustus/GeneMark → EVM → polish]

  S1 --> multi{S4 many haplotypes?}
  S2 --> multi
  S3 --> multi
  S6 --> multi
  S13 --> multi
  S14 --> multi
  S11 --> QC

  multi -->|yes| S4[S4 Liftoff + SynGAP panel]
  multi -->|no| draft[Merged / polished draft GFF]
  S4 --> draft

  draft --> focus{Depth?}
  focus -->|S5 paper| S5[S5 OMArk + deep GSAman]
  focus -->|S7 family/QTL| S7[S7 Window curation]
  focus -->|standard| QC[AGAT → proteins → BUSCO + PSAURON + A5d]
  S5 --> QC
  S7 --> QC

  QC --> problems{Repair?}
  problems -->|S10 TE inflation| S10[S10 Remask → re-draft]
  problems -->|S9 high BUSCO-D| S9[S9 Per-haplotype annotation]
  problems -->|S8 NCBI| S8[S8 EGAPx parallel]
  problems -->|OK| pri[Priority → GSAman]
  S10 --> pick
  S9 --> S4
  S8 --> pri

  pri --> stop{S12 Stop rules}
  stop -->|more| pri
  stop -->|stable| qual[Qualification checklist]
  qual --> release([Qualified GFF + METHODS])
```

## Default lines

- **Modern default:** `Asm0 → Asm1 → A0 → S1 → QC → GSAman → release`  
- **CantuLab grape METHODS:** `Asm0 → Asm1 → A0 → S14 → QC → GSAman → release`  
- **AI helping:** [`docs/AI_ASSIST.md`](docs/AI_ASSIST.md)

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
```

## This is not

- Not a HiFi assembler package — Asm0 is a hand-off checklist  
- Not TE-only — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)  
- Not graphs — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)

No private FASTQ/BAM in git.

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
