--This use cases focuses on Effective Savings Rate (ESR) per Service.

--The Effective Savings Rate is a KPI to track the efficiency of using commitment-based discounts. The KPI calculation is (Contracted Cost – Effective Cost) / Contracted Cost)

SELECT
  ProviderName,
  ContractedUnitPrice,
  PricingQuantity,
  EffectiveCost,
  ((ListCost - EffectiveCost)/ListCost) AS ESROverList,
  ((ContractedUnitPrice - EffectiveCost)/ContractedUnitPrice) AS ESROverContract
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?