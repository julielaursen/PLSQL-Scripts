Set ServerOutput On;

CREATE PACKAGE CITY_JAIL_PKG3 AS
	TYPE gencurtype IS REF CURSOR; 
	PROCEDURE City_Jail_sp3(p_cursor IN OUT gencurtype, choice IN NUMBER);
END CITY_JAIL_PKG3;
/
 
CREATE PACKAGE BODY CITY_JAIL_PKG3 AS 
	PROCEDURE City_Jail_sp3 (p_cursor IN OUT gencurtype, choice IN NUMBER) IS
	 BEGIN   
		IF choice  = 1 THEN 
			Open p_cursor FOR SELECT AVG(COUNT(*)) average FROM crime_officers GROUP BY officer_id;
		ELSIF choice  = 2 THEN
			Open p_cursor FOR SELECT min(fine_amount) FROM crime_charges;
		ELSIF choice  = 3 THEN
			Open p_cursor FOR SELECT crime_id, classification, date_charged, Hearing_date, (hearing_date - date_charged) as days FROM crimes WHERE (hearing_date - date_charged) > 14;
		ELSIF choice  = 4 THEN
			Open p_cursor FOR SELECT c.criminal_id, cr.last, cr.first, cc.crime_code, cc.fine_amount FROM crimes c, criminals cr, crime_charges cc WHERE c.criminal_id = cr.criminal_id and c.crime_id = cc.crime_id;
		ELSIF choice  = 5 THEN
			Open p_cursor FOR SELECT o.last, o.first FROM officers o, crime_officers co, crimes c WHERE c.crime_id = co.crime_id AND o.officer_id = co.officer_id GROUP BY o.last, o.first HAVING COUNT(*)> (SELECT AVG(COUNT(*)) FROM crime_officers GROUP BY officer_id);
		ELSIF choice  = 6 THEN
			Open p_cursor FOR SELECT c.last, c.first FROM criminals c, crimes cr WHERE c.criminal_id = cr.criminal_id GROUP BY c.last, c.first HAVING COUNT(*) < (SELECT AVG(COUNT(*)) FROM crimes GROUP BY criminal_id);	
		END IF;
	END;
END City_Jail_PKG3;	
/
	