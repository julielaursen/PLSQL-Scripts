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
--  Chapter:              4
--
--  Description:
--     Calculate customer rating based on total purchases and display on the screen
--

set Serveroutput On;

DECLARE
	lv_purchase NUMBER(10, 2);
	lv_rating VARCHAR2(15);

BEGIN
lv_purchase := 600.00;
lv_rating := 'test';

	IF lv_purchase > 500.00 THEN
		lv_rating := 'high';
	ELSIF lv_purchase > 350.00 THEN
		lv_rating := 'medium';
	ELSIF lv_purchase > 250.00 THEN
		lv_rating := 'normal';
	ELSE
		lv_rating := 'low';
	END IF;
		DBMS_OUTPUT.PUT_LINE(lv_rating);
		
	CASE  
		WHEN lv_purchase > 500.00 THEN
			lv_rating := 'high';
		WHEN lv_purchase > 350.00 THEN
			lv_rating := 'medium';
		WHEN lv_purchase > 250.00 THEN
			lv_rating := 'normal';
		ELSE
			lv_rating := 'low';
		END CASE;
		DBMS_OUTPUT.PUT_LINE(lv_rating);
END;
/