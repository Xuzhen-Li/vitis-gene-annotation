# Recent high-quality annotation workflows (survey)

What recent T2T / reference papers actually run — distilled for *this* repo.  
**Functional stack is the main product here;** structural notes are upstream only.

---

## 1. Cell / Cell Genomics T2T collection (2025–2026)

**What it is:** PacBio-centered special collection of telomere-to-telomere assemblies across animals (human/primates, rat, giraffe, voles, birds, …). Overview: PacBio blog “Complete telomere-to-telomere genome assembly across the tree of life.”  
Issue hub example: [Cell Genomics T2T-related issue](https://www.cell.com/cell-genomics/issue?pii=S2666-979X(25)X0009-4).

**Honest take for annotation:**

| Topic | What the collection emphasizes | Use in our repo |
|-------|--------------------------------|-----------------|
| Assembly finish | Verkko-Fillet, TTT gap models | Upstream Asm0 only — not FA |
| Gene models on T2T animals | Often **CAT + Liftoff** (CHM13-style) or lab-specific BRAKER/Liftoff | Upstream S11/S4/S1 |
| Functional tables | Usually standard IPS / emapper / UniProt — not reinvented | **Our F1** |

**Human T2T-CHM13 gene track practice (UCSC):** Comparative Annotation Toolkit (CAT) on Cactus alignments + Iso-Seq, then **Liftoff** fills missed genes/paralogs. Tool: [LiftOn](https://github.com/Kuanhao-Chao/LiftOn) (Liftoff DNA + miniprot protein maximization) for T2T lift quality.

**Bottom line:** The Cell T2T专刊 is **assembly-first**. For *Vitis* functional annotation, copy the **proteome FA recipes from recent plant T2T data papers** below, not the Verkko papers.

Related closed-loop structural last-mile (Cell Press family): Chen et al. 2026 *The Innovation* — GSAman (already in upstream S5/GSAman docs).

---

## 2. Plant T2T data paper — Camellia nitidissima (*Scientific Data* 2025)

**Structural:** EarlGrey TE → soft-mask → **BRAKER3** (HISAT2 BAM + OrthoDB) + TSEBRA.  

**Functional (copy this as high-quality default):**

1. **InterProScan**  
2. **eggNOG-mapper**  
3. **PANNZER2**  
4. **Mercator4**  

This matches our **F1 + F4-like + F6**, with PANNZER2 added as `F1c` / [`tools/pannzer2.md`](tools/pannzer2.md).

---

## 3. GeneForge (Nextflow) — dual structure + FA suite

https://github.com/SequAna-Ukon/GeneForge  

- Structure: BRAKER3 ∥ FunAnnotate → BUSCO winner backbone  
- Function on consensus: **InterProScan + eggNOG-mapper + Phobius + SignalP**  

Adopted here as optional **F1 extras** (secreted/TM): [`tools/phobius_signalp.md`](tools/phobius_signalp.md).

---

## 4. T2T-Hub (ZJU/NJU)

https://doi.org/10.1093/nar/gkag423 · https://bis.zju.edu.cn/t2thub  

Uploads genome+GFF → unified QC, TF, **functional annotation**, browser. Good as an external check of your release package — not a replacement for local F1 reproducibility.

---

## 5. Other stacks worth knowing

| Source | Stack | Role |
|--------|--------|------|
| JSBBS plant T2T review 2025 | BRAKER3 / MAKER2 / Helixer cited | Upstream |
| zgtools (linyuiz) | Commercial-style full T2T+Repeat+ncRNA+Denovo+Func | Peer awareness only |
| CantuLab AnnotationPipeline2 | PASA→EVM structural | Upstream S14 |
| RAGNAROK / nf-annotate | Helixer/Mikado; Liftoff+EVM+HRP | Upstream / F8 NLR |

---

## 6. What we standardize as “high-quality FA” for *Vitis*

**Minimum paper-grade (F1):**

```text
proteins (1/gene)
  → DIAMOND SwissProt
  → eggNOG-mapper
  → InterProScan
  → merge → functional_master.tsv
```

**T2T-plant-grade add-ons (Camellia-like):**

```text
  → PANNZER2 descriptions
  → Mercator4 MapMan BINs
  → optional Phobius/SignalP
```

All runnable paths: [`INSTALL_FUNCTIONAL.md`](INSTALL_FUNCTIONAL.md) · [`FUNCTIONAL_GUIDE.md`](FUNCTIONAL_GUIDE.md) · [`SCENARIOS_FUNCTIONAL.md`](SCENARIOS_FUNCTIONAL.md).
