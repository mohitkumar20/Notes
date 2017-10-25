#create table
create database testDB;

#delete table
drop database abc;

#using a database.
-- dont use database keyword here.
use testDB; 

#create table
create table customer(id int,name varchar(255),city varchar(255)); #varchar(255) means characters will be used as much are required and maximum value can be 255.

#delete table
drop table customer


-- "Alter table" statement is used to add delete or modify columns. it is also used to add and drop constraints on a existing table.

# add a column
#alter table <table name> add <column name> <column definition>
alter table customer add state varchar(255); # there is no column keyword after add. 

#drop a column
alter table customer drop column state; #after drop column keyword is used.


#modify a column
#alter table <table> modify column <column> <new definition>
alter table customer modify column name varchar(20);

-- Commonly used constraints
/*
not null
unique
primary key
foreign key - uniquely identifies a row in another table.
check - ensure that all values in a column satisfies some condition
default - sets a default value for a column when no value is specified
index - use to create and retrieve data from the database very quickly
*/

# modified the customer table and added not null constraint on id column
alter table customer modify column id int not null;

insert into customer values (1,"mohit","thane","maharashtra");

insert into customer values(2,"pandey","chadigarh","Chandigarh");

insert into customer values (3,"pb",null,null); #null value can be entered as they are not not-nullable

delete from customer where id = 3;

desc customer;

use testDB;

alter table customer modify column city varchar(255) not null; #modifying and adding a constraint

alter table customer add constraint unique_id unique(id); #modifying and adding a named constraint

alter table customer drop index unique_id; # when dropping a constraint, instead of using constraint as keyword, index keyword is used

alter table customer add last_name varchar(255) unique;

alter table customer drop index last_name;

#unique fields allow insertion of null values
insert into customer values(23,"deba","guwahati","assam",null);

/*
					NOTE : 
                    equating a expression to null will give error. eg: where last_name = null
                    instead write like this : where last_name is null
*/

/*
			drop a unique constraint if it is not a named constraint
            

A unique constraint is also an index.

First use SHOW INDEX FROM tbl_name to find out the name of the index. The name of the index is stored in the column called key_name in the results of that query.

Then you can use DROP INDEX:

DROP INDEX index_name ON tbl_name

or the ALTER TABLE syntax:

ALTER TABLE tbl_name DROP INDEX index_name


*/
alter table customer drop index last_name;
update customer set last_name="NO SIR NAME" where last_name is null; # updating a row . 
update customer set last_name = null where name="mohit";


show create table customer;

show index from customer;

select * from customer;


use testDB;
describe customer;

drop table person;


create table person (id int not null,first_name varchar(255) not null, primary key(id));

desc person;

alter table person modify column id int not null;

show index from  person;

alter table person modify first_name varchar(255) not null unique;

alter table person drop primary key; # to delete a primary key.

alter table person add constraint pk primary key(id);

desc person;

alter table person modify column first_name varchar(255); #if you want to drop a not null constraint which is not named, just modify the column without giving not null in definition

/*

while modifying a column, you need to give the complete definition again. example if your column had default value then u need to give it in 
modify query as well or it will be lost.

*/

#adding not null constraint on a already created table is different from other constraints.
#we dont add the constraint here but we modify the column to have not null in its definition.

alter table person modify column first_name varchar(255) not null;

drop table person;

create table persons (person_id int not null auto_increment, # if you want the primary key to be auto_incremented, use like this.
last_name varchar(255) not null,
first_name varchar(255) not null,
age int not null,
primary key(person_id));

drop table persons;
desc persons;

insert into persons values(1,"hansen","ola",30);

insert into persons (last_name,first_name,age) values ("sven","Tove",23);

insert into persons (last_name,first_name,age) values ("petterson","kari",20);

select * from persons;

#------------------------------------------------foreign key-----------------------------------
create table orders(order_id int not null auto_increment, #adding a foreign key constraint.
orderNumber int not null,
person_id int,
primary key(order_id),
foreign key (person_id) references persons(person_id));


desc orders;

select * from persons;

insert into orders (orderNumber,person_id) values (1,1);#will only insert if value of person_id is there in the persons table as primary key.

alter table orders modify column orderNumber int not null unique;

delete from orders where order_id = 3;

select * from orders;

insert into orders (orderNumber,person_id) values (1,2);

show index from orders;

alter table orders ;

drop table orders;

create table orders(order_id int not null auto_increment, #adding a named foreign key constraint.
orderNumber int not null,
person_id int,
primary key(order_id),
constraint fk foreign key (person_id) references persons(person_id));


alter table orders drop column orderNumber; # dropping a column


alter table orders drop foreign key fk; #dropping foreign key


#----------------------------foreign key-----------------------------------------------------------

/*
only one auto_increment column can be there in a table and it must be primary key.

*/

#---------------------------check constraint------------------------------

#NOTE : you can define check constraint in mysql but they are completey ignored.
drop table persons;

create table persons(
id int auto_increment,
person_name varchar(255) not null,
age int not null,
country varchar(255) not null,
constraint pk primary key(id),
constraint chk check(age>=18));

insert into persons (person_name,age,country) values('mohit',19,'india');
insert into persons (person_name,age,country) values('pb',14,'india');

select * from persons;

#---------------------------------------------------------------------------

drop table persons;

create table persons(
id int auto_increment,
person_name varchar(255) not null,
age int not null,
country varchar(255) not null default 'india',
constraint pk primary key (id));


#--------------------SQL QUERIES ------------------
use testDB;
drop table customer;

create table customer(
id int auto_increment,
cus_name varchar(255) not null,
contact_name varchar(255) not null,
address varchar(255) not null,
city varchar(255) not null,
postalcode varchar(255) not null,
country varchar(255) not null,
constraint primary key(id));

alter table customer change postalcode postal_code varchar(255) not null; # renaming a column;

desc customer;

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Alfreds Futterkiste","Maria Anders","Obere Str. 57","Berlin","12209","Germany");

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Ana Trujillo ","Ana Trujillo","Avda. de la Constitución 2222","México","05021","Mexico");

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Ana Trujillo ","Ana Trujillo","Avda. de la Constitución 2222","chicago","05021","Mexico");

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Antonio Moreno","Antonio Moreno","Mataderos 2312","México ","05023","Mexico");

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Around the Horn","Thomas Hardy","120 Hanover Sq.","London","WA1 1DP","UK");

insert into customer (cus_name,contact_name,address,city,postal_code,country) values ("Berglunds snabbköp","Christina Berglund","Berguvsvägen 8","Luleå","S-958 22","Sweden");


select * from customer;

#distinct
select distinct city,country from customer;

select count(distinct country) from customer;

select * from customer where country = 'germany' and city = 'berlin'; # NOTE : i think the search is case-insensitive as in the table 'Germany' is stored, not 'germany'

select * from customer where not country = 'germany';

select * from customer where country = 'germany' and (city = 'berlin' or city = 'munchen');

select * from customer order by country;

select * from customer order by country desc;

select * from customer order by contact_name ,city;

select * from customer order by contact_name ,city desc;

drop table persons;

create table persons(
id int auto_increment,
last_name varchar(255) not null,
first_name varchar(255) not null,
address varchar(255),
city varchar(255),
constraint pk primary key(id));

insert into persons(last_name,first_name,address,city) values ('doe','john','542 W. 27th Street'," 	New York");

insert into persons(last_name,first_name,city) values ('bloggs','joe','london');

insert into persons(last_name,first_name,city) values ('roe','jane','new york');

insert into persons(last_name,first_name,address,city) values ('smith','john','110 Bishopsgate','london');

select * from persons;

select * from persons where address is null;

select * from persons where address is not null;

update persons set first_name = 'mohit' where id = 1; #update


delete from persons where id = 1;

/*
delete all records from a table

delete * from persons;

*/

select distinct last_name from persons limit 2;

select distinct last_name from persons order by last_name  limit 2;


select min(last_name) as smallest_name from persons;

select * from persons;

select * from persons where last_name like 'r%';

select * from persons where last_name like '%o%';

select * from persons where last_name not like '%o%';

create table countries (
id int auto_increment,
country varchar(255) not null,
constraint pk primary key(id));

insert into countries (country) values ('france');

delete from countries where country = 'germanry';

select * from countries;

select * from customer where country in (select country from countries);

create table person_db (
id int auto_increment,
person_name varchar(255) not null,
age int not null,
constraint pk primary key(id));

insert into person_db (person_name,age) values ('congo',25);

select * from person_db;

select * from person_db where age between 16 and 20; #between is inclusive of upper and lower limit.alter

select concat_ws(',',person_name,age) as person from person_db;

select * from person_db as person;

/*
		example of table aliases
	
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID;

this is same as 

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName="Around the Horn" AND Customers.CustomerID=Orders.CustomerID;

*/

/* use the sample db classicmodels from url : http://www.mysqltutorial.org/how-to-load-sample-database-into-mysql-database-server.aspx*/
use classicmodels;

show tables;

desc customers;

select count(distinct state) from customers;

create table random_table(
id int,
order_date date);

drop table random_table;

desc orders;

select orders.orderNumber,customers.customerName from orders inner join customers on orders.customerNumber = customers.customerNumber;

select o.orderNumber, c.customerName from orders as o inner join customers as  c on o.customerNumber = c.customerNumber;

#the above 2 queries are same but in the second one i have used table aliases to make the query shorter


select c.customerName , o.orderNumber , d.productCode from orders as o inner join customers as c on o.customerNumber = c.customerNumber inner join orderdetails as d on d.orderNumber = o.orderNumber;

select  c.customerName , o.orderNumber , d.productCode from orders as o inner join customers as c on o.customerNumber = c.customerNumber inner join orderdetails as d on d.orderNumber = o.orderNumber order by c.customerName;


(select * from orders as o inner join orderdetails as d on o.orderNumber = d.orderNumber);

select distinct city from customers;

select t1.customerName as c1 , t2.customerName as c2 , t2.city as city from customers t1,customers t2 where t1.city = t2.city;

select city, count(city) as city_count from customers group by city order by city_count desc; #group by


select count(distinct city) from customers;

use classicmodels;

#by default union returns distint values. if u want all values use union all operator.
select city from offices
union
select city from customers;


select city from offices
union all
select city from customers;

select 'office' as type,city from offices
union
select 'customers',city from customers order by city;


select city from offices
union
select city from customers;

select country from customers;

select city from offices
union
select city from customers
where country = 'usa'
order by city;


select country ,count(country) as customer_count from customers group by country order by customer_count desc;

select country,count(customerNumber) as customer_count from customers group by country order by customer_count desc;

select c.state,count(c.customerNumber) as count_of_orders_from_state from customers as c inner join orders as o on c.customerNumber = o.customerNumber group by c.state;

#whenever you want condition on aggregate functions, use having clause instead of where clause
select c.state,count(c.customerNumber) as count_of_orders_from_state from customers as c inner join orders as o on c.customerNumber = o.customerNumber group by c.state having count_of_orders_from_state > 10 ;

select state from customers;
