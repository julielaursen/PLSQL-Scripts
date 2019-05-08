--display average number of crimes reported
--lowest fine amount assigned to a crime charged, etc.
--14 days between crime and hearing date
--all criminals with crime charged
--officers that reported more than an avg number of crimes
1)
SELECT o.last, c.crime_id FROM officers o, crimes c, crime_officers co WHERE c.crime_id = co.crime_id and o.officer_id = co.officer_id;
then select AVG(column) FROM table_name;
2)
select min(fine_amount) from crime_charges;
3)
select cr.crime_ID, cr.classification, cr.date_charged, cr.hearing date, and number of days from crimes cr
between the date charged and the hearing date.

4)
SELECT c.last, cr.crime_id, cc.charge_id FROM criminals c, crimes cr, crime_charges cc WHERE c.criminal_id = cr.criminal_id AND cr.crime_id = cc.crime_id;	
	
5)
select o.last, o. first, c.crime_id from officers o, crime_officer co, crimes c where crimes > avg

6)
select c.last, c.first from criminals c, crimes cr where c.criminal_id = cr.criminal_id and crimes > avg
	--PROCEDURE city_jail_sp
		--(p_query IN whatever_table_name NUMBER 
--	 
		 
	
--END;
--/
