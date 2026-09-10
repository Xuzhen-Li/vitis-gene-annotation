#!/usr/bin/env python3
"""Ingest Mercator4 result table into master TSV (MapMan BINs)."""
from __future__ import annotations
import argparse, csv
from pathlib import Path
from collections import defaultdict

def find_result(dirpath: Path) -> Path:
    cands = list(dirpath.rglob("*.results")) + list(dirpath.rglob("*mapping*")) + list(dirpath.rglob("*.tsv"))
    cands = [p for p in cands if p.is_file()]
    if not cands:
        raise SystemExit(f"No Mercator result-like file under {dirpath}")
    # prefer *.results
    for p in cands:
        if p.suffix == ".results" or "result" in p.name.lower():
            return p
    return cands[0]

def parse_mercator(path: Path) -> dict[str, str]:
    """Return gene_id -> bin codes (semicolon)."""
    bins = defaultdict(set)
    with open(path, errors="replace") as f:
        header = None
        for line in f:
            if not line.strip() or line.startswith("#"):
                continue
            parts = line.rstrip("\n").split("\t")
            if header is None:
                # Mercator often: BINCODE NAME IDENTIFIER DESCRIPTION TYPE
                if "BINCODE" in line.upper() or "IDENTIFIER" in line.upper():
                    header = [x.strip().upper() for x in parts]
                    continue
                header = [f"COL{i}" for i in range(len(parts))]
            row = {header[i] if i < len(header) else f"COL{i}": parts[i] if i < len(parts) else "" for i in range(len(parts))}
            # flexible
            bincode = row.get("BINCODE") or row.get("COL0") or parts[0]
            ident = row.get("IDENTIFIER") or row.get("COL2") or (parts[2] if len(parts) > 2 else "")
            if ident:
                bins[ident].add(bincode)
    return {k: ";".join(sorted(v)) for k, v in bins.items()}

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--mercator-dir", required=True)
    ap.add_argument("--master", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()
    res = find_result(Path(args.mercator_dir))
    print(f"[INFO] using {res}")
    mm = parse_mercator(res)
    with open(args.master) as f:
        rows = list(csv.DictReader(f, delimiter="\t"))
        fields = list(rows[0].keys()) if rows else ["gene_id"]
    if "mapman_bin" not in fields:
        fields.append("mapman_bin")
    with open(args.out, "w", newline="") as fo:
        w = csv.DictWriter(fo, fieldnames=fields, delimiter="\t", extrasaction="ignore")
        w.writeheader()
        hit = 0
        for row in rows:
            gid = row.get("gene_id", "")
            val = mm.get(gid, "")
            if val:
                hit += 1
            row["mapman_bin"] = val
            w.writerow(row)
    print(f"[OK] MapMan bins for {hit}/{len(rows)} genes → {args.out}")

if __name__ == "__main__":
    main()
