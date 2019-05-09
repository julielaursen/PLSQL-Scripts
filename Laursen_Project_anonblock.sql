Set serveroutput on

DECLARE
   p_cur SYS_REFCURSOR;
   
   TYPE type_rec IS RECORD
   (p_crime_id crime_officers.crime_id%TYPE, 
    p_officer_id crime_officers.officer_id%TYPE);
	
	p_rec type_rec;
	average number;
BEGIN
   CITY_JAIL_PKG.City_Jail_sp(1, p_cur);
   fetch p_cur into average;
   dbms_output.put_line(average);

  
END;
/
