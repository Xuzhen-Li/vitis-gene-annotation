# Blast2GO-style path (no OmicsBox license required)

Commercial Blast2GO/OmicsBox is optional. In this repo the equivalent open path is:

1. DIAMOND/BLAST vs SwissProt/NR (`F1_diamond.sh`)  
2. InterProScan (`F3_interproscan.sh`)  
3. AHRD or eggNOG for GO/descriptions (`F4` / emapper)  
4. Merge (`F_merge_tables.py`)

If you already own OmicsBox, export its annotation table into `function/merge/` and join by gene id the same way as AHRD.
