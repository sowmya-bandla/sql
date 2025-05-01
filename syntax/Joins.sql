create database IF not exists practice;
use practice;

#creating tables
create table dept(deptno int primary key, deptname varchar(20));
insert into dept values (1, 'IT');
insert into dept values (2, 'HR');
insert into dept values (3, 'Finance');
insert into dept values (4, 'Admin');
insert into dept values (5, 'NOn-Admin');
insert into dept values (6, 'Sales');
insert into dept values (7, 'Marketing');
insert into dept values (8, 'RMG');

create table emp(empid int primary key, 
				 empname varchar(20),
                 salary int(7),
                 deptno int(5),
                 foreign key (deptno) references dept(deptno));
insert into emp values (101,'aa',100,1);
insert into emp values (102,'bb',150,2);
insert into emp values (103,'cc',160,7);
insert into emp values (104,'dd',110,6);
insert into emp values (105,'ee',100,5);
insert into emp values (106,'ff',200,2);
insert into emp values (107,'gg',105,3);

#insert
select * from emp where empid = 107;

#joins
/*innerjoin*/
select e.empid, e.empname, d.deptname, d.deptno from emp e join dept d on e.deptno = d.deptno;

/*leftjoin*/
select e.empid, e.empname, d.deptname, d.deptno from emp e left join dept d on e.deptno = d.deptno;

/*rightjoin*/
select e.empid, e.empname, d.deptname, d.deptno from emp e right join dept d on e.deptno = d.deptno;

/*union*/
select * from emp e 
left join dept d 
on e.deptno = d.deptno
union 
select * from emp e 
right join dept d 
on e.deptno = d.deptno
order by empid;

#DDL

create table population(sno int auto_increment primary key, name varchar(30), dob int, aadharno varchar(15) unique) ;
insert into population values (1, 'abc', 1/2/1990, 'abc0987');
insert into population values (2,'dcr', 1/2/1997, 'dcr0985');
insert into population values (3,'yyr', 1/9/1980, 'yyr09877');
insert into population values (4,'kwa', 1/11/1950, 'kwa0087');
insert into population values (5,'ujc', 1/8/1960, 'ujc5487');

select * from population;
alter table population add gender varchar(10);

update population set gender = 'female' where sno = 1;
update population set gender = 'female' where sno = 2;
update population set gender = 'female' where sno = 3;
update population set gender = 'male' where sno = 4;
update population set gender = 'male' where sno = 5;

alter table population modify dob varchar(10);

alter table population rename column dob to dateofbirth;

alter table population drop column dateofbirth;

update population set aadharno = 'thu7125' where aadharno = 'abc0987';

select * from population
limit 3 offset 3;

#self join
create table empmgr (empid int primary key,
    -> name varchar(20),
    -> mgrid int);
mysql> insert into empmgr values(1,'John',null);
mysql> insert into empmgr values(2,'alex',1);
mysql> insert into empmgr values(3,'Bob',1);
mysql> insert into empmgr values(4,'Naga',2);
select e.name as employee ,m.name as manager from empmgr e left join empmgr m on e.mgrid=m.empid;


From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12
Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005

    select s.name as salesman, c.cust_name, c.city
    from salesman s left join customer c
    on s.salesman_id =c.salesman_id;

From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
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

    select o.ord_no, o.purch_amt, c.cust_name, c.city
    from orders o left join customer c 
    on o.salesman_id = c.salesman_id
    where o.purch_amt between 500 and 2000;

From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

    select c.cust_name, c.city, s.name as salesman, s.commission
    from c.customer join s.salesman
    on c.salesman_id = s.salesman_id;

From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

    select c.cust_name, c.city, s.name as salesman, s.commission
    from customer c join salesman salary
    on c.salesman_id = s.salesman_id
    where s.commission > 0.12 ;

From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  

Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

    select c.cust_name, c.city, s.name as salesman, s.commission
    from customer c join salesman s 
    on c.salesman_id = s.salesman_id
    where s.city <> c.city and s.commission>0.12;

From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
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
....
Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

       select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name as salesman, s.commission 
       from orders o join customer c 
       on o.salesman_id = c.salesman_id 
       join salesman s 
       on c.salesman_id = s.salesman_id;

Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.
    select * from orders o  natural join customer c natural join salesman s ;

From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id
    select c.cust_name, c.city as customer_city, c.grade, s.name as salesman, s.city as salesman_city  
    from customer c left join salesman s 
    on c.salesman_id = s.salesman_id
    order by customer_id;

From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. 
    select c.cust_name, c.city as customer_city, c.grade, s.name as salesman, s.city as salesman_city  
    from customer c left join salesman s 
    on c.salesman_id = s.salesman_id
    where c.grade < 300
    order by customer_id;

Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not
    select c.cust_name as customer_name, c.city, o.ord_no, o.ord_date, o.purch_amt as order_amount
    from orders o right join customer c 
    on o.customer_id = c.customer_id
    order by o.order_date;

Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
    select c.cust_name as customer, s.name as salesman, s.salesman_id
    from customer c right join salesman s 
    on s.salesman_id = c.salesman_id 
    oerderby s.salesman_id;


From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman.
    select c.cust_name, c.city, c.grade, o.ord_no,o.ord_date,o.purch_amt as amount, s.name as salesmen 
    from customer c right join salesman s
    on c.salesman_id = s.salesman_id 
    right join orders o
    on c.customer_id = o.customer_id;

Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
    select s.names as salesmen, s.salesman_id, c.cust_name as customer, c.customer_id, o.ord_no, 0.purch_amt, c.grade 
    from customer c right join salesman s 
    on c.salesman_id = s.salesman_id 
    left join orders o 
    on o.customer_id = c.customer_id 
    where o.purch_amt >= 2000 and c.grade is not null; 

For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
    select c.cust_name as customer_name, c.city, o.ord_no, o.ord_date, o.purch_amt as purchase_amount
    from customers c left join orders o 
    on c.customer_id = o.customer_id ;

Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
    select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt 
    from custoners c outer join orders o 
    on c.customer_id = o.customer_id 
    where c.grade is not null; 

Write a SQL query to combine each row of the salesman table with each row of the customer table.
    select * from salesman s 
    cross join customer c 
    on s.salesman_id = c.salesman_id; 

Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
    select S.name as salesperson, c.cust_name as customer 
    from salesman s cross join customer c 
    where s.city is not null;

Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade
    select S.name as salesperson, c.cust_name as customer 
    from salesman s cross join customer c 
    where s.city is not null and c.grade is not null; 

Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
    select S.name as salesperson, c.cust_name as customer 
    from salesman s cross join customer c 
    where s.city is not null and c.grade is not null and c.city<>s.city; 

From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.
    select * from company_mast c 
    inner join item_mast i 
    on c.com_id = i.pro_com;

Write a SQL query to display the item name, price, and company name of all the products.
    select i.pro_name as item_name, i.pro_price as price, c.com_name as company_name 
    from item_mast i inner join company_mast c 
    on i.pro_com = c.com_id;

From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.
    select average(i.pro_price) as average_value, c.com_name as company 
    from item_mast i join company_mast c 
    on c.com_id = i.pro_com 
    group by c.com_name;

From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name
    select average(i.pro_price) as avg_value, c.com_name 
    from item_mast i join company_mast c 
    on i.pro_com = c.com_name 
    group by c.com_name
    having  average(i.pro_price) >= 350 ;

From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.
    select i.pro_name, i.pro_price, c.com_name 
    from item_mast i join company_mast c 
    on i.pro_com = c.com_name 
    order by i.pro_price desc 
    limit 1;

From the following tables write a SQL query to display all the data of employees including their department.

Sample table: emp_department

DPT_CODE DPT_NAME        DPT_ALLOTMENT
-------- --------------- -------------
      57 IT                      65000
      63 Finance                 15000
      47 HR                     240000
      27 RD                      55000
      89 QC                      75000
Sample table: emp_details

 EMP_IDNO EMP_FNAME       EMP_LNAME         EMP_DEPT
--------- --------------- --------------- ----------
   127323 Michale         Robbin                  57
   526689 Carlos          Snares                  63
   843795 Enric           Dosio                   57
   328717 Jhon            Snares                  63
   444527 Joseph          Dosni                   47
   659831 Zanifer         Emily                   47
   847674 Kuleswar        Sitaraman               57
   748681 Henrey          Gabriel                 47
   555935 Alex            Manuel                  57
    
    select * from emp_details e join emp_department d 
    where e.emp_details = d.dpt_code;

From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.
    select e.emp_fname, e.emp_lname, d.dpt_name, d.dpt_allotmnet as sanction_amount 
    from emp_details e join emp_department d 
    on e.emp_dept = d.dpt_code;

From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.
     select e.emp_fname, e.emp_lname, d.dpt_name
    from emp_details e join emp_department d 
    on e.emp_dept = d.dpt_code
    where d.dpt_allotment > 50000;

From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.
    select d.dpt_name 
    from emp_department d join emp_details e 
    on e.emp_dept = d.dpt_code 
    group by e.emp_dept 
    having by count > 2;


    
