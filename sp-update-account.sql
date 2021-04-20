--CREATE PROCEDURE updtdemployee     
--      AS
--        BEGIN
--         UPDATE employee 
--         SET status='Y' 
--         WHERE Emp_Code = 2501 or Emp_Code = 2502
--        END

CREATE PROCEDURE UpdateData1
@account_number int,
@branch_name varchar(20)

as
begin
update account
set branch_name = @branch_name
where  account_number = @account_number
end

EXEC UpdateData1 @branch_name='mumbai',
@account_number = 123124;