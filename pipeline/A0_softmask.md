# A0 — Soft-mask repeats

Home for TE libraries: [vitis-te](https://github.com/Xuzhen-Li/vitis-te).

## Rules

1. **Soft-mask** (`a`/`t`/`g`/`c`), never hard-mask (`N`), before gene prediction.
2. Build / curate the RepeatMasker library so **NLR / R-gene proteins are not inside it**.
3. Keep the soft-masked FASTA path as `GENOME_SOFT` in `config/local.env`.
4. Record EDTA / RepeatMasker versions in your run log.

If `vitis-te` has no release yet, use a species-near TE lib cautiously and flag the run as provisional.
