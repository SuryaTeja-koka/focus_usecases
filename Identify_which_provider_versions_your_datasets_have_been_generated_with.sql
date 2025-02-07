-- As data arrives into the FOCUS datastore a FinOps Practitioner may need to track updates to the datasets as providers update their FOCUS conformance. Reporting which provider versions your data has been generated to enables a Practitioner to stay informed and identify when they may need to check their FOCUS reports have not been impacted by new provider versions.

SELECT
  DISTINCT ChargePeriodStart,
  ProviderName
  ProviderVersion
FROM focus_data_table
WHERE ChargePeriodStart >= ? and ChargePeriodEnd  < ?