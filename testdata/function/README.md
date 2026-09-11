# Toy functional inputs (no databases required)

Files are tiny fakes for testing `pipeline/F_merge_tables.py` and join helpers.

```bash
python3 pipeline/F_merge_tables.py \
  --proteins testdata/function/toy.faa \
  --emapper testdata/function/toy.emapper.annotations \
  --ips testdata/function/toy.ips.tsv \
  --diamond testdata/function/toy.diamond.tsv \
  --out /tmp/vga_toy_master.tsv
```

Not for biological conclusions.
