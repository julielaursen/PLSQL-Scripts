--Not done yet, include a NO DATA FOUND EXCEPTION
CREATE OR REPLACE PACKAGE shopper_pkg IS
    PROCEDURE shopper_search_pp 
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_lastname OUT bb_shopper.lastname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.st%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
	PROCEDURE shopper_search_pp 
		(p_lastname IN bb_shopper.lastame%TYPE
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.st%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
END;
/
CREATE OR REPLACE PACKAGE BODY shopper_pkg 
	IS
	PROCEDURE shopper_search_pp  
		(p_ShopperID IN bb_shopper.idshopper%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_lastname OUT bb_shopper.lastname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.st%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  p_firstname, p_lastame, p_city, p_st, p_phone, p_email
				FROM BB_SHOPPER
				WHERE idshopper = p_ShopperID;
		END;
	PROCEDURE shopper_search_pp  
		(p_lastname IN bb_shopper.lastname%TYPE,
		 p_firstname OUT bb_shopper.firstname%TYPE,
		 p_city OUT bb_shopper.city%TYPE,
		 p_st OUT bb_shopper.st%TYPE,
		 p_phone OUT bb_shopper.phone%TYPE,
		 p_email OUT bb_shopper.email%TYPE);
		IS
		BEGIN
			SELECT firstname, lastname, city, st, phone, email
				into  p_firstname, p_lastame, p_city, p_st, p_phone, p_email 
				FROM BB_SHOPPER
				WHERE lastname = p_lastname;
		END;
	END;
	/