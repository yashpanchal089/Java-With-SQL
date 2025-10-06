create database BankDB;
use BankDb;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts VALUES 
(1, 'Sunny', 5000.00),
(2, 'Yash', 3000.00);

select * from accounts;

start transaction;

INSERT INTO accounts VALUES
(5, 'Ramesh', 12000.00);

commit;

start transaction;

update accounts
set balance = 99999.00
where account_id= 2;

INSERT INTO accounts VALUES
(5, 'Ramesh', 12000.00);

delete from accounts where account_id= 2;

rollback;

savepoint initial;

INSERT INTO accounts VALUES
(6, 'Mukesh', 66000.00);

update accounts
set holder_name = 'DD'
where account_id= 3;

savepoint upd;

rollback to upd;