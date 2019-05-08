--display average number of crimes reported
--lowest fine amount assigned to a crime charged, etc.
--14 days between crime and hearing date
--all criminals with crime charged

1)
SELECT o.last, c.crime_id FROM officers o, crimes c, crime_officers co WHERE c.crime_id = co.crime_id and o.officer_id = co.officer_id;
then select AVG(column) FROM table_name;
2)
select min(fine_amount) from crime_charges;
3)
	
4)
SELECT c.last, cr.crime_id, cc.charge_id FROM criminals c, crimes cr, crime_charges cc WHERE c.criminal_id = cr.criminal_id AND cr.crime_id = cc.crime_id;	
	
	--PROCEDURE city_jail_sp
		--(p_query IN whatever_table_name NUMBER 
--	 
		 
	
--END;
--/