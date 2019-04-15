set Serveroutput On;

CREATE OR REPLACE FUNCTION STK_FLAG (MOVIE_QTY, MOVIE_ID )
IS
	CURSOR cur_1 is 
		SELECT movie_id 
		FROM MM_MOVIE 
		WHERE MM_MOVIE.movie_id = MOVIE_ID;
BEGIN
	FOR rec_cur IN cur_1 LOOP
	    IF(movie_qty > 0)
		    RETURN true;
	
END;

DBMS_OUTPUT.PUT_LINE(movie_title || ' is Available: ' || movie_qty || ' on the shelf');
DBMS_OUTPUT.PUT_LINE(movie_title || ' is Not Available');

/