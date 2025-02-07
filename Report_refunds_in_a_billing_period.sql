--FinOps Practitioners need to identify all refunds within a billing period.



SELECT
  ProviderName,
  BillingAccountId,
  ChargeCategory,
  ServiceCategory,
  ServiceName,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE BillingPeriodStart >= ? AND BillingPeriodEnd < ?
  AND ChargeClass = 'Correction'
GROUP BY
  ProviderName,
  BillingAccountId,
  ChargeCategory,
  ServiceCategory,
  ServiceName