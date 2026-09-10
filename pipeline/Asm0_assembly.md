# Asm0 — Genome assembly (before annotation)

This grain does **not** replace a dedicated assembly repo. Use these as the
gate into annotation. Typical *Vitis* diploid / haplotype path:

| Goal | Tools (examples) | Output |
|------|------------------|--------|
| Contigs | hifiasm (HiFi ± ONT) | primary / hap1 / hap2 |
| Scaffold | Hi-C (YaHS / salsa) | chromosome-scale |
| Purge | purge_dups / purge_haplotigs | reduced false duplications |
| Polish | optional NextPolish / Medaka | fewer small errors |

## Hand-off files for annotation

- `GENOME_FA` — chromosome-scale FASTA (one haplotype or collapsed primary)
- Optional: `hap1.fa` / `hap2.fa` for panel annotation (scenario S4)
- Assembly report: N50, gaps, BUSCO *genome* mode (not proteins yet)

## Do not annotate yet if

- Contig N50 still tiny / not chromosome-scale for your claim
- You have not decided primary vs dual-haplotype annotation (see S9)
- TE lib / soft-mask not planned (A0)

Next: [`Asm1_assembly_qc.md`](Asm1_assembly_qc.md) → [`A0_softmask.md`](A0_softmask.md).
