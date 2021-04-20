create function dbo.cust_name(@customer_id int)
returns varchar(20)
as
begin

Declare @returnvalue varchar(20)
select @returnvalue = customer_name from customer
where customer_id = @customer_id
return @returnvalue
end

