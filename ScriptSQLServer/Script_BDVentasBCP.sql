USE [master]
GO
/****** Object:  Database [db_BancoBCP]    Script Date: 25/08/2023 12:34:26 ******/
CREATE DATABASE [db_BancoBCP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_BancoBCP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\db_BancoBCP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_BancoBCP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\db_BancoBCP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_BancoBCP] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_BancoBCP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_BancoBCP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_BancoBCP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_BancoBCP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_BancoBCP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_BancoBCP] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_BancoBCP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_BancoBCP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_BancoBCP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_BancoBCP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_BancoBCP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_BancoBCP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_BancoBCP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_BancoBCP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_BancoBCP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_BancoBCP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_BancoBCP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_BancoBCP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_BancoBCP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_BancoBCP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_BancoBCP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_BancoBCP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_BancoBCP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_BancoBCP] SET RECOVERY FULL 
GO
ALTER DATABASE [db_BancoBCP] SET  MULTI_USER 
GO
ALTER DATABASE [db_BancoBCP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_BancoBCP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_BancoBCP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_BancoBCP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_BancoBCP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_BancoBCP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_BancoBCP', N'ON'
GO
ALTER DATABASE [db_BancoBCP] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_BancoBCP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_BancoBCP]
GO
/****** Object:  Table [dbo].[Asesor]    Script Date: 25/08/2023 12:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asesor](
	[IdAsesor] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Asesor] PRIMARY KEY CLUSTERED 
(
	[IdAsesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 25/08/2023 12:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[documentNumber] [int] NULL,
	[name] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[phoneNumber] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/08/2023 12:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 25/08/2023 12:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[Periodo] [date] NULL,
	[IdAsesor] [int] NULL,
	[IdClient] [int] NULL,
	[IdProduct] [int] NULL,
	[Puntos] [int] NULL,
	[Fecha] [date] NULL,
	[Monto] [float] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asesor] ON 

INSERT [dbo].[Asesor] ([IdAsesor], [Name]) VALUES (1, N'Luis Angel Llano')
INSERT [dbo].[Asesor] ([IdAsesor], [Name]) VALUES (2, N'Mercedes Valencia')
INSERT [dbo].[Asesor] ([IdAsesor], [Name]) VALUES (3, N'Juan Sotomayor')
SET IDENTITY_INSERT [dbo].[Asesor] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([IdClient], [documentNumber], [name], [lastname], [phoneNumber]) VALUES (1, 46198036, N'José Carlos', N'Acosta Bravo', 936860883)
INSERT [dbo].[Clients] ([IdClient], [documentNumber], [name], [lastname], [phoneNumber]) VALUES (2, 53543343, N'Luis Antonio', N'Enciso Portillo', 945654654)
INSERT [dbo].[Clients] ([IdClient], [documentNumber], [name], [lastname], [phoneNumber]) VALUES (3, 64565464, N'María Juana', N'Espinoza Chávez', 945345344)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Name]) VALUES (1, N'Tarjeta de Crédito Clásica')
INSERT [dbo].[Producto] ([IdProducto], [Name]) VALUES (2, N'Tarjeta de Crédito Oro')
INSERT [dbo].[Producto] ([IdProducto], [Name]) VALUES (3, N'Tarjeta de Crédito Platino')
INSERT [dbo].[Producto] ([IdProducto], [Name]) VALUES (4, N'Créditos Hipotecarios')
INSERT [dbo].[Producto] ([IdProducto], [Name]) VALUES (5, N'Crédito efectivo')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (1, CAST(N'2023-08-24' AS Date), 1, 1, 1, 10, CAST(N'2023-08-24' AS Date), 2000)
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (2, CAST(N'2023-08-24' AS Date), 2, 2, 2, 20, CAST(N'2023-08-24' AS Date), 2000)
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (3, CAST(N'2023-08-24' AS Date), 3, 3, 4, 10, CAST(N'2023-08-24' AS Date), 2000)
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (4, CAST(N'2023-08-09' AS Date), 1, 1, 4, 5, CAST(N'2023-08-25' AS Date), 1000)
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (5, CAST(N'2023-08-29' AS Date), 2, 1, 2, 20, CAST(N'2023-08-25' AS Date), 4000)
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
USE [master]
GO
ALTER DATABASE [db_BancoBCP] SET  READ_WRITE 
GO



PASS = Peru123456789f

 "CadenaConexionSQLServer": "Server=LIM-8M648S3\\MSSQLSERVER2022;Initial Catalog=db_BancoBCP;Persist Security Info=False;User ID=sa;Password=Peru123456789f.;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"