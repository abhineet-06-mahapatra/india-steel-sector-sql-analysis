<h1 align="center">🏭 India Steel Sector — SQL Analysis</h1>

<p align="center">
  An analyst-style SQL project exploring India's steel industry using official government data (Lok Sabha / Rajya Sabha replies, Ministry of Steel). Covers state-wise production, international trade, and public vs. private sector output.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" />
  <img src="https://img.shields.io/badge/SSMS-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" />
  <img src="https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white" />
  <img src="https://img.shields.io/badge/Data-data.gov.in-orange?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/github/last-commit/abhineet-06-mahapatra/india-steel-sector-sql-analysis?style=flat-square" />
  <img src="https://img.shields.io/github/repo-size/abhineet-06-mahapatra/india-steel-sector-sql-analysis?style=flat-square" />
  <img src="https://img.shields.io/github/stars/abhineet-06-mahapatra/india-steel-sector-sql-analysis?style=flat-square" />
</p>

---

## 📊 Data Sources

| Dataset | Coverage | Source |
|---|---|---|
| State-wise crude steel production | 2021–24 | [data.gov.in](https://data.gov.in) |
| State-wise finished steel production | 2019–24 | [data.gov.in](https://data.gov.in) |
| Country-wise steel imports | 2019–24 | [data.gov.in](https://data.gov.in) |
| Country-wise steel exports | 2019–24 | [data.gov.in](https://data.gov.in) |
| Monthly production by producer type | 2024–25 | [data.gov.in](https://data.gov.in) |

## 🛠️ Tools & Techniques

- **SQL Server (SSMS)** for all querying and analysis
- **Data cleaning** via UNPIVOT
- **Joins**: INNER JOIN, FULL OUTER JOIN
- **Window functions**: LAG()
- **Aggregation**: GROUP BY, SUM, AVG
- **Excel / Power BI** for the production dashboard

## 🔑 Key Findings

### 🥇 1. Production is concentrated in three eastern states
Odisha, Jharkhand, and Chhattisgarh consistently rank as India's top 3 crude steel producers across 2021–24. Odisha alone produced 25,740 thousand tonnes in 2023–24 — nearly double 4th-place Maharashtra's 15,678.

### 📈 2. National output growth is accelerating
Crude steel production grew 5.7% in 2022–23, then 13.5% in 2023–24. The growth rate more than doubled year-on-year.

### ⚠️ 3. India's steel trade deficit dipped in 2020–21, then widened sharply
The deficit shrank from -105,805 (thousand tonnes) in 2019–20 to -92,387 in 2020–21, likely tied to a pandemic-related import slowdown. After that it grew every year: -105,414 (2021–22), -125,698 (2022–23), and -143,856 (2023–24). Overall, the deficit grew 36% from 2019–20 to 2023–24, driven by rising imports (116K → 156K) against flat, small exports (10K → 18K).

### 🏢 4. Private sector dominates production, and the gap widens for finished steel
In 2024, private producers made 63,630 (thousand tonnes) of crude steel versus 11,700 from the public sector — a 5.4x gap. For finished steel it's 61,774 versus 10,144 — a 6.1x gap. Private industry drives India's steel output, and its lead grows further down the value chain.

### ❄️ 5. Production shows mild winter seasonality (based on partial-year data)
The available months (July 2024 – February 2025) show December and January as the strongest months for crude steel output (13,429 and 13,710), with July–September running lower (12,000–12,400). This covers 8 of 12 months, so it's an indicative pattern rather than a confirmed full-year trend.

### 🔄 6. Crude-to-finished conversion varies widely by state
Uttarakhand converts at the highest ratio — 1.74 in 2021–22, declining to 1.46 by 2023–24. Delhi (0.05 → 0.46) and Rajasthan (0.33 → 0.40) convert far less locally, suggesting these states rely more on imported or inbound semi-finished steel rather than local crude-to-finished conversion.

## 📁 Repository Structure

india-steel-sector-sql-analysis/
├── README.md
├── Steel queries.sql                     # All SQL analysis queries
├── Steel Production Dashboard.xlsx       # Excel/Power BI dashboard
├── RS_Session_265_AU_2228_A_to_D.csv     # Raw govt. data
├── RS_Session_265_AU_2230_A_to_E.csv     # Raw govt. data
├── RS_Session_266_AU_1431_A_to_D_ii.csv  # Raw govt. data
├── RS_Session_266_AU_629_A_ii.csv        # Raw govt. data
└── 829137af-5e90-4400-bffe-5d65b66e5956.csv

## 📝 Data Notes

- Daman and Diu stops reporting separately after 2021–22 due to its administrative merger with Dadra & Nagar Haveli.
- Arunachal Pradesh shows a null conversion ratio in 2021–22 due to zero finished steel output that year, not a data error.
- A "Total" summary row exists in the raw state-level files alongside individual states and was explicitly excluded from all state-level rankings and aggregations.

## 🚀 How to Reproduce

1. Clone the repo: git clone https://github.com/abhineet-06-mahapatra/india-steel-sector-sql-analysis.git
2. Open SQL Server Management Studio (SSMS) and create a new database.
3. Import each CSV as a staging table (Import Flat File wizard or BULK INSERT).
4. Run Steel queries.sql against the imported tables.
5. Open Steel Production Dashboard.xlsx to view the visualized output.

---

<p align="center">Made with 🔧 by <a href="https://github.com/abhineet-06-mahapatra">Abhineet Mahapatra</a></p>
