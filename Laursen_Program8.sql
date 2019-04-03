
set Serveroutput On;

CREATE OR REPLACE PROCEDURE DDCK_SP (pledge_id IN NUMBER, payment_amt OUT NUMBER) 
IS
	CURSOR cur_pledge IS
		SELECT Pledgeamt 
		FROM DD_Pledge 
		WHERE idPledge = pledge_id;
BEGIN
	FOR rec_purch IN cur_pledge LOOP
		IF rec_purch.Pledgeamt = payment_amt THEN
			DBMS_OUTPUT.put_line('The amount entered is correct');
		ELSE
			RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment is ' || rec_purch.Pledgeamt || ' should be raised. The ' ||
			payment_amt || ' should be replaced by the correct payment amount');
	
	END IF;
	END LOOP;
  
EXCEPTION	
	WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('No payment information found');
END DDCK_SP;
/
