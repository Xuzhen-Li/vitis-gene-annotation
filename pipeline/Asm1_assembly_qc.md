# Asm1 — Assembly QC gate

Run before soft-mask / gene prediction.

```bash
# Genome BUSCO (assembly completeness — different from protein BUSCO later)
busco -i "$GENOME_FA" -l viridiplantae_odb12 -o asm_busco -m genome -c "$THREADS"

# Contiguity
seqkit stats -a "$GENOME_FA"
# Optional: merqury (k-mer QV), LAI (LTR), compleasm genome mode
```

## Pass / fail (lab defaults — adjust in METHODS)

| Check | Prefer | If fail |
|-------|--------|---------|
| Genome BUSCO-C | high for your clade | fix assembly / gaps before annotating |
| Chr-scale scaffolds | 19 pseudo-molecules for *V. vinifera*-like | keep annotating only if you accept contig GFF |
| Extreme BUSCO-D | explain ploidy/haps | S9 — annotate haplotypes separately |
| TE not soft-masked | — | A0 before BRAKER |

Gate output: set `ASSEMBLY_OK=yes` in `config/local.env` when you proceed.
