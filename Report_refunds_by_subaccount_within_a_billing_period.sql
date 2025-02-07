-- Use FOCUS data to identify refunds across multiple providers, billing accounts, and subaccounts.

SELECT
  ProviderName,
  BillingAccountId,
  ServiceCategory,
  SubAccountId,
  SubAccountName,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE BillingPeriodStart >= ? AND BillingPeriodEnd < ?
  AND ChargeClass = 'Correction'
GROUP BY
  ProviderName,
  BillingAccountId,
  SubAccountId,
  SubAccountName,
  ServiceCategory