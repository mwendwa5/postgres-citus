CREATE TABLE transaction (
    transaction_id BIGSERIAL NOT NULL,
    company_id bigint NOT NULL REFERENCES companies(id),
    transaction_type trxtype,
    matched boolean default false not null,
    other_transaction_id bigint,
    recorded_at timestamp without time zone NOT NULL
)PARTITION BY RANGE (recorded_at);
ALTER TABLE transaction ADD PRIMARY KEY (transaction_id,recorded_at);
ALTER TABLE transaction ADD unique (transaction_id,company_id,recorded_at);
ALTER TABLE transaction
ADD CONSTRAINT other_trx_idx
FOREIGN KEY (other_transaction_id) REFERENCES transaction (transaction_id);
CREATE INDEX trx_idx 
ON transaction (transaction_id,recorded_at,matched,company_id,other_transaction_id);
