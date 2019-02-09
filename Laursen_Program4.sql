
set Serveroutput On;

DECLARE
	lv_purchase NUMBER(10, 2);
	lv_rating VARCHAR2(15);

BEGIN
lv_purchase := 600.00;
lv_rating := 'test';

	IF lv_purchase > 500.00 THEN
		lv_rating := 'high';
	ELSIF lv_purchase > 350.00 THEN
		lv_rating := 'medium';
	ELSIF lv_purchase > 250.00 THEN
		lv_rating := 'normal';
	ELSE
		lv_rating := 'low';
	END IF;
		DBMS_OUPUT.PUT_LINE(lv_rating);
END;
/