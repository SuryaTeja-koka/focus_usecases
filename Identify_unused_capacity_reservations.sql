-- Identify all data in a time period where CapacityReservationStatus is ‘unused’ thus identifying capacity reservations that aren’t used and enabling the Practitioner to take action on either cancelling the reservation (if able), working with other personas on a workload that could use the reservation, or performing informed ignore (knowing it is there but ignoring it because there is nothing one can do).

SELECT
  ProviderName,
  BillingAccountId,
  CapacityReservationId,
  CapacityReservationStatus,
  SUM(BilledCost) AS TotalBilledCost,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? AND ChargePeriodEnd < ?
  AND CapacityReservationStatus = 'Unused'
GROUP BY
  ProviderName,
  BillingAccountId,
  CapacityReservationId,
  CapacityReservationStatus