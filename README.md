# vitis-gene-annotation

*Vitis* gene-structure annotation: **complete playbook** + **situation handbook**.

| Start here | |
|------------|--|
| **[`docs/PLAYBOOK.md`](docs/PLAYBOOK.md)** | Full default flow + scenario picker |
| **[`docs/SCENARIOS.md`](docs/SCENARIOS.md)** | S1–S12 recipes for different evidence / goals |

Also: [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) · [`docs/PEER_PIPELINES.md`](docs/PEER_PIPELINES.md) · [`docs/ERROR_CLASSES.md`](docs/ERROR_CLASSES.md)

## This is not

- Not TE library construction alone — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)
- Not graphs / PAV — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)
- Not synteny — [vitis-synteny](https://github.com/Xuzhen-Li/vitis-synteny)
- Draft engine traps — [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation)

No unpublished genotypes or private BAM/FASTQ in git.

## Default in one line

Soft-mask → RNA → **BRAKER3 + GeMoMa/Liftoff (PN40024) → EVM** → AGAT → BUSCO/PSAURON → **GSAman on priority (NLR/stilbene first)** → release.

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
# follow docs/PLAYBOOK.md §1 after wiring A2/A4 on your cluster
```

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
