CREATE PROCEDURE InsertData1
@account_number int,
@branch_name varchar(20),
@balance int
as

begin 

insert into account(account_number,branch_name,balance)
values (@account_number,@branch_name,@balance)
end
go


EXEC InsertData1  @account_number=879768,
@branch_name='delhi',
@balance=46546



select * from account




--CREATE PROCEDURE InsertStoredProcedureFirstExample

--AS
--BEGIN
--	SET NOCOUNT ON;
--	INSERT INTO [EmployeeDup] ([FirstName], [LastName], [Occupation], [YearlyIncome], [Sales])
--	VALUES ('Tutorial', 'Gateway', 'Education', 10000, 200)
--          ,('Imran', 'Khan', 'Skilled Professional', 15900, 100)
--          ,('Doe', 'Lara', 'Management', 15000, 60)
--          ,('Ramesh', 'Kumar', 'Professional', 65000, 630)

--END
--GO