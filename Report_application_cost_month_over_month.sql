--As an application owner or engineering team I want to track the month over month costs of my application.




SELECT
  MONTH(BillingPeriodStart),
  ServiceName,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE Tags["Application"] = ?
  AND ChargePeriodStart >= ? AND ChargePeriodEnd < ?
GROUP BY
  MONTH(BillingPeriodStart),
  ServiceName