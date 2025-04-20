Create Database Ola;
Use OLA;

Select * from bookings;

#1. Retrieve all successful bookings:

Create View Successful_Bookings as
Select * from bookings
Where Booking_Status = 'Completed';

Select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View Vehicle_Type_Avg_Distance AS 
Select vehicle_type, Avg(ride_distance) AS Avg_Distance
from Bookings
Group BY Vehicle_Type;

Select * from Vehicle_Type_Avg_Distance;

#3. Get the total number of cancelled rides by customers:
Create View Rides_cancelled_by_Customer AS 
Select count(cancelled_Rides_by_Customer) from bookings
Where cancelled_Rides_by_Customer > 0;

Select * from Rides_cancelled_by_Customer;

#4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers AS
Select Customer_ID, Count(Booking_ID) AS Number_of_Rides
from Bookings
Group By Customer_ID
Order By Number_of_Rides DESC
Limit 5;

Select * from Top_5_Customers;

#5. Get the number of Incomplete rides due to Customer Demand:
Create View Incomplete_rides_on_Customer_Demand AS
Select Count(*) from Bookings 
Where Incomplete_Rides_Reason = 'Customer Demand';

Select * from Incomplete_rides_on_Customer_Demand;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Prime_Sedan_Driver_Ratings AS 
Select Vehicle_Type, Max(Driver_Ratings) AS Max_Ratings,
min(Driver_Ratings) AS Min_Ratings
From Bookings
Where Vehicle_Type = 'Prime Sedan'
Group By Vehicle_Type
;

Select * from Prime_Sedan_Driver_Ratings;

#7. Retrieve all rides where payment was made using UPI:
Create View Rides_Paid_By_UPI AS
Select * from Bookings
Where Payment_Method = 'UPI';

Select * from Rides_Paid_By_UPI;

#8. Find the average customer rating per vehicle type:
Create View Avg_Customer_Rating_for_Each_Vehicle AS
Select Vehicle_Type, Round(Avg(Customer_Rating),2) AS Avg_Customer_Ratings
from bookings
Group By Vehicle_Type;

Select * from Avg_Customer_Rating_for_Each_Vehicle;

#9. Calculate the total booking value of rides completed successfully:
Create View Total_Successful_ride_values AS
Select Booking_Status, Round(Sum(Booking_Value), 2) AS Total_Successful_Ride_Value
from Bookings 
Where Booking_Status = 'Completed'
Group BY Booking_Status;

Select * from Total_Successful_ride_values;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_reason AS
Select Booking_ID, Incomplete_Rides_Reason from Bookings
Where Incomplete_Rides > 0;

Select * from Incomplete_Rides_reason;


