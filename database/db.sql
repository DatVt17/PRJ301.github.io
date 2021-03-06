USE [master]
GO
/****** Object:  Database [RAUCU]    Script Date: 03/22/2022 01:26:35 ******/
CREATE DATABASE [RAUCU] ON  PRIMARY 
( NAME = N'RAUCU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RAUCU.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RAUCU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RAUCU_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RAUCU] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RAUCU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RAUCU] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RAUCU] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RAUCU] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RAUCU] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RAUCU] SET ARITHABORT OFF
GO
ALTER DATABASE [RAUCU] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RAUCU] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [RAUCU] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RAUCU] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RAUCU] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RAUCU] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RAUCU] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RAUCU] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RAUCU] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RAUCU] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RAUCU] SET  DISABLE_BROKER
GO
ALTER DATABASE [RAUCU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RAUCU] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RAUCU] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RAUCU] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RAUCU] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RAUCU] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RAUCU] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RAUCU] SET  READ_WRITE
GO
ALTER DATABASE [RAUCU] SET RECOVERY FULL
GO
ALTER DATABASE [RAUCU] SET  MULTI_USER
GO
ALTER DATABASE [RAUCU] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RAUCU] SET DB_CHAINING OFF
GO
USE [RAUCU]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NULL,
	[password] [nchar](50) NULL,
	[roleID] [int] NOT NULL,
	[address] [nvarchar](100) NULL,
	[birthday] [nchar](20) NULL,
	[phone] [nchar](15) NULL,
	[mail] [nchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[image] [text] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [int] NOT NULL,
	[importDate] [nchar](50) NULL,
	[usingDate] [nchar](50) NULL,
	[user_post] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[orderDate] [nvarchar](50) NULL,
	[total] [float] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 03/22/2022 01:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tblUsers_tblRole]    Script Date: 03/22/2022 01:26:36 ******/
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRole]
GO
/****** Object:  ForeignKey [FK_tblProduct_tblCategory]    Script Date: 03/22/2022 01:26:36 ******/
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
/****** Object:  ForeignKey [FK_tblOrders_tblUsers]    Script Date: 03/22/2022 01:26:36 ******/
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
/****** Object:  ForeignKey [FK_tblOrderDetail_tblOrders]    Script Date: 03/22/2022 01:26:36 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
/****** Object:  ForeignKey [FK_tblOrderDetail_tblProduct]    Script Date: 03/22/2022 01:26:36 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
