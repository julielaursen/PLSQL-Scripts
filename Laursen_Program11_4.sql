Set ServerOutput On;
CREATE OR REPLACE TRIGGER bb_salessum_trg
AFTER UPDATE OF orderplaced ON bb_basket
FOR EACH ROW
WHEN(OLD.orderplaced <> 1 AND NEW.orderplaced = 1)
DECLARE
CURSOR basketitem_cur IS
   SELECT idbasket, total, quantity, orderplaced
   FROM bb_basket
   WHERE idbasket=:NEW.idbasket;
 lv_new_num NUMBER(8,2);
BEGIN
   FOR basketitem_rec in basketitem_cur LOOP
	IF basketitem_rec.orderplaced = 1 THEN 
	    lv_new_num := 1;
	END IF;
		UPDATE bb_sales_sum
	    SET total_qty = lv_new_num 
	    WHERE product_id = basketitem_rec.idbasket;
	END LOOP;
END;
/

 