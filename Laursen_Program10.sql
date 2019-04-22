--/***************************************************************/
--  Developer:            Julie Laursen
--
--  Program #:            5
--
--  File Name:            Program 5.sql
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             4/24
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              packages
--
--  Description:
--     package body for an overloaded package

CREATE OR REPLACE PACKAGE BODY shopper_pkg 
	IS
	PROCEDURE shopper_search_pp  
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_lastname OUT bb_shopper.lastname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.state%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE)
		IS
		    shopper_search_ex VARCHAR2(50) := 'No matching data found';
		BEGIN
			SELECT firstname, lastname, city, state, phone, email
				into  p_firstname, p_lastname, p_city, p_st, p_phone, p_email
				FROM BB_SHOPPER
				WHERE idshopper = p_ShopperID;
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE(shopper_search_ex);
		END;
	PROCEDURE shopper_search_pp  
		(p_firstname OUT bb_shopper.firstname%TYPE,
		 p_lastname IN out bb_shopper.lastname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.state%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE)
		IS
			shopper_search_ex VARCHAR2(50) := 'No matching data found';
		BEGIN
			SELECT firstname, lastname, city, state, phone, email
				into  p_firstname, p_lastname, p_city, p_st, p_phone, p_email 
				FROM BB_SHOPPER
				WHERE lastname = p_lastname;
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE(shopper_search_ex);
		END;
	END shopper_pkg;
	/