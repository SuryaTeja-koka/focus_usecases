-- Understanding the individual metered costs of a particular SKU can help assist FinOps practitioners understand the cost breakdown of usage of a select cloud resource. Especially in cases where a SKU has a few component charges like (Usage hours, Throughput, API requests, etc)

SELECT
  ProviderName,
  ChargePeriodStart,
  ChargePeriodEnd,
  SkuId,
  SkuPriceId,
  PricingUnit,
  ListUnitPrice,
  SUM(PricingQuantity) AS TotalPricingQuantity,
  SUM(ListCost) AS TotalListCost,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?
GROUP BY
  ProviderName,
  ChargePeriodStart,
  ChargePeriodEnd,
  SkuId,
  SkuPriceId,
  PricingUnit,
  ListUnitPrice
ORDER BY
  ChargePeriodStart ASC
LIMIT 100