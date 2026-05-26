SELECT 
    a.job_title,
    a.average_salary,
    a.automation_probability_2030,
    a.risk_category
FROM ai_jobs a
WHERE a.education_level IN ('Bachelor''s', 'Master''s')
  AND a.average_salary > 100000
  AND a.risk_category = 'High'
ORDER BY a.automation_probability_2030 DESC;
