USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 4/14/2021 5:21:33 PM ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SAMEER\MSSQL\DATA\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SAMEER\MSSQL\DATA\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
/****** Object:  UserDefinedFunction [dbo].[cust_name]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[cust_name](@customer_id int)
returns varchar(20)
as
begin

Declare @returnvalue varchar(20)
select @returnvalue = customer_name from customer
where customer_id = @customer_id
return @returnvalue
end
GO
/****** Object:  UserDefinedFunction [dbo].[Total_Balance]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Total_Balance](
@balance int)
returns int
as
begin
return @balance;
end
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_number] [char](10) NOT NULL,
	[branch_name] [char](15) NULL,
	[balance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Balance]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Balance]
(
       @balance int
)
RETURNS TABLE
AS
RETURN
(
       -- Add the SELECT statement with parameter references here
       SELECT * FROM account WHERE balance >  @balance
)
GO
/****** Object:  Table [dbo].[branch]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branch_name] [char](15) NOT NULL,
	[branch_city] [char](30) NULL,
	[assets] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Assests]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Assests]
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
GO
/****** Object:  UserDefinedFunction [dbo].[AssestsBefore_After]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[AssestsBefore_After]
(
@AssestsAfter AS INT,
@AssestsBefore AS INT
)
RETURNS TABLE
AS
RETURN
SELECT * FROM branch
WHERE assets BETWEEN @AssestsAfter AND @AssestsBefore
GO
/****** Object:  Table [dbo].[customer]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [char](10) NOT NULL,
	[customer_name] [char](30) NULL,
	[customer_address] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[depositor]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depositor](
	[customer_id] [char](10) NULL,
	[account_number] [char](10) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[depositor]  WITH CHECK ADD  CONSTRAINT [account_number] FOREIGN KEY([account_number])
REFERENCES [dbo].[account] ([account_number])
GO
ALTER TABLE [dbo].[depositor] CHECK CONSTRAINT [account_number]
GO
ALTER TABLE [dbo].[depositor]  WITH CHECK ADD  CONSTRAINT [customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[depositor] CHECK CONSTRAINT [customer_id]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (([balance]>=(0)))
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD CHECK  (([assets]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[Account1]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Account1]
AS
SELECT * FROM account
GO;
GO
/****** Object:  StoredProcedure [dbo].[DeleteData]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteData]
@branch_name varchar
as
begin
delete account where branch_name = @branch_name
end
GO
/****** Object:  StoredProcedure [dbo].[InsertData]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertData]

as

begin 

insert into [account] ([account_number],[branch_name],[balance])
values (123124,'karntaka',79886)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertData1]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertData1]
@account_number int,
@branch_name varchar(20),
@balance int
as

begin 

insert into account(account_number,branch_name,balance)
values (@account_number,@branch_name,@balance)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateData]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateData]
@account_number int,
@branch_name varchar(20),
@balance int

as
begin
update account
set branch_name = 'Y'
where branch_name = 'karntaka' or branch_name='karnataka'
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateData1]    Script Date: 4/14/2021 5:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateData1]
@account_number int,
@branch_name varchar(20)

as
begin
update account
set branch_name = @branch_name
where  account_number = @account_number
end
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
