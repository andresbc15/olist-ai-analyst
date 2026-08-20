"""Load the Olist CSVs into the raw schema of the DuckDB warehouse.

Run from anywhere — paths resolve against the repo root, not the working
directory, so this cannot silently create a second database the way a relative
path would.
"""

import os
import pathlib

import duckdb

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent
DATA_DIR = REPO_ROOT / "data"
DB_PATH = os.environ.get("OLIST_DB_PATH", str(DATA_DIR / "olist.duckdb"))

con = duckdb.connect(DB_PATH)
con.execute("CREATE SCHEMA IF NOT EXISTS raw")

# Looks for every file in DATA_DIR matching the pattern *.csv
csvs = sorted(DATA_DIR.glob("*.csv"))

if not csvs:
    raise SystemExit(f"No CSVs found in {DATA_DIR} — did you drop them in data/?")

# Local load the csvs
for csv in csvs:
    table = csv.stem.replace("olist_", "").replace("_dataset", "")
    con.execute(
        f"CREATE OR REPLACE TABLE raw.{table} AS "
        f"SELECT * FROM read_csv_auto('{csv}')"
    )
    # Display stats for each table to verify
    n = con.execute(f"SELECT count(*) FROM raw.{table}").fetchone()[0]
    print(f"loaded raw.{table:<40} {n:>8,} rows")

con.close()
print(f"\ndone → {DB_PATH}")
