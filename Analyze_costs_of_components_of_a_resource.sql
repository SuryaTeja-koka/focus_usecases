--Using FOCUS data, an Engineer can deep dive on cost details for a single resource.



SELECT ResourceId,
  ResourceName,
  ResourceType,
  ChargeDescription,
  SkuId,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ?  AND ChargePeriodEnd < ?
  AND ResourceId=?
GROUP BY ResourceId,
  ResourceName,
  ResourceType, 
  ChargeDescription,
  SkuId