# Toy files — test merge without downloading databases

```bash
python3 pipeline/F_merge_tables.py \
  --proteins testdata/function/toy.faa \
  --emapper testdata/function/toy.emapper.annotations \
  --ips testdata/function/toy.ips.tsv \
  --diamond testdata/function/toy.diamond.tsv \
  --out /tmp/toy_master.tsv
python3 pipeline/F8_list_nlr_from_ips.py --ips testdata/function/toy.ips.tsv --out /tmp/toy_nlr.tsv
```
