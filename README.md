# vitis-gene-annotation

*Vitis* **last-mile** gene-structure annotation: QC, priority curation, and release of versioned GFF3.

Automated drafts (BRAKER3 / GALBA / GeMoMa / EviAnn-class tools) live in
[plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation).
This repo starts **after** a draft GFF exists.

## This is not

- Not the auto-annotation engine — [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation)
- Not TE library curation — [vitis-te](https://github.com/Xuzhen-Li/vitis-te)
- Not pangenome graphs / PAV — [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome)
- Not synteny / SyRI — [vitis-synteny](https://github.com/Xuzhen-Li/vitis-synteny)

No unpublished genotypes, private BAM/Iso-seq dumps, or sample-level matrices.

## Why a separate grain

Assemblies are often “good enough”; gene models are not.
Plant annotations commonly fail in four ways (Chen et al. 2026, GSAman):

1. Gene-model fragmentation  
2. Adjacent-gene fusion  
3. Exon loss / splice-site error  
4. Tandem-duplicate collapse  

Grape gene families (NLRs, stilbene synthases, etc.) and haplotype / dosage work are especially sensitive to (4) and (1)–(2).

## Playbook (last mile)

| Step | Doc / script |
|------|----------------|
| Overview | [`pipeline/00_overview.md`](pipeline/00_overview.md) |
| QC — BUSCO + PSAURON | [`pipeline/01_qc_busco_psauron.sh`](pipeline/01_qc_busco_psauron.sh) |
| Priority loci list | [`pipeline/02_priority_loci.py`](pipeline/02_priority_loci.py) |
| Evidence checklist | [`pipeline/03_evidence_checklist.md`](pipeline/03_evidence_checklist.md) |
| Manual curation (GSAman) | [`pipeline/04_gsaman_curation.md`](pipeline/04_gsaman_curation.md) |
| Optional SynGAP polish | [`pipeline/05_syngap_polish.md`](pipeline/05_syngap_polish.md) |
| Release GFF | [`pipeline/06_release_gff.md`](pipeline/06_release_gff.md) |

Config skeleton: [`config/example.env`](config/example.env).  
Credit / peers: [`docs/ATTRIBUTION.md`](docs/ATTRIBUTION.md).  
Error classes: [`docs/ERROR_CLASSES.md`](docs/ERROR_CLASSES.md).

### Quick start (cluster / laptop)

```bash
cp config/example.env config/local.env   # edit; keep private paths out of git
set -a && source config/local.env && set +a
# 0) draft GFF from plant-gene-annotation (not this repo)
bash pipeline/01_qc_busco_psauron.sh
python3 pipeline/02_priority_loci.py -i "$PSAURON_TSV" -o work/priority.tsv
# then curate priority loci in GSAman; optionally SynGAP; then 06_release
```

## See also

- [plant-gene-annotation](https://github.com/Xuzhen-Li/plant-gene-annotation) — draft engines  
- [vitis-pangenome](https://github.com/Xuzhen-Li/vitis-pangenome) — graphs after gene models exist  
- [vitis-te](https://github.com/Xuzhen-Li/vitis-te) — softmask / TE libraries  
- [bioinfo-agent-skills](https://github.com/Xuzhen-Li/bioinfo-agent-skills) — index  

**Author:** Xuzhen Li · [ORCID](https://orcid.org/0000-0003-3670-6657)
