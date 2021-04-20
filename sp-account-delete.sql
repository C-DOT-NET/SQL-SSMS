create procedure DeleteData
@branch_name varchar
as
begin
delete account where branch_name = @branch_name
end
go

execute DeleteData @branch_name='paris';

select * from account