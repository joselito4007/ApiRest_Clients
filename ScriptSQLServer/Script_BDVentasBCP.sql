USE [db_BancoBCP]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 29/08/2023 00:22:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Pwd] [varchar](50) NULL,
	[AdminType] [varchar](50) NULL,
	[RegDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asesor]    Script Date: 29/08/2023 00:22:36 ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 29/08/2023 00:22:36 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 29/08/2023 00:22:36 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 29/08/2023 00:22:36 ******/
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
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([ID], [Name], [PhoneNumber], [Email], [Pwd], [AdminType], [RegDate]) VALUES (1, N'José Carlos', N'936860883', N'carlitos.4007@gmail.com', N'123456', N'Senior', CAST(N'2023-08-25T14:31:57.217' AS DateTime))
INSERT [dbo].[Administrator] ([ID], [Name], [PhoneNumber], [Email], [Pwd], [AdminType], [RegDate]) VALUES (2, N'Luis Antonio', N'975644343', N'luisito@gmail.com', N'654321', N'Junior', CAST(N'2023-08-25T14:32:38.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrator] OFF
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
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (6, CAST(N'2023-08-31' AS Date), 3, 2, 5, 9, CAST(N'2023-08-25' AS Date), 3000)
INSERT [dbo].[Venta] ([IdVenta], [Periodo], [IdAsesor], [IdClient], [IdProduct], [Puntos], [Fecha], [Monto]) VALUES (8, CAST(N'2023-08-17' AS Date), 1, 2, 3, 40, CAST(N'2023-08-28' AS Date), 1000)
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Administrator] ADD  CONSTRAINT [DF_Administrator_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
