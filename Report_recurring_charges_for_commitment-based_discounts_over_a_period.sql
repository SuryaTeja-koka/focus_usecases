-- As a Finance person, I want to understand the recurring costs of commitment based discounts over a period of time to improve forecasting.

SELECT
  BillingPeriodStart,
  CommitmentDiscountId,
  CommitmentDiscountName,
  CommitmentDiscountType,
  ChargeFrequency,
  SUM(BilledCost) AS TotalBilledCost
FROM focus_data_table
WHERE BillingPeriodStart  >= ? AND BillingPeriodStart < ?
  AND ChargeFrequency = 'Recurring'
  AND CommitmentDiscountId IS NOT NULL
GROUP BY
  BillingPeriodStart,
  CommitmentDiscountId,
  CommitmentDiscountName,
  CommitmentDiscountType,
  ChargeFrequency