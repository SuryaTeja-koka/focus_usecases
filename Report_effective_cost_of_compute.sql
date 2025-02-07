--Engineers and Engineering Managers want to reduce their billed cost for Compute from a specific provider. In order to do that, they need to know the current rate of commitment-based discounts (without contracted discounts) per type of commitment. This helps to strategize further purchases.



SELECT
  CommitmentDiscountType,
  ProviderName,
  ServiceName,
  SubAccountId,
  SubAccountName,
  BillingPeriodStart,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE BillingPeriodStart  >= ? AND BillingPeriodEnd <= ?
  AND ServiceCategory = 'Compute'
GROUP BY
  CommitmentDiscountType,
  ServiceName,
  ProviderName,
  SubAccountId,
  SubAccountName,
  BillingPeriodStart