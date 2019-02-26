
set Serveroutput On;

DECLARE
	lv_due_date DATE := SYSDATE;
	lv_monthly_payment NUMBER(10,2) := 120.00;
	lv_total_payments NUMBER(10) := 0;
	lv_donation_balance NUMBER(10, 2);
 

BEGIN
	lv_donation_balance := 24 * lv_monthly_payment;
 
 
     FOR k IN 1..24 LOOP
		lv_total_payments := lv_total_payments + 1;
		lv_donation_balance := lv_donation_balance - lv_monthly_payment;
		lv_due_date := ADD_MONTHS(lv_due_date, 1);
		DBMS_OUTPUT.PUT_LINE('---------------------');
		DBMS_OUTPUT.PUT_LINE('Payment Number : ' || lv_total_payments);
		DBMS_OUTPUT.PUT_LINE('Due date : ' || lv_due_date);
		DBMS_OUTPUT.PUT_LINE('Payment amount : ' || lv_monthly_payment);
		DBMS_OUTPUT.PUT_LINE('Donation balance :' || TO_CHAR(lv_donation_balance, '$9999.99'));
		
	END LOOP;




END;
/