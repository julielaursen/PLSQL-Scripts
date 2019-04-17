--query the BB_SHOPPER table for the following: First name, Last name, City, State, Phone, and e-mail address. The first procedure
--must use the Shopper ID to search for the record in the table. The second procedure
--must use the last name for the search. Do not print any data in the procedure. Use
--parameters to return the data to the calling program unit. Include a NO_DATA_FOUND
--exception handler to display a message that no record was found.

--package specification
CREATE OR REPLACE PACKAGE myPackage
IS
    PROCEDURE proc1 (p_ShopperID IN bb_shopper.idshopper%TYPE);
	PROCEDURE proc2 (p_lastame IN bb_shopper.lastame%TYPE);
END;
/

CREATE OR REPLACE PACKAGE BODY shopper_pkg 
	IS
	PROCEDURE search_Shopper_pp (p_ShopperID)
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  
				FROM BB_SHOPPER
				WHERE idshopper = p_ShopperID;
		END;
	PROCEDURE search_Shopper (p_lastname)
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  
				FROM BB_SHOPPER
				WHERE lastname = p_lastname;
		END;
	END;