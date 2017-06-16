DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE restaurants;
DROP TABLE days;

CREATE TABLE days
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE restaurants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  address VARCHAR(255)
);

CREATE TABLE burgers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  restaurant_id INT8 REFERENCES restaurants(id)
);

CREATE TABLE deals
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  day_id INT8 REFERENCES days(id)
);