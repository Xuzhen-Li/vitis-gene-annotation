# nf-annotate (nschan) — plant Nextflow: Liftoff → EVM + NLR

- Repo: https://github.com/nschan/nf-annotate  
- Zenodo: https://doi.org/10.5281/zenodo.12759772  
- Paired with [nf-core/genomeassembler](https://github.com/nf-core/genomeassembler)

**Stack:** subset contigs → optional **HRP** (NB-LRR) → SNAP + Augustus + miniprot → bambu/Trinity transcripts → **PASA** → **EVM** (Liftoff-weighted) → InterPro NLR tag → optional PASA UTR rounds → HiTE TE / TRASH satellites.

**EVM weights** (`assets/weights.tsv`):

```text
ABINITIO_PREDICTION	AUGUSTUS	3
ABINITIO_PREDICTION	SNAP	1
ABINITIO_PREDICTION	LIFTOFF	5
PROTEIN	MINIPROT	3
TRANSCRIPT	PASA	10
OTHER_PREDICTION	transdecoder	5
```

Copied here as [`../../config/evm_weights_nf_annotate.txt`](../../config/evm_weights_nf_annotate.txt).

**Ideas for *Vitis***

- Liftoff-first + EVM is a strong **S6/S11→qualified** upgrade path.  
- **HRP / R-gene** module → boost **S7** NLR windows ([`../tools/hrp.md`](../tools/hrp.md)).  
- Long cDNA (ONT/Iso-seq) preferred over short reads — matches our S3 advice.  
- Multiple PASA update iterations for UTRs after EVM.
