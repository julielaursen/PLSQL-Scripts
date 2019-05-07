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
BEGIN
   FOR basketitem_rec in basketitem_cur LOOP
		UPDATE bb_sales_sum
	    SET total_qty = basketitem_rec.quantity
	    WHERE product_id = basketitem_rec.idbasket;
	END LOOP;
END;
/

 