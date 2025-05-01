Write a SQL statement that displays all the information about all salespeople
    select * from salespeople;

Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".
    select "This is SQL Exercise, Practice and Solution";

Write a SQL query to display three numbers in three columns. 
    select 1,2,3;

Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 
    select 2+3;

Write an SQL query to display the result of an arithmetic expression
    select 1+6+5-*9;

Write a SQL statement to display specific columns such as names and commissions for all salespeople
    select name, commission from salespeople;

Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
    slect ord_date, salesman_id, ord_no, purch_amt from orders;

[#conecting mysql through command prompy
mysql -u root -p
*passowrd*

#connecting oracle database through command prompt
sqlplus / as sysdba
*to unlock 
alter user hr account unlock;
alter user hr identified by hr;
*to connect
connect hr/hr;
quit
select * from hr/hr
*to show tables
select * from tab;]

From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id
    select distinct salesman_id from orders;

From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city
    select name, city from salesman
    where city = 'paris';  








