# S14 / 08 — Filter incomplete / short proteins

```bash
bash "${REPO_ROOT}/pipeline/A5e_filter_proteins.sh" \
  "${FILTERING_DIR}/gene_models.gff3" 50
# → gene_models.checked.gff3
```

Logic = CantuLab step 08 (no stop `*` / length &lt; 50 aa).
