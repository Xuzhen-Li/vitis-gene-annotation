# HRP — homology-based full-length NB-LRR (R-gene) prediction

**Role:** **S7** NLR-first; used inside [nf-annotate](https://github.com/nschan/nf-annotate).

## Get it
https://github.com/AndolfoG/HRP  

## Idea
Domain/InterPro + MEME/MAST + miniprot expansion to find full-length NLRs; merge with structural GFF.

## In this playbook
1. After draft GFF, run HRP (or nf-annotate `--r_genes`).  
2. Feed gene IDs into `families.tsv` for `02_priority_loci.py`.  
3. GSAman those windows (± tandems); never FPKM-kill NLRs (**S10**).
