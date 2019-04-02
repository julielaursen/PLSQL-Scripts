--CREATE OR REPLACE PROCEDURE DDCK_SP (payment_amt IN NUMBER, pledge_id IN NUMBER) 
--IS
	--lv_payment_amt DD_Pledge.Pledgeamt%TYPE;
	--lv_pledge_id DD_Pledge.idPledge%TYPE;
--BEGIN
	--SELECT payment	
		--INTO lv_payment_amt
		--FROM DD_Pledge
		--WHERE idPledge = pledge_id;
	--IF payment_amt != lv_payment_amt THEN
		--RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment is ' || DD.Pledge.Pledgeamt || ' should be raised. The ' ||
		--payment_amt || ' should be replaced by the correct payment amount');
	--END IF;
--EXCEPTION	
	--WHEN NO_DATA_FOUND THEN DBMS.OUTPUT.PUT_LINE('No payment information found');
--END DDCK_SP;


set Serveroutput On;

CREATE OR REPLACE PROCEDURE DDCK_SP (pledge_id IN NUMBER, payment_amt OUT NUMBER) 
IS
	CURSOR cur_pledge IS
		SELECT Pledgeamt FROM DD_Pledge WHERE idPledge = pledge_id;
BEGIN
	OPEN cur_pledge;
	IF cur_pledge.Pledgeamt = payment_amount THEN
		DBMS_OUTPUT.put_line('The amount entered is correct');
	ELSE
		RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment is ' || DD.Pledge.Pledgeamt || ' should be raised. The ' ||
		payment_amt || ' should be replaced by the correct payment amount');
	
	END IF;
	CLOSE cur_pledge;
  
EXCEPTION	
	WHEN NO_DATA_FOUND THEN DBMS.OUTPUT.PUT_LINE('No payment information found');
END DDCK_SP;
/
--Anonymouse block
--DECLARE
	--lv_payment_amt := 104;
	--lv_pledge_id := 25;
--BEGIN
	--DDCK_SP(lv_payment_amt, lv_pledge_id);
--END;