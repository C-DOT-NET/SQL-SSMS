create database Bank;

create table customer
(customer_id	char(10),
customer_name	char(30),
customer_address	char(50),
primary key (customer_id)) ;


insert into customer values (100,'sameer','Hubli');
insert into customer values (101,'netra','Belgaum');
insert into customer values (102,'Sai','Vaizag');
insert into customer values (103,'Shrivignesh','Dharmasthala');
insert into customer values (104,'niteesh','Dharwad');
insert into customer values (105,'Rahul','Shivamogga');
insert into customer values (106,'golamma','Hubli');
insert into customer values (107,'Pallavi','Andrapradesh');
insert into customer values (108,'varsha','Hubli');
insert into customer values (109,'kenith','Bangalore');
insert into customer values (110,'aishwarya','Mysore');


select * from customer


-- Creating table for branch

create table branch
(branch_name	char(15),
branch_city	char(30),
assets	integer,
primary key (branch_name),
check (assets >= 0)) ;


-- inserting values to the branch-- 
insert into branch values ('Rajnagar','hubli',1000000);
insert into branch values ('Bagevadi','belgaum',500000);
insert into branch values ('paris','vaizag',100000);
insert into branch values ('kokkad','dharmasthala',450000);
insert into branch values ('courtcirlce','dharwad',550000);
insert into branch values ('vidyanagar','shivamogga',890000);
insert into branch values ('hosur','hubli',105000);
insert into branch values ('nellur','andrapradesh',4560000);
insert into branch values ('electroniccity','bangalore',104500);
insert into branch values ('RRnagar','mysore',4565800);

-- Creating table for account

create table account
(account_number	char(10),
branch_name	char(15),
balance	integer,
primary key (account_number),
check (balance >= 0)) ;


select * from account

-- inserting values to the account

insert into account values(5642866,'rajnagar',465468461);
insert into account values(7894915,'Bagevadi',465468461);
insert into account values(6498455,'paris',465468461);
insert into account values(6464563,'kokkad',465468461);
insert into account values(8456327,'courtcirlce',465468461);
insert into account values(6546456,'vidyanagar',465468461);
insert into account values(6466464,'hosur',465468461);
insert into account values(6546466,'nellur',465468461);
insert into account values(6356466,'electroniccity',465468461);
insert into account values(3123565,'RRnagar',465468461);

-- Creating table for depositor

create table depositor
(customer_id	char(10),
account_number	char(10),
constraint customer_id foreign key(customer_id) references customer(customer_id),
constraint account_number foreign key(account_number) references account(account_number));


-- inserting values to the depositor

insert into depositor values(100,5642866);
insert into depositor values(101,7894915);
insert into depositor values(102,6498455);
insert into depositor values(103,6464563);
insert into depositor values(104,8456327);
insert into depositor values(105,6546456);
insert into depositor values(106,6466464);
insert into depositor values(107,5642866);
insert into depositor values(108,6546466);
insert into depositor values(109,3123565);



select dbo.cust_name(100) as customer_name
 drop database Bank;


 select * from branch