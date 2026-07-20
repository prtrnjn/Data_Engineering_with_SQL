# Data Engineering Jobs Analysis 📊

This repository contains SQL-based analyses of the job market, built with DuckDB / MotherDuck against the `data_jobs` database. It's organized as two standalone projects, first one being an exploratory data analyst focusing on skills for data engineers, located at 1_EDA folder. The second will be updated. Both project are from the same database.

## 📁 Repository Structure

```

├── 1_EDA/
│   ├── 01_top_demanded_skill.sql
│   ├── 02_top_paying_skill.sql
│   └── 03_top_optimal_skill.sql
├── 2_<tbd>/
│   └── ...
└── README.md
```

## 📚 Projects in This Repo

| # | Project | Status |
|---|---|---|
| 1 | [Data Engineer Skills Analysis](#project-1-data-engineer-skills-analysis) | ✅ Complete |
| 2 | *TBD* | 🚧 In progress |

---

# Project 1: Data Engineer Skills Analysis

SQL analysis of remote **Data Engineer** job postings, exploring which skills are most **in demand**, which pay the **highest**, and which offer the best **balance of both** (demand + salary).

---

## 🗂️ Database Schema

| Table | Description |
|---|---|
| `job_postings_fact` | Core job posting data (title, salary, remote flag, etc.) |
| `skills_job_dim` | Dimension table linking job postings to skills |
| `skills_dim` | Skill ID → skill name lookup |
|`company_dim`| dimension table liking company ID to job posting table

---

## ❓ Questions Answered

| # | File | Question |
|---|---|---|
| 1 | `01_top_demanded_skill.sql` | What are the top 10 most in-demand skills for remote Data Engineers? |
| 2 | `02_top_paying_skill.sql` | Which skills command the highest median salaries? |
| 3 | `03_top_optimal_skill.sql` | Which skills offer the best *balance* of demand and salary? |

---

## 1️⃣ Top Demanded Skills

[Top Demanded Skills](/1_EDA/01_top_demanded_skill.sql)

Counts how often each skill appears across remote Data Engineer postings.

**Top 5:** `sql` (29,221) → `python` (28,776) → `aws` (17,823) → `azure` (14,143) → `spark` (12,799)

**Takeaways**
- SQL and Python dominate, each appearing in nearly 29K postings — roughly 2x the next closest skill.
- Cloud platforms (AWS, Azure) are essential to the modern DE toolkit.
- Pipeline/orchestration tools (Airflow, Snowflake, Databricks) show strong, growing demand.

---

## 2️⃣ Top Paying Skills

[Top Paying Skills](/1_EDA/02_top_paying_skill.sql)

Median salary per skill, filtered to skills with **100+ postings** to avoid outliers from rarely-requested skills.

**Top 5:** `rust` ($210K) → `terraform` / `golang` ($184K) → `spring` ($175.5K) → `neo4j` ($170K)

**Takeaways**
- Rust tops the pay scale but has limited demand (232 postings) — a niche, high-reward skill.
- Terraform and Golang combine high pay *and* solid demand.
- Kubernetes ($150.5K) and Airflow ($150K) stand out for pairing strong pay with very high demand (4K–10K postings).

---

## 3️⃣ Most Optimal Skills

[Most Optimal skills](/1_EDA/03_top_optimal_skill.sql)

Combines demand and salary into a single **optimal score**:

```
optimal_score = (median_salary × ln(demand_count)) / 1,000,000
```

Log-scaling demand prevents ultra-common skills from automatically dominating the ranking, while still rewarding higher volume. Filtered to remote roles with a specified salary and **150+ postings**.

**Top 5:** `terraform` (0.97) → `python` (0.95) → `aws` (0.91) → `sql` (0.91) → `airflow` (0.89)

**Takeaways**
- **Terraform** is the single most valuable skill by this measure — strong salary *and* solid demand.
- **Python**, **AWS**, and **SQL** remain the core foundation: consistently high demand with competitive pay.
- Rounding out the list, **Airflow**, **Spark**, and **Kafka** represent the modern data engineering stack worth prioritizing after the core skills.

---

## 🛠️ Tools Used

- **SQL** — core querying and aggregation (`MEDIAN`, `LN`, `GROUP BY` / `HAVING`)
- **DuckDB + MotherDuck** — query engine and cloud data warehouse

---

## 📌 Overall Conclusion

For someone building a Data Engineer skill set with limited time:

1. **Foundation:** SQL, Python, AWS — highest demand, strong pay, non-negotiable.
2. **Differentiators:** Terraform, Airflow, Spark, Kafka — solid demand with a real salary premium.
3. **Niche upside:** Rust, Golang, Neo4j — smaller job pools but top-tier pay if you land one.

---

# Project 2: *Coming Soon*

Details to be added once this project is underway.

---

## 🛠️ Overall Tools Used

- **SQL** — core querying and aggregation
- **DuckDB + MotherDuck** — query engine and cloud data warehouse
