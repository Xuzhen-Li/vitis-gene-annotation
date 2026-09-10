# vitis-gene-annotation

Full *Vitis* gene-structure annotation: soft-mask → dual draft → merge → QC → GSAman → release.

**Start here:** [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) · peers: [`docs/PEER_PIPELINES.md`](docs/PEER_PIPELINES.md)

## This is not

- Not TE library construction alone — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)
- Not graphs / PAV — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)
- Not synteny — [vitis-synteny](https://github.com/Xuzhen-Li/vitis-synteny)

No unpublished genotypes or private BAM/FASTQ in git.

## Stages

| Stage | Path |
|-------|------|
| Full map | [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) |
| A0 Soft-mask | `pipeline/A0_softmask.md` |
| A0b ProtExcluder | `pipeline/A0b_protexcluder.md` |
| A1 / A1b Engine + RNA | `A1_choose_engine.md` · `A1b_rna_align.md` |
| A2 / A2b Dual draft | `A2_run_draft.sh` · `A2b_second_predictor.md` |
| A4 Merge | `A4_merge_sets.sh` (`tsebra` \| `evm` \| `evi_backbone`) |
| A5 AGAT | `A5_agat_stats.sh` |
| A3 Proteins | `A3_proteins_from_gff.sh` |
| 01–06 Last mile | QC → priority → GSAman → SynGAP → release |
| A6 Function | `A6_functional_optional.md` |

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
# … A0–A2b on cluster, then:
bash pipeline/A4_merge_sets.sh
bash pipeline/A5_agat_stats.sh "$MERGED_GFF"
export DRAFT_GFF="$MERGED_GFF"
bash pipeline/A3_proteins_from_gff.sh
bash pipeline/01_qc_busco_psauron.sh
python3 pipeline/02_priority_loci.py -i "$PSAURON_TSV" -o "$PRIORITY_TSV"
```

Default *Vitis* combo: **BRAKER3 + GeMoMa (PN40024) → EVM**, then GSAman on NLR/stilbene windows.

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
