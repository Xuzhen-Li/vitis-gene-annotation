# vitis-gene-annotation

Full *Vitis* gene-structure annotation path: **soft-mask → draft → QC → priority curation → release**.

Master map: **[`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md)** (start here).

Draft engines (BRAKER3 / GALBA / GeMoMa / EviAnn) are chosen with notes from
[plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation).
This repo owns the **wired full playbook** plus last-mile QC / GSAman / SynGAP.

## This is not

- Not TE library construction — [vitis-te](https://github.com/Xuzhen-Li/vitis-te) (A0 consumes its softmask)
- Not pangenome graphs — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)
- Not synteny / SyRI — [vitis-synteny](https://github.com/Xuzhen-Li/vitis-synteny)

No unpublished genotypes, private BAM/Iso-seq dumps, or sample-level matrices.

## Stages (short)

| ID | Script / doc |
|----|----------------|
| Full map | [`docs/FULL_PIPELINE.md`](docs/FULL_PIPELINE.md) |
| A0 Soft-mask | [`pipeline/A0_softmask.md`](pipeline/A0_softmask.md) |
| A1 Choose engine | [`pipeline/A1_choose_engine.md`](pipeline/A1_choose_engine.md) |
| A2 Draft | [`pipeline/A2_run_draft.sh`](pipeline/A2_run_draft.sh) |
| A3 Proteins | [`pipeline/A3_proteins_from_gff.sh`](pipeline/A3_proteins_from_gff.sh) |
| 01 QC | [`pipeline/01_qc_busco_psauron.sh`](pipeline/01_qc_busco_psauron.sh) |
| 02 Priority | [`pipeline/02_priority_loci.py`](pipeline/02_priority_loci.py) |
| 03–06 | evidence → GSAman → SynGAP → release |

```bash
cp config/example.env config/local.env
set -a && source config/local.env && set +a
bash pipeline/A2_run_draft.sh          # after wiring cluster commands
bash pipeline/A3_proteins_from_gff.sh
bash pipeline/01_qc_busco_psauron.sh
python3 pipeline/02_priority_loci.py -i "$PSAURON_TSV" -o "$PRIORITY_TSV"
```

## See also

- [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) — engine skill / plant traps  
- [vitis-te](https://github.com/Xuzhen-Li/vitis-te) · [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome) · [bioinfo-agent-skills](https://github.com/Xuzhen-Li/bioinfo-agent-skills)

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
