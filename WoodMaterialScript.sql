USE [master]
GO
/****** Object:  Database [WoodMaterialDb]    Script Date: 10.03.2025 22:14:13 ******/
CREATE DATABASE [WoodMaterialDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WoodMaterialDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WoodMaterialDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WoodMaterialDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WoodMaterialDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WoodMaterialDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WoodMaterialDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WoodMaterialDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WoodMaterialDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WoodMaterialDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WoodMaterialDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WoodMaterialDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WoodMaterialDb] SET  MULTI_USER 
GO
ALTER DATABASE [WoodMaterialDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WoodMaterialDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WoodMaterialDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WoodMaterialDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WoodMaterialDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WoodMaterialDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WoodMaterialDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [WoodMaterialDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WoodMaterialDb]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10.03.2025 22:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[DateOfRegistration] [date] NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[WhenToRemind] [date] NULL,
	[WhatToRemind] [nvarchar](max) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.03.2025 22:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10.03.2025 22:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdditionalInfo] [nvarchar](max) NULL,
	[Date] [date] NOT NULL,
	[UserId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleProduct]    Script Date: 10.03.2025 22:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SaleId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_SaleProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.03.2025 22:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (1, N'asdИмя Отчество', CAST(N'1991-10-06' AS Date), N'Россия, г. Оренбург, 17 Сентября ул., д. 6 кв.120', N'+7 (914) 266-16-61', CAST(N'2025-10-12' AS Date), N'  ')
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (2, N'Инькова Надежда Климентьевна', CAST(N'1996-04-11' AS Date), N'Россия, г. Магнитогорск, Комсомольская ул., д. 18 кв.185', N'+7 (911) 638-41-94', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (3, N'Парамонов Арсений Савванович', CAST(N'1982-02-26' AS Date), N'Россия, г. Мытищи, Первомайская ул., д. 19 кв.169', N'+7 (930) 539-89-69', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (4, N'Винокурова Тамара Максимовна', CAST(N'1962-05-26' AS Date), N'Россия, г. Хасавюрт, Максима Горького ул., д. 23 кв.48', N'+7 (994) 585-77-95', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (5, N'Кулика Наталия Валерьевна', CAST(N'1964-07-10' AS Date), N'Россия, г. Ангарск, Дорожная ул., д. 14 кв.212', N'+7 (916) 907-31-84', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (6, N'Дешевых Лидия Ефимовна', CAST(N'1969-05-02' AS Date), N'Россия, г. Нижневартовск, Западная ул., д. 7 кв.129', N'+7 (927) 304-10-31', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (7, N'Булка Елизавета Петровна', CAST(N'1975-05-14' AS Date), N'Россия, г. Дербент, Озерный пер., д. 3 кв.46', N'+7 (950) 836-32-88', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (8, N'Гершкович Катерина Федоровна', CAST(N'1979-11-10' AS Date), N'Россия, г. Рубцовск, Первомайская ул., д. 8 кв.109', N'+7 (907) 991-42-21', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (9, N'Ерхова Кира Трофимовна', CAST(N'1975-09-19' AS Date), N'Россия, г. Владимир, Севернаяул., д. 6 кв.207', N'+7 (964) 112-88-21', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (10, N'Шаньгин Гавриил Георгиевич', CAST(N'1991-01-20' AS Date), N'Россия, г. Жуковский, Гагарина ул., д. 24 кв.85', N'+7 (942) 983-77-11', NULL, NULL)
INSERT [dbo].[Client] ([Id], [Fullname], [DateOfRegistration], [Adress], [Phone], [WhenToRemind], [WhatToRemind]) VALUES (11, N'фыв', CAST(N'2024-02-12' AS Date), N'фыв', N'фыв', CAST(N'2024-02-12' AS Date), N'ФЫВ')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (1, N'Паркет 001', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (2, N'Паркет 002', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (3, N'Паркет 003', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (4, N'Дверь 001', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (5, N'Дверь 002', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Name], [Price]) VALUES (6, N'Дверь 003', CAST(1000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (1, N'', CAST(N'2025-02-26' AS Date), 1, 1)
INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (2, N'', CAST(N'2025-02-27' AS Date), 1, 2)
INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (3, N'', CAST(N'2025-02-28' AS Date), 1, 3)
INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (4, N'', CAST(N'2025-03-01' AS Date), 1, 4)
INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (5, N'', CAST(N'2025-03-02' AS Date), 1, 5)
INSERT [dbo].[Sale] ([Id], [AdditionalInfo], [Date], [UserId], [ClientId]) VALUES (6, N'', CAST(N'2025-03-03' AS Date), 1, 6)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleProduct] ON 

INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (1, 1, 6, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (2, 2, 5, 2, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (3, 3, 4, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (4, 4, 3, 2, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (5, 5, 2, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[SaleProduct] ([Id], [SaleId], [ProductId], [Quantity], [Amount]) VALUES (6, 6, 1, 2, CAST(2000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[SaleProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (1, N'1', N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Client]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_User]
GO
ALTER TABLE [dbo].[SaleProduct]  WITH CHECK ADD  CONSTRAINT [FK_SaleProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[SaleProduct] CHECK CONSTRAINT [FK_SaleProduct_Product]
GO
ALTER TABLE [dbo].[SaleProduct]  WITH CHECK ADD  CONSTRAINT [FK_SaleProduct_Sale] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([Id])
GO
ALTER TABLE [dbo].[SaleProduct] CHECK CONSTRAINT [FK_SaleProduct_Sale]
GO
USE [master]
GO
ALTER DATABASE [WoodMaterialDb] SET  READ_WRITE 
GO
