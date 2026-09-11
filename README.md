# vitis-gene-annotation

**Main product: functional annotation** of *Vitis* gene sets  
(GO / KEGG / domains / readable names / pathway summaries).

This is a standalone teaching / METHODS playbook. Cite tools and papers you use ([`docs/CITATIONS.md`](docs/CITATIONS.md)); it is not a mirror of another lab’s repo.

Structural annotation (finding gene models) is **upstream input**, documented under `docs/steps/` so you can produce or accept a qualified GFF+proteins — then this repo’s primary spine starts.

| Doc | |
|-----|--|
| [`docs/RECENT_HIGH_QUALITY.md`](docs/RECENT_HIGH_QUALITY.md) | Allowlisted journals only (Cell+ / MP PC PBJ HR MBE NAR GB) |
| **[`docs/INSTALL_FUNCTIONAL.md`](docs/INSTALL_FUNCTIONAL.md)** | **Install DBs + tools (start here)** |
| **[`docs/steps/FUNCTIONAL_MAIN.md`](docs/steps/FUNCTIONAL_MAIN.md)** | **Main process — functional** |
| **[`docs/FUNCTIONAL_GUIDE.md`](docs/FUNCTIONAL_GUIDE.md)** | Functional steps + commands |
| **[`docs/SCENARIOS_FUNCTIONAL.md`](docs/SCENARIOS_FUNCTIONAL.md)** | F1–F8 situations |
| **[`docs/AI_ASSIST.md`](docs/AI_ASSIST.md)** | AI co-pilot (prompts / data / checks) |
| [`docs/steps/MAIN.md`](docs/steps/MAIN.md) | Upstream structural spine (S1–S14) |
| [`docs/TOOLS.md`](docs/TOOLS.md) | Tools (functional section first) |
| [`docs/RELATED_SOFTWARE.md`](docs/RELATED_SOFTWARE.md) | Related tools (further reading) |
| [`docs/CITATIONS.md`](docs/CITATIONS.md) | Papers / software to cite |

## Main flowchart (functional)

```mermaid
flowchart TD
  inn([Input: curated GFF + proteins.faa]) --> F0[F0 Protein QC BUSCO / OMArk]
  F0 --> pick{Functional branch}

  pick -->|F1 full| F1[eggNOG-mapper + InterProScan + DIAMOND]
  pick -->|F2 fast| F2[eggNOG-mapper only]
  pick -->|F3 EnTAP| F3[EnTAP frame]
  pick -->|F4 names| F4[AHRD / eifunannot descriptions]
  pick -->|F5 transcript| F5[Trinotate if CDS from RNA]
  pick -->|F6 plant paths| F6[Mercator / MapMan optional]
  pick -->|F7 ortho| F7[OrthoFinder panel summarize]

  F1 --> merge[F_merge: tables + GFF attributes]
  F2 --> merge
  F3 --> merge
  F4 --> merge
  F5 --> merge
  F6 --> merge
  F7 --> merge

  merge --> special{NLR / family?}
  special -->|yes F8| F8[HRP / domain filter + priority]
  special -->|no| out
  F8 --> out[Release: TSV + annotated GFF + METHODS]

  inn -.->|no GFF yet| struct[Upstream structural S1–S14]
  struct -.-> inn
```

## Start here (copy-paste)

1. [`docs/INSTALL_FUNCTIONAL.md`](docs/INSTALL_FUNCTIONAL.md)
2. [`docs/SCENARIOS_FUNCTIONAL.md`](docs/SCENARIOS_FUNCTIONAL.md) **F1**
3. `bash pipeline/F_release.sh`
4. Why this stack: [`docs/RECENT_HIGH_QUALITY.md`](docs/RECENT_HIGH_QUALITY.md)

## Default line

`proteins.faa` (+ optional GFF) → **F1** (emapper + InterProScan + SwissProt DIAMOND) → merge → release under `work/function/`.

```bash
cp config/example.env config/local.env   # set PROTEINS_FA, optional DRAFT_GFF/CURATED_GFF
set -a && source config/local.env && set +a
# docs/SCENARIOS_FUNCTIONAL.md F1
```

## This is not

- Not primarily a gene-finder package — use upstream S1–S14 or bring your own GFF  
- Not TE-only — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)  
- Not graphs — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)

No private FASTQ/BAM in git.

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
