# Tools — how to install and run each piece

Workflow order lives in [`DETAILED_GUIDE.md`](DETAILED_GUIDE.md).  
This page is **tool literacy**: what each program is for, how to get it, a minimal working command, outputs, and common failures.

Prefer **containers** (Docker / Singularity / Apptainer) over compiling by hand. Paths below are templates — put your image tags and module names in `config/local.env`.

## Map: stage → tool pages

| Stage | Tools |
|-------|--------|
| Assembly | [`tools/hifiasm.md`](tools/hifiasm.md), [`tools/yahs.md`](tools/yahs.md) |
| Soft-mask | [`tools/repeatmasker.md`](tools/repeatmasker.md), [`tools/protexcluder.md`](tools/protexcluder.md) |
| RNA / Iso-seq | [`tools/hisat2_star.md`](tools/hisat2_star.md), [`tools/minimap2.md`](tools/minimap2.md) |
| Draft genes | [`tools/braker3.md`](tools/braker3.md), [`tools/galba.md`](tools/galba.md), [`tools/gemoma.md`](tools/gemoma.md), [`tools/eviann.md`](tools/eviann.md), [`tools/liftoff.md`](tools/liftoff.md) |
| Merge | [`tools/evm.md`](tools/evm.md), [`tools/tsebra.md`](tools/tsebra.md) |
| GFF / proteins | [`tools/agat_gffread.md`](tools/agat_gffread.md) |
| QC | [`tools/busco.md`](tools/busco.md), [`tools/psauron.md`](tools/psauron.md), [`tools/omark_compleasm.md`](tools/omark_compleasm.md) |
| Curation | [`tools/gsaman.md`](tools/gsaman.md), [`tools/syngap.md`](tools/syngap.md) |
| Optional NCBI | [`tools/egapx.md`](tools/egapx.md) |

## Shared habits

1. **Soft-masked genome** for BRAKER / GALBA (`-xsmall` / lowercase), not hard `N` mask.  
2. **One working directory per tool** under `$WORK_DIR/...` so logs are recoverable.  
3. **Record versions** in METHODS (`braker.pl --version`, `busco -v`, …).  
4. After every structural step: `bash pipeline/A5_agat_stats.sh that.gff3`.  
5. If a script prints `[STOP]`, it printed the command for *you* to run in your container — that is expected until you wire the image.

## Suggested install order (first machine)

1. `samtools`, `seqkit`, `gffread`, `agat`  
2. `busco` (+ download `viridiplantae_odb12` once)  
3. Aligners: `hisat2` or `STAR`, `minimap2`  
4. `RepeatMasker` + curated TE lib  
5. `BRAKER3` singularity image (largest download)  
6. `Liftoff`, then EVM / GeMoMa / PSAURON / GSAman as needed  

Protein DB: OrthoDB Viridiplantae / eudicots for BRAKER; PN40024 FA+GFF for Liftoff/GeMoMa.
