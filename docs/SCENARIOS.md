# Situation handbook

Each scenario: **when**, **inputs**, **engine mix**, **merge**, **curation depth**, **watch-outs**.
Stage IDs match [`PLAYBOOK.md`](PLAYBOOK.md).

---

## S1 — RNA + proteins (default)

**When:** Illumina RNA maps well; OrthoDB eudicots/Viridiplantae available.

| Step | Choice |
|------|--------|
| Draft A | BRAKER3 + `RNA_BAM` + OrthoDB |
| Draft B | GeMoMa **or** Liftoff from PN40024 |
| Merge | `MERGE_MODE=evm` (BRAKER+GeMoMa) or `tsebra` if both BRAKER-family |
| Curation | Priority list; NLR/stilbene boosted |

**Fail → switch:** If BRAKER gene count ≫ relative × ploidy → S10. If RNA almost unused → check BAM, else S6.

---

## S2 — Proteins only

**When:** No usable RNA; close annotated grape / Vitaceae proteomes exist.

| Step | Choice |
|------|--------|
| Draft A | **GALBA** (close proteins) **or** GeMoMa |
| Draft B | Liftoff from PN40024 |
| Merge | Prefer GeMoMa/Liftoff as backbone; GALBA fills gaps — or EVM with homology weights |
| Curation | Heavier GSAman; splice sites under-supported |

**Avoid:** Distant OrthoDB-only BRAKER as sole set on a large heterozygous grape genome without RNA.

---

## S3 — Deep Iso-seq

**When:** High-quality FLNC / Iso-seq covers most loci.

| Step | Choice |
|------|--------|
| Draft A | **EviAnn** (or PASA-style evidence build) |
| Draft B | BRAKER3 (species-specific orphans) |
| Merge | `MERGE_MODE=evi_backbone` |
| Curation | Fix EviAnn/BRAKER conflicts; UTR-rich models OK |

**Watch:** Haplotype-resolved assemblies — map FLNC per haplotype when possible.

---

## S4 — Haplotype / cultivar panel

**When:** Several phased haplotypes or cultivars to annotate consistently.

1. Run **S1 or S3** on the **best** haplotype (reference).  
2. Deep GSAman on that reference (at least priority families).  
3. **Liftoff / GeMoMa** to other haplotypes.  
4. **SynGAP** (stage 05) to flag splits/merges.  
5. Second GSAman pass only on SynGAP conflict loci.  

**Output:** One curated “primary” GFF + transferred GFFs with provenance tags.

---

## S5 — T2T / publication-grade

**When:** Claiming gap-free / reference annotation for a paper.

Extra vs S1:

- Re-run BUSCO + PSAURON + **OMArk/Compleasm** after every major curation round.  
- Expand GSAman beyond priority: all fragmented BUSCOs + tandem arrays genome-wide.  
- Document versions, odb lineage, RNA libraries, merge weights in `METHODS.md`.  
- Optional parallel **EGAPx** (S8) for external comparison table — not silent overwrite.

---

## S6 — Thin evidence

**When:** Sparse RNA and only distant proteins.

| Step | Choice |
|------|--------|
| Draft A | Liftoff/GeMoMa from closest grape |
| Draft B | BRAKER3 protein-only (OrthoDB) as weak secondary |
| Merge | Homology backbone; keep BRAKER orphans for GSAman review |
| Curation | Assume high error rate; do **not** publish without family-level checks |

**Label** release `provisional` until Iso-seq arrives.

---

## S7 — Family / QTL first

**When:** Paper needs correct gene models in NLR, stilbene, flowering, disease QTL — not a perfect genome-wide set.

1. Still run genome-wide **S1 draft + QC** (cheap relative to hand work).  
2. Build `families.tsv` for `02_priority_loci.py --families`.  
3. GSAman **only** those windows (+ flanking tandem genes).  
4. Release two tracks: `genome_auto.gff3` + `curated_windows.gff3` (or merged with tags).

---

## S8 — NCBI-style parallel (EGAPx)

**When:** Rosids/eudicot taxid OK; want Gnomon-style set or GenBank prep.

- Run EGAPx (`A2d`) **beside** S1 — do not replace lab default blindly.  
- Compare gene counts, BUSCO, and spot-check NLR clusters in GSAman.  
- Beenome-style rule: prefer conspecific RNA with enough mapped reads.

---

## S9 — Polyploid / high BUSCO-D

**When:** BUSCO duplicated fraction is high.

1. Check ploidy / haplotype retention **before** purging “haplotigs.”  
2. Prefer annotating **each haplotype** (S4) over forcing a collapsed primary.  
3. Report BUSCO-C and BUSCO-D separately; high-D can be biological.

---

## S10 — TE ORF inflation

**When:** Gene count 10–40k above near relative; short protein spike ~100 aa; many mono-exon TE-like models.

1. Rebuild TE lib + **ProtExcluder** (A0b); soft-mask again.  
2. Re-run draft.  
3. Optional **A5c** filter: drop only models lacking RNA **and** Pfam **and** homolog.  
4. Never FPKM-kill NLR candidates.

---

## S11 — Quick homologous lift only

**When:** Need gene IDs for synteny / popgen scaffolding, not a reference annotation.

- Liftoff (`A2c`) from PN40024 → AGAT counts → stop.  
- Tag GFF `source=Liftoff;status=provisional`.  
- Escalate to S1 when functional claims appear.

---

## S12 — Stop rules

Stop iterating when:

| Criterion | Action |
|-----------|--------|
| Priority list empty under agreed PSAURON threshold | Release candidate |
| BUSCO-C plateaus across two curation rounds | Stop genome-wide edits |
| Only TE-like residuals remain | Document; do not chase |
| New RNA arrives | Re-open S3 for affected chromosomes only |

Do **not** keep merging more ab initio sets hoping for magic — add evidence or curate.

---

## Cross-links

- Error classes while curating: [`ERROR_CLASSES.md`](ERROR_CLASSES.md)  
- Peer tools: [`PEER_PIPELINES.md`](PEER_PIPELINES.md)  
- GSAman how-to: [`../pipeline/04_gsaman_curation.md`](../pipeline/04_gsaman_curation.md)
