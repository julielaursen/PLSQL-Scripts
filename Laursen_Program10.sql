--query the BB_SHOPPER table for the following: First name, Last name, City, State, Phone, and e-mail address. The first procedure
--must use the Shopper ID to search for the record in the table. The second procedure
--must use the last name for the search. Do not print any data in the procedure. Use
--parameters to return the data to the calling program unit. Include a NO_DATA_FOUND
--exception handler to display a message that no record was found.

--package specification
CREATE OR REPLACE PACKAGE shopper_pkg 
IS
    PROCEDURE shopper_search_pp 
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname IN bb_shopper.firstname%TYPE,
		 p_lastname IN bb_shopper.lastname%TYPE,
		 p_city IN bb_shopper.city%TYPE,
		 p_st IN bb_shopper.st%TYPE,
		 p_phone IN bb_shopper.phone%TYPE
		 p_email IN bb_shopper.email%TYPE);
	PROCEDURE shopper_search_pp 
		(p_lastame IN bb_shopper.lastame%TYPE
		p_firstname IN bb_shopper.firstname%TYPE,
		 p_lastname IN bb_shopper.lastname%TYPE,
		 p_city IN bb_shopper.city%TYPE,
		 p_st IN bb_shopper.st%TYPE,
		 p_phone IN bb_shopper.phone%TYPE
		 p_email IN bb_shopper.email%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY shopper_pkg 
	IS
	PROCEDURE shopper_search_pp  
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname IN bb_shopper.firstname%TYPE,
		 p_lastname IN bb_shopper.lastname%TYPE,
		 p_city IN bb_shopper.city%TYPE,
		 p_st IN bb_shopper.st%TYPE,
		 p_phone IN bb_shopper.phone%TYPE
		 p_email IN bb_shopper.email%TYPE);
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  p_firstname, p_lastame, p_city, p_st, p_phone, p_email
				FROM BB_SHOPPER
				WHERE idshopper = p_ShopperID;
		END;
	PROCEDURE shopper_search_pp  
		(p_lastname IN bb_shopper.lastame%TYPE,
		 p_firstname IN bb_shopper.firstname%TYPE,
		 p_lastname IN bb_shopper.lastname%TYPE,
		 p_city IN bb_shopper.city%TYPE,
		 p_st IN bb_shopper.st%TYPE,
		 p_phone IN bb_shopper.phone%TYPE
		 p_email IN bb_shopper.email%TYPE);
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  p_firstname, p_lastame, p_city, p_st, p_phone, p_email 
				FROM BB_SHOPPER
				WHERE lastname = p_lastname;
		END;
	END;