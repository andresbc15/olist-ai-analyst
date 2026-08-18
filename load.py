import duckdb
import pathlib

DATA_DIR = pathlib.Path("data")
DB_PATH = "olist.duckdb"

con = duckdb.connect(DB_PATH)
con.execute("CREATE SCHEMA IF NOT EXISTS raw")

# Looks for every file in DATA_DIR matching the pattern *.csv
csvs = sorted(DATA_DIR.glob("*.csv"))

if not csvs:
    raise SystemExit(f"No CSVs found in {DATA_DIR.resolve()} — did you drop them in data/?")

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
print("\ndone → olist.duckdb")