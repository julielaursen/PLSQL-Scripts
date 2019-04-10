--/***************************************************************/
--  Developer:            Julie Laursen
--
--  Program #:            8
--
--  File Name:            Program 8.sql
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             3/15
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              
--
--  Description:
--     Create a procedure named DDCK_SP that confirms whether a monthly pledge amount is the corect amount
--


set Serveroutput On;

CREATE OR REPLACE PROCEDURE DDCK_SP (pledge_id IN NUMBER, payment_amt IN NUMBER) --DD_Pledge.Pledgeamt%TYPE) 
IS
	CURSOR cur_pledge IS
		SELECT Pledgeamt, Paymonths 
		FROM DD_Pledge 
		WHERE idPledge = pledge_id;
	lv_count number;

BEGIN
	--open cur_pledge;
	lv_count := 0;
	
	FOR rec_purch IN cur_pledge LOOP
		lv_count := lv_count + 1;
		IF rec_purch.Paymonths = 0 THEN	
			IF rec_purch.Pledgeamt = payment_amt THEN
				DBMS_OUTPUT.put_line('The amount entered is correct');
			ELSE
				RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment ' || rec_purch.Pledgeamt || ' should be raised. The ' ||
				payment_amt || ' should be replaced by the correct payment amount');	
			END IF;
		ELSIF (rec_purch.Pledgeamt / rec_purch.Paymonths) = payment_amt THEN	
			DBMS_OUTPUT.put_line('The amount entered is correct');
		ELSE
			RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment ' || (rec_purch.Pledgeamt / rec_purch.Paymonths) || ' should be raised. The ' ||
			payment_amt || ' should be replaced by the correct payment amount');	
	END IF;
	END LOOP;
  
    if (lv_count = 0) then
		RAISE_APPLICATION_ERROR(-20050, 'No payment information found');
	END IF;
	
END DDCK_SP;
/
