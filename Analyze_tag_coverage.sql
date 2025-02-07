-- Analyzing the amount of costs for a provider that have been tagged with a specific tag can enable the FinOps practitioner to check the amount of costs being allocated via tags.

SELECT 
    SUM(CASE 
        WHEN JSON_CONTAINS_PATH(tags, 'one', '$.?') 
        THEN EffectiveCost 
        ELSE 0 
    END) / SUM(EffectiveCost) * 100 AS TaggedPercentage
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?
     AND EffectiveCost > 0
     AND ProviderName = ?