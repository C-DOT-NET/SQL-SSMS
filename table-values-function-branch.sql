CREATE FUNCTION Assests
(
       @assets int
)
RETURNS TABLE
AS
RETURN
(
       -- Add the SELECT statement with parameter references here
       SELECT * FROM branch WHERE assets >  @assets
)