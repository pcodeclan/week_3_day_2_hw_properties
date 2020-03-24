DROP TABLE IF EXISTS properties_table;

CREATE TABLE properties_table (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  value INT,
  num_rooms INT,
  year_built INT
);
