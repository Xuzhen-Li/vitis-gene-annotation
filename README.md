# vitis-gene-annotation

Full *Vitis* gene-structure annotation: soft-mask → dual/triple draft → merge → QC → GSAman → release.

**Start:** [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) · peers: [`docs/PEER_PIPELINES.md`](docs/PEER_PIPELINES.md)

## This is not

- Not TE library construction alone — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)
- Not graphs / PAV — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)
- Not synteny — [vitis-synteny](https://github.com/Xuzhen-Li/vitis-synteny)

No unpublished genotypes or private BAM/FASTQ in git.

## Stages

| Stage | Path |
|-------|------|
| Full map | [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) |
| A0 / A0b | Soft-mask · ProtExcluder |
| A1 / A1b | Engine · RNA align |
| A2 / A2b / A2c / A2d | Draft · second set · [Liftoff](pipeline/A2c_liftoff.md) · [EGAPx optional](pipeline/A2d_egapx_optional.md) |
| A4 Merge | `pipeline/A4_merge_sets.sh` |
| A5 / A5b / A5c | AGAT · [OMArk/Compleasm](pipeline/A5b_omark_compleasm.sh) · [expression filter](pipeline/A5c_expression_pfam_filter.md) |
| A3 Proteins | `pipeline/A3_proteins_from_gff.sh` |
| 01–06 Last mile | QC → GSAman → SynGAP → release |
| A6 Function | eggNOG optional |

Default: **BRAKER3 + GeMoMa/Liftoff (PN40024) → EVM → AGAT → BUSCO/PSAURON → GSAman (NLR-first)**.

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
