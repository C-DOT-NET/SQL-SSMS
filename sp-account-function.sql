create function Total_Balance(
@balance int)
returns int
as
begin
return sum(@balance);
end



