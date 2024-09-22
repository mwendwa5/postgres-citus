CREATE OR REPLACE FUNCTION update_matching_function()
RETURNS TRIGGER AS $$
BEGIN
     if EXISTS (SELECT 1 FROM transaction WHERE other_transaction_id = NEW.transaction_id) then 
    UPDATE transaction
    SET matched = true
    WHERE other_transaction_id = NEW.transaction_id;
    RETURN NEW;
    end if;
END;
$$ LANGUAGE plpgsql;
