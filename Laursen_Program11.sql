--desc user_triggers; select user_name from user_triggers;

CREATE TABLE BB_SALES_SUM (
    product_id VARCHAR2(30);
	total_sales NUMBER(8,2);
	total_qty NUMBER(10);
);

Set ServerOutput On;

-- Create Trigger
CREATE OR REPLACE TRIGGER bb_salessum_trg
AFTER UPDATE OF orderplaced ON bb_basket
FOR EACH ROW
ENABLE
WHEN(NEW.orderplaced = 1)
DECLARE
lv_total_sales NUMBER(8,2);
lv_total_qty NUMBER(8,2);
BEGIN
   IF UPDATING THEN
	  SET lv_total_sales = lv_total_sales + 1;
	  SET lv_total_qty = lv_total_qty + 1;
	  WHERE bb_basket.orderplaced = bb_basket.orderplaced + 1;
END;
/
 
--INSERT INTO BB_SALES_SUM VALUES(14);
--INSERT INTO BB_SALES_SUM VALUES(15);
--INSERT INTO BB_SALES_SUM VALUES(16);
--UPDATE BB_SALES_SUM SET user_name = 'Don King' WHERE user_name = 'John King';
--DELETE FROM BB_SALES_SUM WHERE user_name = 'Don King';

