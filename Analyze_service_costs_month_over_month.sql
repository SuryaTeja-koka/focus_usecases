--Analyzing service-level spending trends over a time period can expose expected and unexpected growth in the consumption of various services across all providers and is a good way for the FinOps team to prioritize usage and rate optimization conversations with product, engineering and finance leaders within the organization.




SELECT
  MONTH(ChargePeriodStart),
  ProviderName,
  ServiceName,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? AND ChargePeriodStart < ?
GROUP BY 
  MONTH(ChargePeriodStart), 
  ProviderName,
  ServiceName
ORDER BY
  MONTH(ChargePeriodStart),
  SUM(EffectiveCost) DESC