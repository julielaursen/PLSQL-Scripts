set server output;

DECLARE

   lv_first_block VARCHAR2(50) := 'This is my first PL/SQL Block';
   lv_second_block VARCHAR2(50) := 'Today''s date is ';
   lv_date DATE := SYSDATE;
   
BEGIN

   DBMS_OUTPUT.PUT_LINE(lv_first_block);
   DBMS_OUTPUT.PUT_LINE(lv_second_block || lv_date);
    
END;
/