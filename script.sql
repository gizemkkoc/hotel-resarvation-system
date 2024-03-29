USE [master]
GO
/****** Object:  Database [HotelManagamentSystemDb]    Script Date: 21.12.2023 13:33:33 ******/
CREATE DATABASE [HotelManagamentSystemDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelManagamentSystemDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERE\MSSQL\DATA\HotelManagamentSystemDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelManagamentSystemDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERE\MSSQL\DATA\HotelManagamentSystemDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelManagamentSystemDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManagamentSystemDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManagamentSystemDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelManagamentSystemDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelManagamentSystemDb] SET QUERY_STORE = OFF
GO
USE [HotelManagamentSystemDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 21.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelRooms]    Script Date: 21.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [decimal](18, 2) NOT NULL,
	[RoomType] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HotelRooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 21.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[AmountPaid] [decimal](10, 2) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 21.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[CheckInDate] [datetime2](7) NOT NULL,
	[CheckOutDate] [datetime2](7) NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231217073219_InitialDatabase', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231217092415_ChangesTypes', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231217094052_ColumnLimits', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231219123716_InitialNewDatabase', N'6.0.25')
GO
SET IDENTITY_INSERT [dbo].[HotelRooms] ON 

INSERT [dbo].[HotelRooms] ([RoomId], [RoomNo], [RoomType], [Price], [Status]) VALUES (1, CAST(111.00 AS Decimal(18, 2)), N'Deluxe', CAST(150.00 AS Decimal(10, 2)), N'Avaliable')
SET IDENTITY_INSERT [dbo].[HotelRooms] OFF
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Reservations]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Customers]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_HotelRooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[HotelRooms] ([RoomId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_HotelRooms]
GO
USE [master]
GO
ALTER DATABASE [HotelManagamentSystemDb] SET  READ_WRITE 
GO
