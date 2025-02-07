-- Understanding costs across providers, billing periods, billing accounts, and service categories (Analytics, Compute, Database, Storage, etc.) provides valuable insight into total costs and can be used by Procurement to focus negotiations for specific providers with details on the billing accounts that are driving costs. to focus negotiations toward highest costing items.

SELECT
  ProviderName,
  BillingAccountName,
  BillingAccountId,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory,
  ServiceName,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?
  AND ProviderName = ?
GROUP BY
  ProviderName,
  BillingAccountName,
  BillingAccountId,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory,
  ServiceName
ORDER BY TotalBilledCost DESC