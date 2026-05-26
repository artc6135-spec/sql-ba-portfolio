SELECT 
    a.risk_category,
    a.job_title,
    a.ai_exposure_index,
    DENSE_RANK() OVER (
        PARTITION BY a.risk_category 
        ORDER BY a.ai_exposure_index DESC
    ) as rank_inside_category
FROM ai_jobs a
ORDER BY a.risk_category, rank_inside_category;
