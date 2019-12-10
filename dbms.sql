DROP TABLE customer;
DROP TABLE Employee;
DROP TABLE Insurance;
DROP TABLE Loans;
DROP TABLE Shares;
DROP TABLE Shareholders;
DROP TABLE Branch;
DROP TABLE ATM;
DROP TABLE Bank;
DROP TABLE Account;
DROP TABLE Cust_has_account;
DROP TABLE Bank_has_s_holders;

CREATE TABLE Customer(c_name varchar(20) NOT NULL,
			c_id varchar(20) PRIMARY KEY, 
			c_acc_number varchar(20) NOT NULL, 
			c_dob varchar(20), 
			c_shareholders_id varchar(20) UNIQUE,
			c_pan_no varchar(20),
			c_address varchar(100) DEFAULT 'Bangalore');

CREATE TABLE Employee(e_name varchar(20) NOT NULL,
			e_type varchar(100), 
			e_salary integer, 
			e_emp_id varchar(20) PRIMARY KEY, 
			e_sh_id varchar(20) UNIQUE, 
			e_cust_id varchar(20),
			CHECK(e_salary>0));

CREATE TABLE Insurance(i_issuing_company varchar(20)  DEFAULT 'HDFC Standard Life',
			 i_type varchar(100), 
			i_premium_pay integer,
			i_term integer, 
			i_policy_no varchar(10) PRIMARY KEY,
			i_custo_id varchar(20),
			CHECK(i_premium_pay>0));

CREATE TABLE Loans(l_account_no varchar(20) PRIMARY KEY,
			l_type varchar(100), 
			l_amount integer, 
			l_term integer, 
			l_rate integer DEFAULT 6,
			l_cust_id varchar(20),
			CHECK(amount>0));

CREATE TABLE Shares(s_number integer PRIMARY KEY,
			s_value integer, 
			s_type varchar(100), 
			s_shold_id integer);

CREATE TABLE Shareholders(sr_id varchar(10) PRIMARY KEY, 
				sr_name varchar(20),
				sr_custt_id varchar(20));

CREATE TABLE Branch(b_id varchar(10) PRIMARY KEY, 
			b_type varchar(100), 
			b_location varchar(40) NOT NULL, 
			b_bank_name varchar(20));

CREATE TABLE ATM(a_id varchar(20) PRIMARY KEY, 
			a_location varchar(20),
			a_cash_amt integer, 
			a_bank_name varchar(20));

CREATE TABLE Bank(bk_name varchar(20),
			bk_type varchar(20),
			bk_head_office varchar(20), 
			bk_branch_id varchar(20) PRIMARY KEY);


CREATE TABLE Account(ac_balance integer, 
			ac_acc_number varchar(40), 
			ac_overdraft integer, 
			ac_customerid varchar(20) PRIMARY KEY);

CREATE TABLE Cust_has_account(c_name varchar(20),
				customer_id varchar(20),
				acc_num varchar(40),
				c_dob varchar(20),
				c_pan_no varchar(20),
				c_address varchar(100), 
				acc_balance integer,
				/*acc_overdraft integer, */
				card_no varchar(20));

CREATE TABLE Bank_has_s_holders(bank_name varchar(20),
				sh_id varchar(20), 
				sh_name varchar(20),
				br_id integer,
				bank_type varchar(100),
				hq varchar(20));

/* For account number, it is a 14 digit number where first 4 digits are branch id, next 3 numbers are type of account(savings-100, current-200), next two numbers are just 00, last 4 numbers are the unique customer id, so follow the same.
for pan number,5th digit is the first name(K for Kiran) and last digit is for last name(K for Kumar). */

INSERT INTO Customer values('Kiran Kumar','001','0001 100 00 10001','12-05-1988','10000','AAAAK1234K','Shanti Nagar,Bangalore');

INSERT INTO Customer values('Rahul Mehta','002','0001 200 00 10002','02-09-1990', '10001','AAAAR1234M','MG Road,Bangalore');

INSERT INTO Customer values('Nandan Mohan','003','0001 100 00 10003','09-12-1984',NULL,'AAAAN1234M','Shanti Nagar,Bangalore');

INSERT INTO Customer values('Lakshana Kolur','004','0002 200 00 004','31-05-1998','10002','AAAAL1234K','BTM,Bangalore');

INSERT INTO Customer values('Mohan Kumar','005','0003 200 00 10005','15-05-1988',NULL,'AAAAM1234K','Banashankari,Bangalore');

INSERT INTO Customer values('Meghana Singh','006','0001 100 00 10006','19-06-1965',NULL,'AAAAK1234K','Richmond Town,Bangalore');

INSERT INTO Customer values('Rajdeep Mamtani','007','0005 100 00 10007','12-06-1996','10003','AAAAR1234M','Kalyan Nagar,Bangalore');

INSERT INTO Customer values('Sonal Singh','008','0008 200 00 10008','02-12-1989','10004','AAAAS1234S','Hebbal,Bangalore');

INSERT INTO Customer values('Jayashree Kumari','009','0006 200 00 10009','12-11-1990','10005','AAAAJ1234K','Kumarswamy Layout,Bangalore');

INSERT INTO Customer values('Abhilasha Somani','010','0006 100 00 10010','01-05-1977','10006','AAAAA1234S','Chandra nagar,Bangalore');

INSERT INTO Customer values('Anukriti Joshi','011','0002 200 00 10011','13-12-1994',NULL,'AAAAA1234J','Koramangala,Bangalore');

INSERT INTO Customer values('Amol Srivatsav','012','0003 100 00 10012','15-01-1993',NULL,'AAAAK1234K','Basavangudi,Bangalore');

INSERT INTO Customer values('Abhimanyu Sarda','013','0004 200 00 10013','08-06-1984','10007','AAAAK1234K','Domlur,Bangalore');

INSERT INTO Customer values('Nayanika Hazarika','014','0007 100 00 10014','12-05-1989','10008','AAAAK1234K','RR Nagar,Bangalore');

INSERT INTO Customer values('Ritrisha Baruah','015','0008 100 00 10015','01-05-1992','10009','AAAAK1234K','Hebbal,Bangalore');

INSERT INTO Customer values('Amol Prakash','016','0007 200 00 10016','12-05-1980','10010','AAAAK1234K','RR nagar,Bangalore');

INSERT INTO Customer values('Kiran Kumar','017','0003 200 00 10017','02-07-1982','10011','AAAAK1234K','Banashankari 3rd Stage,Bangalore');

INSERT INTO Customer values('Mrinal Kumar','018','0006 100 00 10018','11-09-1997','10012','AAAAK1234K','Kumarswamy layout,Bangalore');

INSERT INTO Customer values('Najuk Pincha','019','0001 200 00 10019','12-05-1990',NULL,'AAAAK1234K','Shanti Nagar,Bangalore');

INSERT INTO Customer values('Sowmya Raghavan','020','0005 100 00 10020','29-09-1988','10013','AAAAK1234K','Baiyapanahalli,Bangalore');

INSERT INTO Customer values('Radhika Agarwal','021','0007 200 00 10021','12-05-1988','10014','AAAAK1234K','RR Nagar,Bangalore');

INSERT INTO Customer values('Nayan Mundhra','022','0002 100 00 10022','30-10-1992','10015','AAAAK1234K','Koramangala,Bangalore');

INSERT INTO Customer values('Debojit Agarwal','023','0001 100 00 10023','27-11-1993',NULL,'AAAAK1234K','Richmond Town,Bangalore');


INSERT INTO Employee values('Kiran Kumar','Manager',60000,'001','1000','001');

INSERT INTO Employee values('Rahul Mehta','Vice President',150000,'002','1001','002');

INSERT INTO Employee values('Nandan Mohan','Officer',40000,'003',NULL,'003');

INSERT INTO Employee values('Mohan Kumar','Vice President',150000,'004',NULL,'005');

INSERT INTO Employee values('Jayashree Kumari','Senior Manager',80000,'005','10005','009');

INSERT INTO Employee values('Abhilasha Somani','Assistant Vice President',100000,'006','10006','010');

INSERT INTO Employee values('Amol Srivatsava','Manager',60000,'007',NULL,'012');

INSERT INTO Employee values('Amol Prakash','Clerk',10000,'008','10010','016');

INSERT INTO Employee values('Mrinal Kumar','Officer',40000,'009','10012','018');

INSERT INTO Employee values('Najuk Pincha','Clerk',10000,'010',NULL,'019');

INSERT INTO Employee values('Radhika Agarwal','Officer',40000,'011','10014','021');

INSERT INTO Employee values('Debojit Agarwal','Officer',40000,'012',NULL,'023');



/* type - health,life,motor,term,2-wheeler
issuing company - Birla, LIC, Oriental */

INSERT INTO Insurance values('HDFC Standard Life','Health',2000,5,'001','003');

INSERT INTO Insurance values('LIC','Health',5000,4,'002','005');

INSERT INTO Insurance values('HDFC Standard Life','Motor',2800,3,'003','006');

INSERT INTO Insurance values('Oriental','Life',8000,5,'004','008');

INSERT INTO Insurance values('Birla','Motor',1000,1,'005','010');

INSERT INTO Insurance values('Oriental','Health',6000,7,'006','011');

INSERT INTO Insurance values('HDFC Standard Life','2-Wheeler',5500,1,'007','012');

INSERT INTO Insurance values('HDFC Standard Life','2-Wheeler',5500,1,'098','013');

INSERT INTO Insurance values('HDFC Standard Life','2-Wheeler',5500,1,'099','014');

INSERT INTO Insurance values('Birla','Term',2500,2,'008','018');

INSERT INTO Insurance values('LIC','Life',4000,5,'009','019');

INSERT INTO Insurance values('HDFC Standard Life','2-wheeler',1500,6,'010','021');

INSERT INTO Insurance values('LIC','Health',5000,9,'011','022');




INSERT INTO Loans values('0001 200 00 10002','Equipment',20000,3,5,'002');

INSERT INTO Loans values('0001 100 00 10006','House',100000,5,7,'006');

INSERT INTO Loans values('0005 100 00 10007','Business',200000,7,3,'007');

INSERT INTO Loans values('0008 200 00 10008','House',200000,3,5,'008');

INSERT INTO Loans values('0006 200 00 10009','Equipment',35000,3,3,'009');

INSERT INTO Loans values('0006 100 00 10010','Business',300000,7,7,'010');

INSERT INTO Loans values('0002 200 00 10011','Business',500000,7,9,'011');

INSERT INTO Loans values('0003 100 00 10012','House',600000,5,2,'012');

INSERT INTO Loans values('0009 200 00 10013','Equipment',55000,3,4,'013');

INSERT INTO Loans values('0009 100 00 10014','House',1000000,5,6,'014');

INSERT INTO Loans values('0006 100 00 10018','Business',1500000,7,9,'018');

INSERT INTO Loans values('0001 200 00 10019','Equipment',15000,3,2,'019');

INSERT INTO Loans values('0007 200 00 10021','Business',150000,7,3,'021');

INSERT INTO Loans values('0002 100 00 10022','House',900000,5,8,'022');

INSERT INTO Loans values('0001 100 00 10023','House',150000,5,3,'023');


INSERT INTO Shares values(130,50,'Equity',10000);

INSERT INTO Shares values(100,40,'Equity',10001);

INSERT INTO Shares values(101,40,'Preferrential',10002);

INSERT INTO Shares values(102,40,'Preferrential',10003);

INSERT INTO Shares values(103,40,'Equity',10004);

INSERT INTO Shares values(104,40,'Preferrential',10005);

INSERT INTO Shares values(105,40,'Equity',10006);

INSERT INTO Shares values(106,40,'Preferrential',10007);

INSERT INTO Shares values(107,40,'Preferrential',10008);

INSERT INTO Shares values(108,40,'Equity',10009);

INSERT INTO Shares values(109,40,'Equity',10010);

INSERT INTO Shares values(110,40,'Equity',10011);

INSERT INTO Shares values(111,40,'Preferrential',10012);

INSERT INTO Shares values(112,40,'Preferrential',10013);

INSERT INTO Shares values(113,40,'Preferrential',10014);

INSERT INTO Shares values(114,40,'Equity',10015);

INSERT INTO Shares values(115,40,'Equity',10016);

INSERT INTO Shares values(116,40,'Equity',10017);

INSERT INTO Shares values(117,40,'Preferrential',10018);

INSERT INTO Shares values(118,40,'Equity',10019);

INSERT INTO Shares values(119,40,'Preferrential',10020);

INSERT INTO Shares values(120,40,'Preferrential',10006);

INSERT INTO Shares values(121,40,'Preferrential',10009);

INSERT INTO Shares values(122,40,'Preferrential',10009);

INSERT INTO Shares values(123,40,'Equity',10010);

INSERT INTO Shares values(124,40,'Equity',10010);

INSERT INTO Shares values(125,40,'Preferrential',10011);

INSERT INTO Shares values(126,40,'Preferrential',10012);

INSERT INTO Shares values(127,40,'Equity',10013);

INSERT INTO Shares values(128,40,'Preferrential',10014);

INSERT INTO Shares values(129,40,'Equity',10015);


INSERT INTO Shareholders values('10000','Kiran Kumar', '001');

INSERT INTO Shareholders values('10001','Rahul Mehta', '002');

INSERT INTO Shareholders values('10002','Lakshana Kolur', '004');

INSERT INTO Shareholders values('10003','Rajdeep Mamtani', '007');

INSERT INTO Shareholders values('10004','Sonal Singh', '008');

INSERT INTO Shareholders values('10005','Jayashree Kumari', '009');

INSERT INTO Shareholders values('10006','Abhilasha Somani', '010');

INSERT INTO Shareholders values('10007','Abhimanyu Sarda', '013');

INSERT INTO Shareholders values('10008','Nayanika Hazarika', '014');

INSERT INTO Shareholders values('10009','Ritrisha Baruah', '015');

INSERT INTO Shareholders values('10010','Amol Prakash', '016');

INSERT INTO Shareholders values('10011','Kiran Kumar', '017');

INSERT INTO Shareholders values('10012','Mrinal Kumar', '018');

INSERT INTO Shareholders values('10013','Sowmya Raghavan', '020');

INSERT INTO Shareholders values('10014','Radhika Agarwal', '21');

INSERT INTO Shareholders values('10015','Nayan Mundhra', '22');

INSERT INTO Shareholders values('10016','Kunal Paliwal', NULL);

INSERT INTO Shareholders values('10017','Lalit Gattani', NULL);

INSERT INTO Shareholders values('10018','Ajit Rao', NULL);

INSERT INTO Shareholders values('10019','Sebastian Varghese', NULL);

INSERT INTO Shareholders values('10020','Shakti Ganesan', NULL);





INSERT INTO Branch values('0001','Urban','MG Road','HDFC Bank');

INSERT INTO Branch values('0002','Urban','Koramangala','HDFC Bank');

INSERT INTO Branch values('0003','Rural','Banashankari','Union Bank');

INSERT INTO Branch values('0004','Urban','Indranagar','HDFC Bank');

INSERT INTO Branch values('0005','Urban','Baiyapanahalli','HDFC Bank');

INSERT INTO Branch values('0006','Rural','Kumaraswamy layout','HDFC Bank');

INSERT INTO Branch values('0007','Urban','RR Nagar','HDFC Bank');

INSERT INTO Branch values('0008','Urban','Hebbal','HDFC Bank');

INSERT INTO Branch values('0009','Urban','Banashankari','Union Bank');






INSERT INTO ATM values('A001','Jayanagar',1000000, 'HDFC Bank');

INSERT INTO ATM values('A002','Koramangala',500000, 'HDFC Bank');

INSERT INTO ATM values('A003','Domlur',10000000, 'HDFC Bank');

INSERT INTO ATM values('A004','JP Nagar 6th Phase',2000000, 'HDFC Bank');

INSERT INTO ATM values('A005','Kalyan Nagar',800000, 'HDFC Bank');

INSERT INTO ATM values('A006','Banashankari',750000, 'HDFC Bank');

INSERT INTO ATM values('A007','MG Road',5000000, 'HDFC Bank');

INSERT INTO ATM values('A008','Richmond Town',700000, 'HDFC Bank');

INSERT INTO ATM values('A009','Jayanagar',750000, 'HDFC Bank');

INSERT INTO ATM values('A010','Banashankari',700000, 'HDFC Bank');

INSERT INTO ATM values('A011','Tavrekere',850000, 'HDFC Bank');

INSERT INTO ATM values('A012','BTM',95000, 'HDFC Bank');

INSERT INTO ATM values('A013','Domlur',750000, 'HDFC Bank');

INSERT INTO ATM values('A014','Banashankari',75000, 'HDFC Bank');

INSERT INTO ATM values('A015','Jayanagar',1000000, 'HDFC Bank');

INSERT INTO ATM values('A016','Kalyan Nagar',10000000, 'HDFC Bank');

INSERT INTO ATM values('A017','Koramangala',25000, 'HDFC Bank');

INSERT INTO ATM values('A018','MG Road',250000, 'HDFC Bank');

INSERT INTO ATM values('A020','Richmond Town',600000, 'HDFC Bank');


INSERT INTO Bank values('HDFC Bank','Commercial','Bangalore','0001');
INSERT INTO Bank values('HDFC Bank','Retail','Bangalore','0002');
INSERT INTO Bank values('HDFC Bank','Retail','Bangalore','0003');
INSERT INTO Bank values('HDFC Bank','Commercial','Bangalore','0004');
INSERT INTO Bank values('HDFC Bank','Commercial','Bangalore','0005');
INSERT INTO Bank values('HDFC Bank','Retail','Bangalore','0006');
INSERT INTO Bank values('HDFC Bank','Retail','Bangalore','0007');
INSERT INTO Bank values('HDFC Bank','Commercial','Bangalore','0008');
INSERT INTO Bank values('Union Bank','Commercial','Bangalore','0009');




INSERT INTO Account values(50000,'0001 100 00 10001' , 4000, '001');

INSERT INTO Account values(100000,'0001 200 00 10002' , 4000, '002');

INSERT INTO Account values(500000,'0001 100 00 10003' , 4000, '003');

INSERT INTO Account values(7500,'0002 200 00 10004' , 4000, '004');

INSERT INTO Account values(11000,'0003 200 00 10005' , 4000, '005');

INSERT INTO Account values(9000,'0001 100 00 10006' , 4000, '006');

INSERT INTO Account values(800000,'0005 100 00 10007' , 4000, '007');

INSERT INTO Account values(150000,'0008 200 00 10008' , 4000, '008');

INSERT INTO Account values(5000,'0006 200 00 10009' , 4000, '009');

INSERT INTO Account values(55000,'0006 100 00 10010' , 4000, '010');

INSERT INTO Account values(75000,'0002 200 00 10011' , 4000, '011');

INSERT INTO Account values(55000,'0003 100 00 10012' , 4000, '012');

INSERT INTO Account values(6000,'0004 200 00 10013' , 4000, '013');

INSERT INTO Account values(7500,'0007 100 00 10014' , 4000, '014');

INSERT INTO Account values(10000,'0008 100 00 10015' , 4000, '015');

INSERT INTO Account values(100000,'0007 200 00 10016' , 4000, '016');

INSERT INTO Account values(80000,'0003 200 00 10017' , 4000, '017');

INSERT INTO Account values(90000,'0006 100 00 10018' , 4000, '018');

INSERT INTO Account values(1150000,'0001 200 00 10019' , 4000, '019');

INSERT INTO Account values(950000,'0005 100 00 10020' , 4000, '020');

INSERT INTO Account values(850000,'0007 200 00 10021' , 4000, '021');

INSERT INTO Account values(75000,'0002 100 00 10022' , 4000, '022');

INSERT INTO Account values(50000,'0001 100 00 10023' , 4000, '023');




INSERT INTO Cust_has_account values('Kiran Kumar','001','0001 100 00 10001','12-05-1988','AAAAK1234K','Shanti Nagar,Bangalore',50000,'1234 5678 9012 3456');

INSERT INTO Cust_has_account values('Rahul Mehta','002','0001 200 00 10002','02-09-1990', 'AAAAR1234M','MG Road,Bangalore',100000,'1357 8024 5791 2468');

INSERT INTO Cust_has_account values('Nandan Mohan','003','0001 100 00 10003','09-12-1984','AAAAN1234M','Shanti Nagar,Bangalore',500000,'4321 8765 0912 5933');

INSERT INTO Cust_has_account values('Lakshana Kolur','004','0002 200 00 004','31-05-1998','AAAAL1234K','BTM,Bangalore',7500,'5494 3720 3464 3929');

INSERT INTO Cust_has_account values('Mohan Kumar','005','0003 200 00 10005','15-05-1988','AAAAM1234K','Banashankari,Bangalore',11000,'3456 9464 1299 1938');

INSERT INTO Cust_has_account values('Meghana Singh','006','0001 100 00 10006','19-06-1965','AAAAK1234K','Richmond Town,Bangalore',9000,'4021 6477 1927 1377');

INSERT INTO Cust_has_account values('Rajdeep Mamtani','007','0005 100 00 10007','12-06-1996','AAAAR1234M','Kalyan Nagar,Bangalore',800000,'5490 1277 1388 9500');

INSERT INTO Cust_has_account values('Sonal Singh','008','0008 200 00 10008','02-12-1989','AAAAS1234S','Hebbal,Bangalore',150000,'4563 4616 9085 2763');

INSERT INTO Cust_has_account values('Jayashree Kumari','009','0006 200 00 10009','12-11-1990','AAAAJ1234K','Kumarswamy Layout,Bangalore',5000,'7588 2046 4474 1266');

INSERT INTO Cust_has_account values('Abhilasha Somani','010','0006 100 00 10010','01-05-1977','AAAAA1234S','Chandra nagar,Bangalore',55000,'4569 1287 1300 1363');

INSERT INTO Cust_has_account values('Anukriti Joshi','011','0002 200 00 10011','13-12-1994','AAAAA1234J','Koramangala,Bangalore',75000,'4560 8352 4198 2399');

INSERT INTO Cust_has_account values('Amol Srivatsav','012','0003 100 00 10012','15-01-1993','AAAAK1234K','Basavangudi,Bangalore',55000,'6494 3122 2833 1484');

INSERT INTO Cust_has_account values('Abhimanyu Sarda','013','0004 200 00 10013','08-06-1984','AAAAK1234K','Domlur,Bangalore',6000,'1348 2380 4747 1000');

INSERT INTO Cust_has_account values('Nayanika Hazarika','014','0007 100 00 10014','12-05-1989','AAAAK1234K','RR Nagar,Bangalore',7500,'1111 2222 3333 4444');

INSERT INTO Cust_has_account values('Ritrisha Baruah','015','0008 100 00 10015','01-05-1992','AAAAK1234K','Hebbal,Bangalore',10000,'2786 2444 5253 3255');

INSERT INTO Cust_has_account values('Amol Prakash','016','0007 200 00 10016','12-05-1980','AAAAK1234K','RR nagar,Bangalore',100000,'3555 5677 2456 2345');

INSERT INTO Cust_has_account values('Kiran Kumar','017','0003 200 00 10017','02-07-1982','AAAAK1234K','Banashankari 3rd Stage,Bangalore',80000,'7865 1223 4876 4937');

INSERT INTO Cust_has_account values('Mrinal Kumar','018','0006 100 00 10018','11-09-1997','AAAAK1234K','Kumarswamy layout,Bangalore',90000,'9065 1678 1263 1222');

INSERT INTO Cust_has_account values('Najuk Pincha','019','0001 200 00 10019','12-05-1990','AAAAK1234K','Shanti Nagar,Bangalore',1150000,'8765 0973 2345 4756');

INSERT INTO Cust_has_account values('Sowmya Raghavan','020','0005 100 00 10020','29-09-1988','AAAAK1234K','Baiyapanahalli,Bangalore',950000,'9865 2334 6654 2334');

INSERT INTO Cust_has_account values('Radhika Agarwal','021','0007 200 00 10021','12-05-1988','AAAAK1234K','RR Nagar,Bangalore',850000,'7865 1272 1227 1873');

INSERT INTO Cust_has_account values('Nayan Mundhra','022','0002 100 00 10022','30-10-1992','AAAAK1234K','Koramangala,Bangalore',75000,'6477 3299 3466 3476');

INSERT INTO Cust_has_account values('Debojit Agarwal','023','0001 100 00 10023','27-11-1993','AAAAK1234K','Richmond Town,Bangalore',50000,'2432 3555 3467 3465');


INSERT INTO Bank_has_s_holders values('HDFC Bank','10000','Kiran Kumar',0002,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10001','Rahul Mehta',0005,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10002','Lakshana Kolur',0002,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10003','Rajdeep Mamtani',0001,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10004','Sonal Singh',0008,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10005','Jayashree Kumari',0004,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10006','Abhilasha Somani',0002,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10007','Abhimanyu Sarda',0006,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10008','Nayanika Hazarika',0008,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10009','Ritrisha Baruah',0005,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10010','Amol Prakash',0004,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10011','Kiran Kumar',0007,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10012','Mrinal Kumar',0001,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10013','Sowmya Raghavan',0005,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10014','Radhika Agarwal',0002,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10015','Nayan Mundhra',0006,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10016','Kunal Paliwal',0008,'Commercial','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10017','Lalit Gattani',0006,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10018','Ajit Rao',0007,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10019','Sebastian Varghese',0002,'Retail','Bangalore');

INSERT INTO Bank_has_s_holders values('HDFC Bank','10020','Shakti Ganesan',0005,'Commercial','Bangalore');

Select * from customer;
Select * from employee;
Select * from shares;
Select * from shareholders;
Select * from loans;
Select * from insurance;
Select * from bank;
Select * from branch;
Select * from atm;
Select * from cust_has_account;
Select * from bank_has_s_holders;
Select * from account;

/*Q1)Find all share holders whoose portfolio is worth 
more than 1000 and have a minimum balance of 100000. */

select sh.sr_id
from shareholders as sh,shares as s,customer as c
where sh.sr_name = c.c_name and s.s_value>1000;

/*Q2)Find all customers who are employees and have taken
a loan worth more than 200000.*/

select ac.ac_customerid 
from account as ac,loans as l, employee as e 
where l.l_amount > 200000 and l.l_cust_id = ac.ac_customerid and ac.ac_customerid = e.e_cust_id;



/*Q3)find all banks that have atms with more than 10,00,000 
cash and are located in banashankri.*/

select b.bk_name 
from bank as b,atm as a 
where b.bk_name = a.a_bank_name and a.a_location like 'Banashankari' and a.a_cash_amt > 1000000;


/*Q4)list all share holders who have equity type 
of shares.*/

select sh.sr_name 
from shares as s inner join shareholders as sh 
on sh.sr_id = s.s_shold_id 
where s.s_type like 'Equity';

/* Sample query*/

select employee.e_name
from employee
where e_salary=60000;

/* select all employees of a particular type having salaries>20000*/

select employee.e_type,sum(employee.e_salary)
from employee 
where employee.e_salary > 20000
group by employee.e_type;

/*sorts according to dob,name */

select c_id,c_name, c_dob
from customer
order by c_dob,c_name;

/* Q1 - Lalit */

select e_name
from Employee
where e_cust_id is not NULL and e_sh_id is NULL;

/* Q2 - Lakshana*/

select bk_name from bank where bk_name not in (select a_bank_name from atm);

/*Q3 - Kevin*/

-- select c_name from Customer,Insurance,Loan,Bank,Branch where c_id = i_custo_id and c_id = l_cust_id ;

/* Q4 - Kunal*/

INSERT INTO Employee values('Vishnu Singh','Manager',60000,'013',NULL,NULL);

INSERT INTO Employee values('Ankit KV','Manager',60000,'014',NULL,NULL);

INSERT INTO Employee values('Jayarath','Manager',60000,'015',NULL,NULL);

INSERT INTO Employee values('Sahil Purohit','Manager',60000,'016',NULL,NULL);

INSERT INTO Employee values('Angad Dhupar','Manager',60000,'017',NULL,NULL);

INSERT INTO Employee values('Karthik R','Manager',60000,'018',NULL,NULL);

select e_name from employee where e_type = 'Manager' and e_cust_id is NULL;