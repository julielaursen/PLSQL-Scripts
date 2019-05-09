Set serveroutput on

DECLARE
   p_cur SYS_REFCURSOR;
   
   TYPE type_rec IS RECORD
   (p_crime_id crime_officers.crime_id%TYPE, 
    p_officer_id crime_officers.officer_id%TYPE,
	p_classification crimes.classification%TYPE,
	p_date_charged crimes.date_charged%TYPE,
	p_hearing_date crimes.hearing_date%TYPE,
	p_days crimes.hearing_date%TYPE);
	
	p_rec type_rec;
	output number;
	
BEGIN


	CITY_JAIL_PKG.City_Jail_sp(1, p_cur);
	fetch p_cur into output;
	dbms_output.put_line(output);

	CITY_JAIL_PKG.City_Jail_sp(2, p_cur);
    fetch p_cur into output;
    dbms_output.put_line(output);
	
	--CITY_JAIL_PKG.City_Jail_sp(3, p_cur);
    --fetch p_cur into output;
    --dbms_output.put_line(p_crime_id, p_classification, p_date_charged, p_hearing_date, p_days);
  
END;
/
