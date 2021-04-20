create FUNCTION AssestsBefore_After
(
@AssestsAfter AS INT,
@AssestsBefore AS INT
)
RETURNS TABLE
AS
RETURN
SELECT * FROM branch
WHERE assets BETWEEN @AssestsAfter AND @AssestsBefore


SELECT
*
FROM
dbo.AssestsBefore_After('4500336', '78021245')
ORDER BY
assets




Declare @customer_id Int = 110;
if @customer_id >=111
print 'passed,congratulations!!';
else 
print 'Failed,Try Again';


