# PlantGenotationFlow — assembly-to-GFF Snakemake

- Repo: https://github.com/nauvalrajwaa/PlantGenotationFlow  

**Stack:** long-read QC → Flye/hifiasm → polish → decontam → QUAST/BUSCO → EDTA/Tetools → Liftoff and/or GALBA → report.

**Ideas used here:** reinforce Asm0→Asm1→mask→Liftoff/GALBA as a thin-evidence path (**S6/S11/S2**); decontamination before annotation.
