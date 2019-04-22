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
--     package specification for an overloaded package
--

CREATE OR REPLACE PACKAGE shopper_pkg IS
	PROCEDURE shopper_search_pp  
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_lastname OUT bb_shopper.lastname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.state%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
	PROCEDURE shopper_search_pp  
		(p_lastname IN out bb_shopper.lastname%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.state%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
END;
/