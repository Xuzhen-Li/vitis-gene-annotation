# A1b — RNA-seq alignment (optional but recommended)

Krabbenhoft step 4 / Sylvan dual path:

| Aligner | When |
|---------|------|
| **HISAT2** | Illumina RNA-seq; simple BRAKER BAM input |
| **STAR** | High-depth Illumina; Sylvan default pathway |
| Iso-seq / PacBio FLNC | Map with minimap2; feed EviAnn / PASA / GSAman |

Rules:

- Prefer species-matched RNA; tissue diversity helps UTRs and rare isoforms.
- Do not ship private FASTQ into this git repo — only document BAM paths in `config/local.env`.
- For haplotype-resolved assemblies, map FLNC per haplotype when possible (baozg note).

Set `RNA_BAM=` after alignment for BRAKER3 / EVM.
