--Anonymous block
set Serveroutput On;

--DECLARE
	--lv_payment_amt NUMBER(8);
	--lv_pledge_id NUMBER(5);

BEGIN
	--lv_payment_amt := 104;
	--lv_pledge_id := 25;
	DDCK_SP('Result of DDCK_SP procedure: ' || 104, 25);
END;
/