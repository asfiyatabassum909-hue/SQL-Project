/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analysts positions
- Focuses on roles with specified salaries, regardless of location 
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25

/*
Key Insights from the Top 25 Highest-Paying Skills for Data Analysts
-Big data and data engineering skills command the highest salaries. Technologies like PySpark ($208K), Databricks ($142K), and Airflow ($126K) suggest that analysts who can work with large-scale data pipelines earn significantly more than those with traditional analytics skills.
-Cloud and infrastructure expertise is highly valued. Skills such as GCP, Kubernetes, and Linux appear among the top-paying technologies, reflecting the growing demand for analysts who can work in modern cloud-based environments.
-Machine learning tools boost earning potential. Libraries and platforms like scikit-learn, Pandas, NumPy, and DataRobot indicate that employers are willing to pay a premium for analysts with predictive modeling and advanced analytics capabilities.
-Software development and DevOps tools are increasingly important. Technologies including GitLab, Bitbucket, Jenkins, and Atlassian show that version control, collaboration, and deployment skills are becoming valuable complements to traditional data analysis.
-Programming remains a key differentiator. Languages such as Python (via Pandas and NumPy), Scala, Swift, and Golang dominate the list, highlighting that higher-paying analyst roles often require programming beyond SQL.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/