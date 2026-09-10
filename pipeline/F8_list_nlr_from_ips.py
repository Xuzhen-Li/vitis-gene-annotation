#!/usr/bin/env python3
"""List NLR-like proteins from InterProScan TSV via domain keyword/accession heuristics."""
from __future__ import annotations
import argparse, csv, re
from collections import defaultdict

NLR_PAT = re.compile(
    r"NB-ARC|NBS-LRR|Toll-interleukin|TIR\b|RPW8|CC-NBS|LRR.*disease|disease resistance",
    re.I,
)
# common InterPro / Pfam accessions related to NLRs (non-exhaustive)
NLR_ACC = re.compile(r"PF00931|PF01582|PF00560|PF13516|IPR002182|IPR000157|IPR001611")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ips", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()
    hits = defaultdict(set)
    with open(args.ips) as f:
        for line in f:
            if not line.strip() or line.startswith("#"):
                continue
            c = line.rstrip("\n").split("\t")
            if len(c) < 6:
                continue
            pid, sigacc, sigdesc = c[0], c[4], c[5]
            blob = " ".join([sigacc, sigdesc] + c[11:14] if len(c) > 14 else [sigacc, sigdesc])
            if NLR_PAT.search(blob) or NLR_ACC.search(blob):
                hits[pid].add(sigacc)
    with open(args.out, "w", newline="") as fo:
        w = csv.writer(fo, delimiter="\t")
        w.writerow(["gene_id", "nlr_signatures"])
        for gid in sorted(hits):
            w.writerow([gid, ";".join(sorted(hits[gid]))])
    print(f"[OK] {len(hits)} NLR-like proteins → {args.out}")

if __name__ == "__main__":
    main()
