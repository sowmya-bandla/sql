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


/*creating table and adding new columns*/

use practice;
show tables;
create table students (stno int primary key, st_name varchar(30), course varchar(20), course_fee int);
insert into students values (101, 'abc', 'da', 100);
insert into students values (102, 'def', 'da', 100);
insert into students values (103, 'ghi', 'ds', 150);
insert into students values (104, 'jkl', 'ds', 150);
insert into students values (105, 'mno', 'ml', 200);
insert into students values (106, 'pqr', 'ml', 200);
select * from students;
alter table students add new_course_fee int;
alter table students add hike_percent int(2);
alter table students modify hike_percent decimal(10,2);
update students set hike_percent = 0.10;
update students set new_course_fee = course_fee * hike_percent;
update students set new_course_fee = course_fee + (course_fee * hike_percent);


#aggregate function

From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

Sample table: orders

ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
70007       948.5       2012-09-10  3005         5002
70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
70003       2480.4      2012-10-10  3009         5003
70012       250.45      2012-06-27  3008         5002
70011       75.29       2012-08-17  3003         5007
70013       3045.6      2012-04-25  3002         5001
     
     select sum(purch_amt) as total_purchase_amount from orders;

write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount
    select avg(purch_amt) as average_purchase_amount from orders;

write a SQL query that counts the number of unique salespeople. Return number of salespeople. 
    select count(distinct salesman_id) from orders;

write a SQL query to determine the number of customers who received at least one grade for their activity. 
    select count(customer_id) from customer
    where grade is not null;

write a SQL query to find the maximum and mininum purchase amount.
    slect max(purch_amt) as max_purch_amt,
            min(purch_amount) as min_purch_amt
            from orders;

write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade
    select city, max(grade) as max_grade from customer
    group by city;

write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 
    select salesman_id, max(purch_amt) as purchase amount 
    from orders 
    where ord_date = '2012-08-17'
    group by salesman_id;

write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
    select customer_id, ord_date, max(purch_amount) 
    from orders
    group by customer_id, ord_date
    having max(purch_amount) > 2000;






