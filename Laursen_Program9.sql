set Serveroutput On;

CREATE OR REPLACE FUNCTION  MOVIE_STK (p_MOVIE_ID in number)
return varchar
IS
	lv_title varchar(50);
	lv_qty number;
	lv_out varchar(100);
	
BEGIN
	select movie_title, movie_qty
	into lv_title, lv_qty
	FROM MM_MOVIE 
	WHERE movie_id = p_MOVIE_ID;
	
	IF lv_qty > 0 then
		lv_out := lv_title || ' is Available: ' || to_char(lv_qty) || ' on the shelf';
	Else
		lv_out := lv_title || ' is Not Available';
	END IF;
	return lv_out;
	
	EXCEPTION WHEN NO_DATA_FOUND THEN
		return 'ID not found';
	
END MOVIE_STK;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(MOVIE_STK(1));

END;
/