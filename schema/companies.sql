CREATE TABLE companies (
    id SERIAL NOT NULL,
    name varchar(100) NOT NULL,
    country INTEGER NOT NULL REFERENCES countries(id),
    address  text,
    zipcode text,
    industry_type INTEGER NOT NULL REFERENCES industry_types(id)
);
ALTER TABLE companies ADD PRIMARY KEY (id);
