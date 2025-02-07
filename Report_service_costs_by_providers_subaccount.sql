--Organizations wants to negotiate private pricing for a particular workload, a subaccount that carries specialized workloads, or their entire footprint. The cost metric used must amortize up-front and recurring fees to get an accurate view of the effective cost.





SELECT 
  ProviderName,
  ServiceName,
  SubAccountId,
  ChargePeriodStart,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE BillingPeriodStart >= ? AND BillingPeriodEnd < ?
  AND SubAccountId = ?
  AND ProviderName = ?
GROUP BY 
  ProviderName,
  ServiceName,
  SubAccountId,
  ChargePeriodStart
ORDER BY 
  SUM(EffectiveCost),
  BillingPeriodStart DESC