-- Analyzing service-level spending trends over a time period can expose expected and unexpected growth in the consumption of a cloud service, and is a good way for the FinOps team to prioritize usage and rate optimization conversations with product, engineering, and finance leaders within the organization.

SELECT
  BillingPeriodStart,
  ProviderName,
  SubAccountId,
  SubAccountName,
  ServiceName,
  SUM(BilledCost) AS TotalBilledCost,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ServiceName = ?
  AND BillingPeriodStart >= ? AND BillingPeriodStart < ?
GROUP BY
  BillingPeriodStart,
  ProviderName,
  SubAccountId,
  SubAccountName,
  ServiceName
ORDER BY MonthlyCost DESC