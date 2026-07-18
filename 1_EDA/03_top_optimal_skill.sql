/*

Question: What are the most optimal skills for data engineers-balancing both demand and salary:
Create a ranking column that combines demand count and median salary to identity the most valuable skills
- Focus only on remote Data Engineer positions with specified annual salaries.

*/

SELECT
    sd.skills,
    ROUND(MEDIAN (jpf. salary_year_avg), 0) AS median_salary,
    ROUND(LN(COUNT (jpf.*)), 1) AS In_demand_count,
    ROUND((MEDIAN(jpf. salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score
FROM 
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd. job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf. job_work_from_home = True
    AND jpf. salary_year_avg IS NOT NULL
GROUP BY
    sd. skills
HAVING
    COUNT (jpf.*) > 100
ORDER BY
    optimal_score DESC
LIMIT 25;

/*
────────────┬───────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ ln_demand_count │ optimal_score │
│  varchar   │     int32     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ terraform  │        184000 │             5.3 │          0.97 │
│ python     │        135000 │             7.0 │          0.95 │
│ aws        │        137320 │             6.7 │          0.91 │
│ sql        │        130000 │             7.0 │          0.91 │
│ airflow    │        150000 │             6.0 │          0.89 │
│ spark      │        140000 │             6.2 │          0.87 │
│ kafka      │        145000 │             5.7 │          0.82 │
│ snowflake  │        135500 │             6.1 │          0.82 │
│ azure      │        128000 │             6.2 │          0.79 │
│ java       │        135000 │             5.7 │          0.77 │
│ scala      │        137290 │             5.5 │          0.76 │
│ git        │        140000 │             5.3 │          0.75 │
│ kubernetes │        150500 │             5.0 │          0.75 │
│ databricks │        132750 │             5.6 │          0.74 │
│ redshift   │        130000 │             5.6 │          0.73 │
│ gcp        │        136000 │             5.3 │          0.72 │
│ nosql      │        134415 │             5.3 │          0.71 │
│ hadoop     │        135000 │             5.3 │          0.71 │
│ pyspark    │        140000 │             5.0 │           0.7 │
│ docker     │        135000 │             5.0 │          0.67 │
│ mongodb    │        135750 │             4.9 │          0.67 │
│ r          │        134775 │             4.9 │          0.66 │
│ go         │        140000 │             4.7 │          0.66 │
│ github     │        135000 │             4.8 │          0.65 │
│ bigquery   │        135000 │             4.8 │          0.65 │
├────────────┴───────────────┴─────────────────┴───────────────┤



**Terraform** ranks as the most valuable skill, offering the best balance of salary and demand.
**Python**, **AWS**, and **SQL** remain the strongest core skills due to their consistently high demand and competitive salaries. 
Overall, combining foundational skills with modern data engineering tools like **Airflow**, **Spark**, and **Kafka** provides the best opportunities for career growth and higher pay.