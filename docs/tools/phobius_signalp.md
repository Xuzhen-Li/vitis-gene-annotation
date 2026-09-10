# Phobius / SignalP — secreted & TM (GeneForge-style)

**Role:** Optional F1 extras after proteins are stable.

```bash
# SignalP 6 / SignalP 5 — follow DTU install; example pattern:
# signalp -fasta "$PROTEINS_FA" -org euk -format short -stdout > "$FUNCTION_DIR/signalp/signalp.tsv"
# Phobius:
# phobius.pl -short "$PROTEINS_FA" > "$FUNCTION_DIR/phobius/phobius.tsv"
```

Join signal peptide / TM flags onto master TSV by gene id in METHODS; useful for grape secreted pathogenesis-related proteins.
