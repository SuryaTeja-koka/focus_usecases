-- Understanding costs across providers, billing periods, and service categories (Analytics, Compute, Database, Storage, etc.)  and service subcategories (Virtual Machines, Relational Databases, Content Delivery, etc) provides valuable insight into total costs.

SELECT
  ProviderName,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory,
  ServiceSubcategory,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE BillingPeriodStart >= ? and BillingPeriodEnd  < ?
GROUP BY
  ProviderName,
  BillingCurrency,
  BillingPeriodStart,
  ServiceCategory,
  ServiceSubcategory
ORDER BY TotalBilledCost DESC