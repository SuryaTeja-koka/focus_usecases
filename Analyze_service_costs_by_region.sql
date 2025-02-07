--Analyzing Service level spending trends over a time period can expose expected and unexpected growth in the consumption of various services, by region, across all providers and is a good way for the FinOps team to prioritize usage and rate optimization conversations with product, engineering and finance leaders within the organization.






SELECT
  ChargePeriodStart,
  ProviderName,
  RegionId,
  ServiceName,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?
GROUP BY
  ChargePeriodStart,
  ProviderName,
  RegionId,
  ServiceName
ORDER BY ChargePeriodStart,
  SUM(EffectiveCost) DESC