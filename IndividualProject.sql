--display average number of crimes reported
--lowest fine amount assigned to a crime charged, etc.
--14 days between crime and hearing date
--all criminals with crime charged
--full name of officers who've reported more than the average crimes charged
--full name of criminals whove reported less than the average crimes charged

1)
SELECT AVG(COUNT(*)) FROM crime_officers GROUP BY officer_id;
2) 
SELECT min(fine_amount) FROM crime_charges;
3)
 SELECT crime_id, classification, date_charged, Hearing_date, (hearing_date - date_charged) as days FROM crimes WHERE (hearing_date - date_charged) > 14;
4)

SELECT c.criminal_id, cr.last, cr.first, cc.crime_code, cc.fine_amount FROM crimes c, criminals cr, crime_charges cc WHERE c.criminal_id = cr.criminal_id and c.crime_id = cc.crime_id;

5)
 SELECT o.last, o.first FROM officers o, crime_officers co, crimes c WHERE c.crime_id = co.crime_id AND o.officer_id = co.officer_id GROUP BY o.last, o.first HAVING COUNT(*)> (SELECT AVG(COUNT(*)) FROM crime_officers GROUP BY officer_id);
6)
SELECT c.last, c.first FROM criminals c, crimes cr WHERE c.criminal_id = cr.criminal_id GROUP BY c.last, c.first HAVING COUNT(*) < (SELECT AVG(COUNT(*)) FROM crimes GROUP BY criminal_id);	--PROCEDURE city_jail_sp
		--(p_query IN whatever_table_name NUMBER 
--	 
		 
	
--END;
--/
