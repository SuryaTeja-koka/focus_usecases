--Understanding costs across providers, billing periods, and service categories (Analytics, Compute, Database, Storage, etc.) provides valuable insight into total costs.





SELECT
  ProviderName,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE BillingPeriodStart >= ? and BillingPeriodEnd  <= ?
GROUP BY
  ProviderName,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory
ORDER BY TotalBilledCost DESC