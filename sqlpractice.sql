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


















