Set ServerOutput On;

CREATE OR REPLACE PACKAGE CITY_JAIL_PKG
AS
--TYPE refcur_type IS REF CURSOR;
PROCEDURE City_Jail_sp 
	(p_query IN NUMBER,
	p_cursor IN OUT SYS_REFCURSOR);
	--p_cursor OUT refcur_type);
END;
/
 
CREATE OR REPLACE PACKAGE BODY CITY_JAIL_PKG
AS 
	PROCEDURE City_Jail_sp 
	   (p_query IN NUMBER,
		p_cursor IN OUT SYS_REFCURSOR)
	IS
	 BEGIN   
		IF p_query = 1 THEN 
		-- for rec in loop, then dbms output,then end loop?
			Open p_cursor FOR SELECT AVG(COUNT(*)) average FROM crime_officers GROUP BY officer_id;
			dbms_output.put_line('query 1');
		END IF;		
		-- ELSE IF p_query = 2 THEN
			-- Open p_cursor FOR SELECT min(fine_amount) FROM crime_charges;
		-- END IF;
			-- lv_output := SELECT AVG(COUNT(*)) FROM crime_officers GROUP BY officer_id;
		-- IF lv_query - 2 THEN lv_output := SELECT min(fine_amount) FROM crime_charges;
		-- IF lv_query = 3 THEN lv_output := SELECT crime_id, classification, date_charged, Hearing_date, (hearing_date - date_charged) as days FROM crimes WHERE (hearing_date - date_charged) > 14;
		-- IF lv_query = 4 THEN lv_output := SELECT c.criminal_id, cr.last, cr.first, cc.crime_code, cc.fine_amount FROM crimes c, criminals cr, crime_charges cc WHERE c.criminal_id = cr.criminal_id and c.crime_id = cc.crime_id;
		-- IF lv_query = 5 THEN lv_output := SELECT o.last, o.first FROM officers o, crime_officers co, crimes c WHERE c.crime_id = co.crime_id AND o.officer_id = co.officer_id GROUP BY o.last, o.first HAVING COUNT(*)> (SELECT AVG(COUNT(*)) FROM crime_officers GROUP BY officer_id);
		-- IF lv_query = 6 THEN lv_output := SELECT c.last, c.first FROM criminals c, crimes cr WHERE c.criminal_id = cr.criminal_id GROUP BY c.last, c.first HAVING COUNT(*) < (SELECT AVG(COUNT(*)) FROM crimes GROUP BY criminal_id);	
		-- DBMS_OUTPUT.PUT_LINE(lv_query);
	end;
END;	
/
	