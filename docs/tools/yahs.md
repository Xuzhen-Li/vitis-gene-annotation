# YaHS — Hi-C scaffolding

**Role:** Asm0 — turn contigs into chromosome-scale scaffolds.

## Get it
- https://github.com/c-zhou/yahs  
- Needs Hi-C reads aligned to contigs (e.g. `chromap` / `bwa mem`) as BAM.

## Minimal pattern
```bash
# 1) Align Hi-C to contigs → hic.bam (follow YaHS README for filters)
# 2) Scaffold
yahs contigs.fa hic.bam -o "$WORK_DIR/asm/yahs"
# 3) Manual review (Juicebox) strongly recommended for grape “19 chr” claims
```

## Outputs
Scaffold FASTA + AGP; after review → set `GENOME_FA`.

## Pitfalls
- Skipping contact-map review → wrong joins into gene models.  
- Using unfiltered Hi-C BAM (follow YaHS / Arima recipes).
