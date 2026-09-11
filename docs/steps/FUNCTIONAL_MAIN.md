# Main process — functional annotation

**Goal:** attach function to a stable gene set.  
**Input:** representative `PROTEINS_FA` (+ optional `CURATED_GFF`).  
**Output:** TSVs (GO, KEGG, domains, descriptions, optional MapMan) under `$WORK_DIR/function/`, plus a release folder + METHODS.

```text
curated proteins (+ GFF)
  → F0 protein QC (BUSCO proteins)
  → F1 default (DIAMOND + eggNOG-mapper + InterProScan)
       or F2 / F3 / F5 alternate frames
  → optional F4 AHRD · F6 Mercator4 · F8 NLR · F9 iTAK
  → merge tables → F_release.sh
```

No proteins yet? Upstream structural spine: [`MAIN.md`](MAIN.md) (S1–S14), then return here.

## Default order (paper)

1. [`../INSTALL_FUNCTIONAL.md`](../INSTALL_FUNCTIONAL.md)  
2. [`../SCENARIOS_FUNCTIONAL.md`](../SCENARIOS_FUNCTIONAL.md) **F1**  
3. **F4** + **F6** for HR/MP-style METHODS  
4. `bash pipeline/F_release.sh`  
5. Fill [`../METHODS_FUNCTIONAL.md`](../METHODS_FUNCTIONAL.md)

## Branch table

| ID | When | Core tools | In-repo runner |
|----|------|------------|----------------|
| **F0** | Always | BUSCO proteins | inline in scenarios |
| **F1** | Default / paper | DIAMOND + emapper + InterProScan | `F1_diamond.sh` `F2_eggnog.sh` `F3_interproscan.sh` |
| **F2** | Fast | emapper (± Kofam) | `F2_eggnog.sh` `F1b_kofam.sh` |
| **F3** | EnTAP frame | EnTAP | docs + copy TSV |
| **F4** | Readable names | AHRD | `F4_join_ahrd.py` · `F4_run_ahrd.md` |
| **F5** | Transcriptome CDS | Trinotate (± F1) | docs/tools/trinotate.md |
| **F6** | Plant BINs | Mercator4 | `F6_ingest_mercator.py` |
| **F7** | Multi-genome | OrthoFinder → F1 on reps | `F7_orthofinder.sh` |
| **F8** | NLR | IPS filter ± HRP | `F8_run.sh` `F8_list_nlr_from_ips.py` |
| **F9** | TF / kinase | iTAK | `F9_itak.sh` |

Commands: [`../FUNCTIONAL_GUIDE.md`](../FUNCTIONAL_GUIDE.md).  
Standards: [`../RECENT_HIGH_QUALITY.md`](../RECENT_HIGH_QUALITY.md).  
Citations: [`../CITATIONS.md`](../CITATIONS.md).
