Set serveroutput on

DECLARE
   p_cur CITY_JAIL_PKG3.gencurtype;
   output number;
   
   p_rec1 crimes%rowtype;
   p_rec2 crime_officers%rowtype;
   p_rec3 officers%rowtype;
   
   type type3 is record
   (
		id crimes.crime_id%type,
		class crimes.classification%type,
		charged crimes.date_charged%type,
		Hearing crimes.Hearing_date%type,
		calc_date number--crimes.Hearing_date%type
   );
	rec3 type3;
	
	type type4 is record(
		id crimes.criminal_id%type, 
		last criminals.last%type, 
		first criminals.first%type, 
		code crime_charges.crime_code%type, 
		fine crime_charges.fine_amount%type
	);
	rec4 type4;
	
	type nametype is record(
		last criminals.last%type, 
		first criminals.first%type
	);
	
	firstLast nametype;
BEGIN

  	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 1);
	    dbms_output.put_line('AVG(COUNT(*))');
		fetch p_cur into output;
		dbms_output.put_line(output);
	
	dbms_output.put_line('==========================');
	
	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 2);
		dbms_output.put_line('MIN(FINE_AMOUNT)');
		fetch p_cur into output;
		dbms_output.put_line(output);
		
	dbms_output.put_line('==========================');
	
	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 3);
	    dbms_output.put_line('CRIME_ID' || ' ' || 'C' || ' ' || 'DATE_CHAR' || ' '|| 'HEARING_D' || ' '|| 'DAYS');
    LOOP
		fetch p_cur into rec3;
		EXIT WHEN p_cur%NOTFOUND;
		dbms_output.put_line(rec3.id || '  ' || rec3.class || '  ' || rec3.charged || '  '|| rec3.Hearing || '  '|| rec3.calc_date);
	end loop;
	
	dbms_output.put_line('==========================');
	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 4);
		dbms_output.put_line('CRIMINAL_ID' || '  ' || 'LAST          ' || 'FIRST    ' || 'CRIME CODE' || ' ' || 'FINE AMOUNT');
    LOOP
		fetch p_cur into rec4;
		EXIT WHEN p_cur%NOTFOUND;
		dbms_output.put_line( rec4.id || '        ' || rec4.last || '         ' || rec4.first || '        ' ||  rec4.code  || '     ' || rec4.fine);
	end loop;
	
	dbms_output.put_line('==========================');
	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 5);
		dbms_output.put_line('LAST' || '   ' || 'FIRST'); 
    LOOP
		fetch p_cur into firstLast;
		EXIT WHEN p_cur%NOTFOUND;
		dbms_output.put_line(firstLast.last || '  ' || firstLast.first);
	end loop;
	
	dbms_output.put_line('==========================');
	CITY_JAIL_PKG3.City_Jail_sp3(p_cur, 6);
	dbms_output.put_line('LAST' || '     ' || 'FIRST'); 
    LOOP
		fetch p_cur into firstLast;
		EXIT WHEN p_cur%NOTFOUND;
		dbms_output.put_line(firstLast.last || '     ' ||  firstLast.first);
	end loop;
END;
/

