CREATE DATABASE lab_mysql;
USE lab_mysql;




#drop table cars;
drop table invoices;
drop table customers;
drop table salespersons;

CREATE TABLE cars (ID int, VIN varchar(20), manufacturer varchar(20),model varchar(20),year INT, color varchar(20),
    PRIMARY KEY (VIN)
);

INSERT INTO lab_mysql.cars (ID, VIN, manufacturer, model, year, color)
    VALUES(0, '3K096I98581DHSNUP','Volkswagen','Tiguan', 2019, 'Blue'), (1,'ZM8G7BEUQZ97IH46V','Peugeot', 'Rifter',2019,'Red'), (2,'RKXVNNIHLVVZOUB4M','Ford' ,'Fusion', 2018, 'White'),
    (3,  'HKNDGS7CU31E9Z7JW', 'Toyota','RAV4', 2018, 'Silver'), (4, 'DAM41UDN3CHU2WVF6','Volvo', 'V60',2019,'Gray');
;

select * from lab_mysql.cars;

CREATE TABLE invoices (ID int,
invoice_id int NOT NULL AUTO_INCREMENT, PRIMARY KEY (invoice_id), date INT, VIN varchar(20), customer_id INT, staff_id INT)
;

INSERT INTO lab_mysql.invoices (ID, invoice_id, date, VIN, customer_id, staff_id)
    VALUES(0,852399038,22-08-2018,	0,	1,	3), (1,	731166526,	31-12-2018,	3,	0,	5), (2,	271135104,	22-01-2019,	2,	2,	7)
;
    
    select * from lab_mysql.invoices;

create table customers (id int, customer_id int NOT NULL AUTO_INCREMENT, name varchar(30), phone_number varchar(30), address varchar(40), city varchar(20),  state varchar(20), country varchar(20), zip INT, PRIMARY KEY (customer_id))
;

INSERT INTO lab_mysql.customers (id,customer_id,name, phone_number, address, city, country, state, zip)
    VALUES
     (0,10001,'Pablo Picasso','+34 636 17 63 82','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045)
    , (1, 20001,'Abraham Lincoln','+1 305 907 7086','120 SW 8th St','Miami','Florida','	United States',	33130)
    , (2,	30001,'	Napoléon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée','Paris','Île-de-France','France',75008);

select * from lab_mysql.customers;

create table salespersons (ID int, staff_id int NOT NULL AUTO_INCREMENT, PRIMARY KEY (staff_id), name varchar(20), store varchar(20));

INSERT INTO lab_mysql.salespersons (ID, staff_id, name, store)
    VALUES(0,	00001,	'Petey Cruiser',	'Madrid'),
(1,	00002,	'Anna Sthesia',	'Barcelona'),
(2,	00003,	'Paul Molive',	'Berlin'),
(3,	00004,	'Gail Forcewind',	'Paris'),
(4,	00005,	'Paige Turner',	'Mimia'),
(5,	00006,	'Bob Frapples',	'Mexico City'),
(6,	00007,	'Walter Melon',	'Amsterdam'),
(7,	00008,	'Shonda Leer',	'São Paulo')
;

select * from lab_mysql.salespersons;


