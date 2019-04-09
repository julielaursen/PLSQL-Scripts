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

BEGIN
	FOR rec_purch IN cur_pledge LOOP
		DBMS_OUTPUT.put_line('Pledge amount / monthly payments is' || rec_purch.Pledgeamt / rec_purch.Paymonths);
		IF (rec_purch.Pledgeamt / rec_purch.Paymonths) = payment_amt THEN
			DBMS_OUTPUT.put_line('The amount entered is correct');
		ELSE
			RAISE_APPLICATION_ERROR(-20050, 'Incorrect payment amount -- planned payment is ' || (rec_purch.Pledgeamt / rec_purch.Paymonths) || ' should be raised. The ' ||
			payment_amt || ' should be replaced by the correct payment amount');
	
	END IF;
	END LOOP;
  
EXCEPTION	
	WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('No payment information found');
END DDCK_SP;
/
