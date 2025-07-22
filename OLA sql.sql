CREATE DATABASE Ola;
use Ola;
select * from Bookings;

-- 1. Retrieve all successful bookings:
create view successful_bookings as
SELECT * FROM Bookings
Where Booking_status='Success';
select * from successful_bookings;

--  2. Find the average ride distance for each vehicle type:
 Create View ride_distance_for_each_vehicle As
select Vehicle_Type,round(avg(Ride_Distance),1) as avg_distance
from Bookings
group by Vehicle_Type;
select * from ride_distance_for_each_vehicle;

--  3. Get the total number of cancelled rides by customers:
 Create View canceled_rides_by_customers As
select count(*) as total_rides_canceled_by_customer
from Bookings
where Booking_Status='Canceled by Customer';
select * from canceled_rides_by_customers;

--  #4. List the top 5 customers who booked the highest number of rides
create view Top_5_Customers as
select Customer_ID ,count(Booking_ID) as total_rides
from Bookings
group by Customer_ID
order by total_rides desc limit 5;
select * from Top_5_Customers;

--  #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Create View Rides_cancelled_by_Drivers_P_C_Issues As
 SELECT COUNT(*) FROM bookings
 WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
 select * from Rides_cancelled_by_Drivers_P_C_Issues;
 
--   #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create View Max_Min_Driver_Rating As
select max(Driver_Ratings)as max_rating,
min(Driver_Ratings) as min_rating 
from Bookings
where Vehicle_Type='Prime Sedan';
select * from Max_Min_Driver_Rating;

--  #7. Retrieve all rides where payment was made using UPI:
 Create View UPI_Payment As
select * from Bookings
where Payment_Method='UPI';
select * from UPI_Payment;

--  #8. Find the average customer rating per vehicle type:
create view average_customer_rating_per_vehicle_type as
select round(avg(Customer_Rating),2) as avg_customer_rating ,Vehicle_type
from Bookings
group by Vehicle_Type;
select * from average_customer_rating_per_vehicle_type;

-- #9. Calculate the total booking value of rides completed successfully:
 Create View total_successful_ride As
 SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 select * from total_successful_ride;
 
--   #10. List all incomplete rides along with the reason:
 Create View Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
 select * from Incomplete_Rides_Reason;