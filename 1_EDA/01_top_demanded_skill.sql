/*
Question: For someone seeking remote work as a Data Engineer, what are the top skills that is in demand?
*/
SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM 
    data_jobs.job_postings_fact AS jpf
INNER JOIN 
    data_jobs.skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN 
    skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
├────────────┴──────────────┤
│ 10 rows         2 columns │
└───────────────────────────┘

Key takeaways:

- SQL and Python are by far the most in-demand skills, with around 29,000 Job postings each - nearly double the next in demand skill of aws
- Apache Spark completes the top 5 with nearly 13,000 postings, highlighting the importance of big data processing skills
- SQL and Python remain the foundational skills for data engineers
- Cloud platforms (AWS, Azure) are critical for modern data engineering
- Data pipeline tools (Airflow, Snowflake, Databricks) show growing demand
- Java and GCP round out the top 10 most requested skills
*/