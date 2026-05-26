SELECT  a.education_level, COUNT(a.job_title) AS Total_jobs, AVG(a.ai_exposure_index) AS avg_exposure
FROM ai_jobs a
GROUP BY a.education_level
HAVING AVG(a.ai_exposure_index)> 0.5;
