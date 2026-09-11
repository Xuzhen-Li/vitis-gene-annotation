# Trinotate

**Role:** F5 — transcriptome / TransDecoder peptide annotation reports.

**Software:** [Trinotate/Trinotate](https://github.com/Trinotate/Trinotate)

## In this playbook

1. Translate transcripts (TransDecoder) → set `PROTEINS_FA` to peptides.  
2. Run Trinotate SQLite load + report per upstream docs.  
3. Save `Trinotate_report.tsv` under `$FUNCTION_DIR/trinotate/`.  
4. Still recommended: run **F1** on the same peptides for GO/KEGG/domains, then release both tables.

Scenario: [`../SCENARIOS_FUNCTIONAL.md`](../SCENARIOS_FUNCTIONAL.md) **F5**.
