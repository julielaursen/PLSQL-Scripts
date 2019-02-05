--/***************************************************************/
--  Developer:            Julie Laursen
--
--  Program #:            2
--
--  File Name:            Program 2.sql
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             <Due Date>
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              2
--
--  Description:
--     <An explanation of what the program is designed to do>
--

set Serveroutput On;

DECLARE
   var_1 NUMBER(10);
   var_2 NUMBER(10);
   addVar NUMBER(10);
   subtractVar NUMBER(10);
   today_timestamp TIMESTAMP;
   name VARCHAR(25);
   
BEGIN

	var_1 := 10;
	var_2 := 20;
	addVar := var_1 + var_2;
	subtractVar := var_1 - var_2;
	name := 'Julie Laursen';
 
   DBMS_OUTPUT.PUT_LINE('Variable 1 * Variable 2 = ' || var_1 * var_2);
   DBMS_OUTPUT.PUT_LINE('Variable 1 / Variable 2 = ' || var_1 / var_2);
   DBMS_OUTPUT.PUT_LINE('Variable 1 + Variable 2 = ' || addVar);
   DBMS_OUTPUT.PUT_LINE('Variable 1 + Variable 2 = ' || subtractVar);
   
   DBMS_OUTPUT.PUT_LINE('The current date is ' || today_timestamp);
   DBMS_OUTPUT.PUT_LINE('My full name is: ' || name);
END;
/