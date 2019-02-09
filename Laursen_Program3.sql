--/***************************************************************/
--  Developer:            Julie Laursen
--
--  Program #:            3
--
--  File Name:            Program 3.sql
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             <Due Date>
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              3
--
--  Description:
--     Calculate cost of driving per day
--

set Serveroutput On;

DECLARE
   lv_miles NUMBER(10,2);
   lv_cost_per_gallon NUMBER(10,2);
   lv_avg_mph NUMBER(10,2);
   lv_parking_fees NUMBER(10,2);
   lv_tolls NUMBER(10,2);
   lv_daily_driving_cost NUMBER(10,2);
   
BEGIN
	
	lv_miles := 25;
	lv_cost_per_gallon := 2.25;
	lv_avg_mph := 24;
	lv_parking_fees := 2.45;
	lv_tolls := 2.50;
	
	lv_daily_driving_cost := lv_cost_per_gallon * lv_miles / lv_avg_mph + lv_parking_fees + lv_tolls;

    DBMS_OUTPUT.PUT_LINE('Daily driving cost: ' || TO_CHAR(lv_daily_driving_cost, '$999.99'));
	
	lv_miles := 40;
	lv_cost_per_gallon := 2.25;
	lv_avg_mph := 30;
	lv_parking_fees := 5.00;
	lv_tolls := 1.45;
	
	lv_daily_driving_cost := lv_cost_per_gallon * lv_miles / lv_avg_mph + lv_parking_fees + lv_tolls;

    DBMS_OUTPUT.PUT_LINE('Daily driving cost: ' || TO_CHAR(lv_daily_driving_cost, '$999.99'));
   
END;
/