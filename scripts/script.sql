USE pruebajelly;

-- Consulta: Métricas por canal con filtro de conversiones
SELECT 
    channel,
    SUM(spend_usd) AS spend_total,
    SUM(clicks) AS clicks_total,
    SUM(platform_conversions) AS conversions_total,
    SUM(tracked_revenue_usd) AS revenue_total,
    SUM(tracked_revenue_usd) / NULLIF(SUM(spend_usd), 0) AS ROAS,
    SUM(spend_usd) / NULLIF(SUM(platform_conversions), 0) AS CPA
FROM campaigns
WHERE platform_conversions >= 1
GROUP BY channel
ORDER BY ROAS DESC;