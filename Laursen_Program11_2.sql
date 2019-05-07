Set ServerOutput On;
CREATE OR REPLACE TRIGGER bb_salessum_trg
AFTER UPDATE OF orderplaced ON bb_basket
FOR EACH ROW
WHEN(OLD.orderplaced <> 1 AND NEW.orderplaced = 1)
DECLARE
CURSOR basketitem_cur IS
   SELECT idproduct, total, quantity, orderplaced,
   FROM bb_basket
   WHERE idbasket = :NEW.idbasket;
lv_total_sales NUMBER(8,2);
lv_total_qty NUMBER(8,2);
BEGIN
   FOR basketitem_rec in basketitem_cur LOOP
		IF basketitem_rec.orderplaced = 1 THEN
		  lv_total_qty := lv_total_qty + 1;
		  lv_total_sales = lv_total_sales + 1;
		END IF;
	UPDATE bb_sales_sum
	  SET lv_total_qty = lv_total_qty + 1
	  WHERE product_id = basketitem_rec.idproduct;
	END LOOP;
END;
/

 