CREATE OR REPLACE TRIGGER update_matching_trigger
AFTER INSERT ON transaction
FOR EACH ROW
EXECUTE PROCEDURE update_matching_function();
