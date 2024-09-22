CREATE VIEW transactions AS
SELECT transaction_id, recorded_at, matched, company_id, other_transaction_id
FROM transaction
WHERE other_transaction_id is not null;
