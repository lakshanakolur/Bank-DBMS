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

CREATE TABLE Customer(name varchar(20),
			id varchar(20) PRIMARY KEY, 
			acc_number varchar(20), 
			dob varchar(20), 
			shareholders_id varchar(20),
			pan_no varchar(20),
			address varchar(20));

CREATE TABLE Employee(name varchar(20),
			type varchar(20), 
			salary varchar(20), 
			emp_id varchar(20) PRIMARY KEY, 
			sh_id varchar(20), 
			cust_id varchar(20));

CREATE TABLE Insurance(issuing_company varchar(20),
			 type varchar(20), 
			premium_pay integer,
			term varchar(5), 
			policy_no varchar(10) PRIMARY KEY);

CREATE TABLE Loans(account_no varchar(20) PRIMARY KEY,
			type varchar(20), 
			amount varchar(10), 
			term varchar(5), 
			rate integer,
			cust_id varchar(20));

CREATE TABLE Shares(number integer, 
			value integer, 
			type varchar(10), 
			shold_id integer PRIMARY KEY);

CREATE TABLE Shareholders(id varchar(10) PRIMARY KEY, 
				name varchar(20));

CREATE TABLE Branch(id varchar(10) PRIMARY KEY, 
			type varchar(10), 
			location varchar(40), 
			bank_name varchar(20));

CREATE TABLE ATM(id varchar(20) PRIMARY KEY, 
			location varchar(20),
			cash_amt integer, 
			bank_name varchar(20));

CREATE TABLE Bank(name varchar(20),
			type varchar(20),
			head_office varchar(20), 
			branch_id varchar(20) PRIMARY KEY);

CREATE TABLE Account(balance integer, 
			acc_number integer, 
			overdraft integer, 
			customerid varchar(20) PRIMARY KEY);

CREATE TABLE Cust_has_account(customer_id varchar(20),
				acc_num integer,
				c_name varchar(20),
				c_dob varchar(20),
				c_address varchar(20), 
				c_pan_no varchar(20),
				acc_balance integer,
				acc_overdraft integer, 
				card_no varchar(20));

CREATE TABLE Bank_has_s_holders(bank_name varchar(20),
				sh_id varchar(20), 
				bank_type varchar(20),
				hq varchar(20), 
				sh_name varchar(20));

/* For account number, it is a 14 digit number where first 4 digits are branch id, next 3 numbers are type of account(savings-100, current-200), next two numbers are just 00, last 4 numbers are the unique customer id, so follow the same.
for pan number,5th digit is the first name(K for Kiran) and last digit is for last name(K for Kumar). */

INSERT INTO Customer values('Kiran Kumar','001','0001 100 00 10000','12-05-1988','10000','AAAAK1234K','Shanti Nagar,Bangalore');

/* types of employees - clerk , officer, manager, senior managar, assistant vice president, vice president. */

INSERT INTO Employee values('Anubhuti Shiva','Manager','40,000','AB123','1234','002');

/* type - health,life,motor,term,2-wheeler
issuing company - Birla, LIC, Oriental */

INSERT INTO Insurance values('HDFC Standard Life','Health',2000,'5','1234');

INSERT INTO Loans values('0002 200 00 10450','Equipment','15,000','5',3,'087');

INSERT INTO Shares values(100,40,'Equity',10000);

INSERT INTO Shareholders values('15000','Kunal Paliwal');

INSERT INTO Branch values('0001','Rural','MG Road','HDFC Bank');

INSERT INTO ATM values('A001','Jayanagar',1000000, 'HDFC Bank');

INSERT INTO Bank values('HDFC Bank','Commercial','Bombay','003');

INSERT INTO Account values(50000,0003 200 00 15678 , 4000, '005');

INSERT INTO Cust_has_account values('456',0003 300 00 15008 ,'Jayanth Rai','15-09-1976','KL Road','AAAAJ1454R',90000,5700,'4567');

INSERT INTO Bank_has_s_holders values('HDFC Bank','67890','Commercial','Bombay','Paresh Kesari');
				
