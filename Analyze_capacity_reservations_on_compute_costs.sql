-- Compute costs are often the highest spend area in a cloud bill, it may be useful for FinOps practitioners and Engineers to understand the volume of costs that are coming from reserved commitments either used or unused compared to the amount of compute costs that have no reservations applied. Capacity reservations can be very useful for Engineering to help them ensure capacity is available for their services when it is needed, however when reducing usage and rightsizing workloads capacity reservations need to be adjusted at the same time.

SELECT
  CASE 
        WHEN CapacityReservationId IS NOT NULL AND  CapacityReservationStatus  = 'Unused' THEN 'Unused Capacity Reservation'
        WHEN CapacityReservationId IS NOT NULL AND  CapacityReservationStatus  = 'Used' THEN 'Compute using Capacity Reservation'
        ELSE 'Compute without Capacity Reservation'
  END AS Status,
  ProviderName,
  BillingAccountId,
  SUM(BilledCost) AS TotalBilledCost,
  SUM(EffectiveCost) AS TotalEffectiveCost
FROM focus_data_table
WHERE ChargePeriodStart >= ? AND ChargePeriodEnd < ?
  AND ServiceCategory = 'Compute'
GROUP BY
  ProviderName,
  BillingAccountId,
  CapacityReservationId,
  CapacityReservationStatus