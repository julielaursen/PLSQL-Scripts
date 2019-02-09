
set Serveroutput On;

DECLARE
	lv_due_date DATE := SYSDATE;
	lv_monthly_payment NUMBER(10,2) := 120.00;
	lv_total_payments NUMBER(10) := 24;
	lv_donation_balance NUMBER(10, 2);

BEGIN
	lv_donation_balance := lv_total_payments * lv_monthly_payment;
	
	WHILE lv_total_payments > 1 LOOP
		lv_total_payments := lv_total_payments - 1;
		lv_donation_balance := lv_donation_balance - lv_monthly_payment;
		lv_due_date := lv_due_date + 30;
		DBMS_OUTPUT.PUT_LINE('Payment Number : ' || lv_total_payments);
		DBMS_OUTPUT.PUT_LINE('Due date : ' || lv_due_date);
		DBMS_OUTPUT.PUT_LINE('Payment amount : ' || lv_monthly_payment);
		DBMS_OUTPUT.PUT_LINE('Donation balance : ' || lv_donation_balance);
		
	END LOOP;




END;
/