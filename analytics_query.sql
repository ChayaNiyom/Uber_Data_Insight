CREATE OR REPLACE TABLE `data-with-darshil.uber_data_engineering_yt.tbl_analytics` AS (
SELECT 
f.trip_id
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`data-with-darshil.uber_data_engineering_yt.fact_table` f
JOIN `vast-incline-407408.uber_data_engineering_sp.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `vast-incline-407408.uber_data_engineering_sp.vendor_dim` v  ON v.vender_id=f.vender_id  
JOIN `vast-incline-407408.uber_data_engineering_sp.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `vast-incline-407408.uber_data_engineering_sp.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
