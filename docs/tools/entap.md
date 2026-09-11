# EnTAP

**Role:** F3 alternate functional frame (similarity + ontology packaging).

**Software:** [PlantGenomicsLab/EnTAP](https://gitlab.com/PlantGenomicsLab/EnTAP) (see also historical GitHub mirrors)

## In this playbook

1. Install + configure EnTAP databases once (DIAMOND DBs, EggNOG/SQLite per EnTAP docs).  
2. Run on `$PROTEINS_FA` with `--threads "$THREADS"`.  
3. Copy final TSVs to `$FUNCTION_DIR/entap/`.  
4. Fill METHODS versions; optional release folder (scenario **F3**).

Default paper path remains **F1** (emapper + InterProScan + DIAMOND). Use F3 when your lab standardizes on EnTAP.
