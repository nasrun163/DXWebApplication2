USE [master]
GO
/****** Object:  Database [DARMEX AGRO]    Script Date: 05/02/2021 11:53:59 ******/
CREATE DATABASE [DARMEX AGRO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DARMEX AGRO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DARMEX AGRO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DARMEX AGRO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DARMEX AGRO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DARMEX AGRO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DARMEX AGRO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DARMEX AGRO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DARMEX AGRO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DARMEX AGRO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DARMEX AGRO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DARMEX AGRO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET RECOVERY FULL 
GO
ALTER DATABASE [DARMEX AGRO] SET  MULTI_USER 
GO
ALTER DATABASE [DARMEX AGRO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DARMEX AGRO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DARMEX AGRO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DARMEX AGRO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DARMEX AGRO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DARMEX AGRO', N'ON'
GO
ALTER DATABASE [DARMEX AGRO] SET QUERY_STORE = OFF
GO
USE [DARMEX AGRO]
GO
/****** Object:  Table [dbo].[table_costumer]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_costumer](
	[costumer_id] [int] IDENTITY(1,1) NOT NULL,
	[costumer_name] [varchar](100) NOT NULL,
	[address] [varchar](500) NULL,
 CONSTRAINT [PK_table_costumer] PRIMARY KEY CLUSTERED 
(
	[costumer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_produk]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_produk](
	[produk_id] [int] IDENTITY(1,1) NOT NULL,
	[produk_name] [varchar](100) NULL,
 CONSTRAINT [PK_table_produk] PRIMARY KEY CLUSTERED 
(
	[produk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_produk_detail]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_produk_detail](
	[produk_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[produk_id] [int] NOT NULL,
	[produk_detail_name] [varchar](100) NULL,
	[price_per_item] [decimal](18, 0) NULL,
	[discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_table_produk_detail] PRIMARY KEY CLUSTERED 
(
	[produk_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_transaksi]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_transaksi](
	[transaksi_id] [int] IDENTITY(1,1) NOT NULL,
	[produk_detail_id] [int] NULL,
	[costumer_id] [int] NULL,
	[tanggal] [date] NULL,
	[qty] [int] NULL,
 CONSTRAINT [PK_table_transaksi] PRIMARY KEY CLUSTERED 
(
	[transaksi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_user]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[password] [varchar](100) NULL,
 CONSTRAINT [PK_table_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[table_produk_detail]  WITH CHECK ADD  CONSTRAINT [FK_table_produk_detail_table_produk] FOREIGN KEY([produk_id])
REFERENCES [dbo].[table_produk] ([produk_id])
GO
ALTER TABLE [dbo].[table_produk_detail] CHECK CONSTRAINT [FK_table_produk_detail_table_produk]
GO
ALTER TABLE [dbo].[table_transaksi]  WITH CHECK ADD  CONSTRAINT [FK_table_transaksi_table_costumer] FOREIGN KEY([costumer_id])
REFERENCES [dbo].[table_costumer] ([costumer_id])
GO
ALTER TABLE [dbo].[table_transaksi] CHECK CONSTRAINT [FK_table_transaksi_table_costumer]
GO
ALTER TABLE [dbo].[table_transaksi]  WITH CHECK ADD  CONSTRAINT [FK_table_transaksi_table_produk_detail] FOREIGN KEY([produk_detail_id])
REFERENCES [dbo].[table_produk_detail] ([produk_detail_id])
GO
ALTER TABLE [dbo].[table_transaksi] CHECK CONSTRAINT [FK_table_transaksi_table_produk_detail]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllTransaksi]    Script Date: 05/02/2021 11:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SelectAllTransaksi] @transaksi_id int
AS
IF NULLIF(@transaksi_id, '') IS NULL
BEGIN
SELECT a.transaksi_id,a.transaksi_id as Id,b.costumer_id, b.costumer_name,b.address,d.produk_id,d.produk_name,c.produk_detail_id,c.produk_detail_name,a.qty,
(c.price_per_item * c.discount) AS harga_per_item,(c.price_per_item * c.discount) * a.qty AS hargatotal , a.tanggal
FROM table_transaksi a
JOIN table_costumer b ON a.costumer_id = b.costumer_id
JOIN table_produk_detail c ON a.produk_detail_id = c.produk_detail_id
JOIN table_produk d ON c.produk_id = d.produk_id
END
ELSE
BEGIN
SELECT a.transaksi_id,a.transaksi_id as Id,b.costumer_id, b.costumer_name,b.address,d.produk_id,d.produk_name,c.produk_detail_id,c.produk_detail_name,a.qty,
(c.price_per_item * c.discount) AS harga_per_item,(c.price_per_item * c.discount) * a.qty AS hargatotal , a.tanggal
FROM table_transaksi a
JOIN table_costumer b ON a.costumer_id = b.costumer_id
JOIN table_produk_detail c ON a.produk_detail_id = c.produk_detail_id
JOIN table_produk d ON c.produk_id = d.produk_id
where a.transaksi_id = @transaksi_id
END
GO
USE [master]
GO
ALTER DATABASE [DARMEX AGRO] SET  READ_WRITE 
GO
