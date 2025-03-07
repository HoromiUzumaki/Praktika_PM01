USE [master]
GO
/****** Object:  Database [Складской_учет]    Script Date: 05.03.2025 18:20:30 ******/
CREATE DATABASE [Складской_учет]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Складской_учет', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Складской_учет.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Складской_учет_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Складской_учет_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Складской_учет] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Складской_учет].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Складской_учет] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Складской_учет] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Складской_учет] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Складской_учет] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Складской_учет] SET ARITHABORT OFF 
GO
ALTER DATABASE [Складской_учет] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Складской_учет] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Складской_учет] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Складской_учет] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Складской_учет] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Складской_учет] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Складской_учет] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Складской_учет] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Складской_учет] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Складской_учет] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Складской_учет] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Складской_учет] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Складской_учет] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Складской_учет] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Складской_учет] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Складской_учет] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Складской_учет] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Складской_учет] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Складской_учет] SET  MULTI_USER 
GO
ALTER DATABASE [Складской_учет] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Складской_учет] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Складской_учет] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Складской_учет] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Складской_учет] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Складской_учет] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Складской_учет] SET QUERY_STORE = OFF
GO
USE [Складской_учет]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](18) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IdEmployee] [int] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenditureInvoice]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenditureInvoice](
	[IdExpenditureInvoice] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](max) NOT NULL,
	[ShipmentDate] [date] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[IdClient] [int] NOT NULL,
 CONSTRAINT [PK_ExpenditureInvoice] PRIMARY KEY CLUSTERED 
(
	[IdExpenditureInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenditureInvoiceWarehouse]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenditureInvoiceWarehouse](
	[IdExpenditureInvoiceWarehouse] [int] NOT NULL,
	[IdExpenditureInvoice] [int] NOT NULL,
	[IdWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_ExpenditureInvoiceWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdExpenditureInvoiceWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[IdGoods] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Article] [nvarchar](max) NOT NULL,
	[Barcode] [nvarchar](max) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdUnit] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[SerialNumber] [nvarchar](max) NULL,
	[MinimumBalance] [float] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[IdGoods] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsWarehouse]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsWarehouse](
	[IdGoodsWarehouse] [int] NOT NULL,
	[IdGoods] [int] NOT NULL,
	[IdWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_GoodsWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdGoodsWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomingInvoice]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingInvoice](
	[IdIncomingInvoice] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](max) NOT NULL,
	[DateReceipt] [date] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_IncomingInvoice] PRIMARY KEY CLUSTERED 
(
	[IdIncomingInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomingInvoiceWarehouse]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingInvoiceWarehouse](
	[IdIncomingInvoiceWarehouse] [int] NOT NULL,
	[IdIncomingInvoice] [int] NOT NULL,
	[IdWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_IncomingInvoiceWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdIncomingInvoiceWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[IdInventory] [int] IDENTITY(1,1) NOT NULL,
	[DateEvent] [date] NOT NULL,
	[IdResponsible] [int] NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[IdInventory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryWarehouse]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryWarehouse](
	[IdInventoryWarehouse] [int] NOT NULL,
	[IdIntentory] [int] NOT NULL,
	[IdWarehouse] [int] NOT NULL,
	[AccountingQuantity] [float] NOT NULL,
	[ActualQuantity] [float] NOT NULL,
 CONSTRAINT [PK_InventoryWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdInventoryWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageArea]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageArea](
	[IdStorageArea] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StorageArea] PRIMARY KEY CLUSTERED 
(
	[IdStorageArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[IdSupplier] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[INNOrKPP] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[IdSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[IdUnit] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[IdUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[IdWarehouse] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[IdWarehouseType] [int] NOT NULL,
	[IdStorageArea] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[IdWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseType]    Script Date: 05.03.2025 18:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseType](
	[IdWarehouseType] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WarehouseType] PRIMARY KEY CLUSTERED 
(
	[IdWarehouseType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([IdCategory], [Title]) VALUES (1, N'Электроника')
INSERT [dbo].[Category] ([IdCategory], [Title]) VALUES (2, N'Одежда')
INSERT [dbo].[Category] ([IdCategory], [Title]) VALUES (3, N'Мебель')
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IdClient], [Title], [Phone], [Email], [Address]) VALUES (1, N'Иванов Иван', N'+79991234567', N'ivanov@example.com', N'ул. Ленина, д. 10')
INSERT [dbo].[Client] ([IdClient], [Title], [Phone], [Email], [Address]) VALUES (2, N'Петров Петр', N'+79997654321', N'petrov@example.com', N'ул. Пушкина, д. 5')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Employee] ([IdEmployee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (1, N'Сидоров', N'Алексей', N'Иванович', N'+79991112233', N'sidorov@example.com')
INSERT [dbo].[Employee] ([IdEmployee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (2, N'Кузнецова', N'Мария', N'Сергеевна', N'+79994445566', N'kuznetsova@example.com')
GO
SET IDENTITY_INSERT [dbo].[ExpenditureInvoice] ON 

INSERT [dbo].[ExpenditureInvoice] ([IdExpenditureInvoice], [InvoiceNumber], [ShipmentDate], [TotalPrice], [IdClient]) VALUES (1, N'INV-001', CAST(N'2025-01-15' AS Date), 15000.5, 1)
INSERT [dbo].[ExpenditureInvoice] ([IdExpenditureInvoice], [InvoiceNumber], [ShipmentDate], [TotalPrice], [IdClient]) VALUES (2, N'INV-002', CAST(N'2025-01-20' AS Date), 20000, 2)
SET IDENTITY_INSERT [dbo].[ExpenditureInvoice] OFF
GO
INSERT [dbo].[ExpenditureInvoiceWarehouse] ([IdExpenditureInvoiceWarehouse], [IdExpenditureInvoice], [IdWarehouse]) VALUES (1, 1, 1)
INSERT [dbo].[ExpenditureInvoiceWarehouse] ([IdExpenditureInvoiceWarehouse], [IdExpenditureInvoice], [IdWarehouse]) VALUES (2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([IdGoods], [Title], [Article], [Barcode], [IdCategory], [IdUnit], [Price], [SerialNumber], [MinimumBalance]) VALUES (2, N'Ноутбук', N'NB123', N'123456789012', 1, 1, 50000, N'SN123456', 5)
INSERT [dbo].[Goods] ([IdGoods], [Title], [Article], [Barcode], [IdCategory], [IdUnit], [Price], [SerialNumber], [MinimumBalance]) VALUES (3, N'Футболка', N'FT456', N'987654321098', 2, 2, 1500, N'SN123458', 10)
INSERT [dbo].[Goods] ([IdGoods], [Title], [Article], [Barcode], [IdCategory], [IdUnit], [Price], [SerialNumber], [MinimumBalance]) VALUES (6, N'Принтер', N'ART12345', N'1234567890123', 1, 1, 199.99, N'SN123456789', 10)
INSERT [dbo].[Goods] ([IdGoods], [Title], [Article], [Barcode], [IdCategory], [IdUnit], [Price], [SerialNumber], [MinimumBalance]) VALUES (7, N'Телефон', N'ART12348', N'1234567890129', 1, 1, 250, N'SN12345778', 10)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
INSERT [dbo].[GoodsWarehouse] ([IdGoodsWarehouse], [IdGoods], [IdWarehouse]) VALUES (1, 2, 1)
INSERT [dbo].[GoodsWarehouse] ([IdGoodsWarehouse], [IdGoods], [IdWarehouse]) VALUES (2, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[IncomingInvoice] ON 

INSERT [dbo].[IncomingInvoice] ([IdIncomingInvoice], [InvoiceNumber], [DateReceipt], [IdSupplier], [TotalPrice]) VALUES (1, N'INV-101', CAST(N'2025-01-10' AS Date), 1, 30000)
INSERT [dbo].[IncomingInvoice] ([IdIncomingInvoice], [InvoiceNumber], [DateReceipt], [IdSupplier], [TotalPrice]) VALUES (2, N'INV-102', CAST(N'2025-01-12' AS Date), 2, 10000)
SET IDENTITY_INSERT [dbo].[IncomingInvoice] OFF
GO
INSERT [dbo].[IncomingInvoiceWarehouse] ([IdIncomingInvoiceWarehouse], [IdIncomingInvoice], [IdWarehouse]) VALUES (1, 1, 1)
INSERT [dbo].[IncomingInvoiceWarehouse] ([IdIncomingInvoiceWarehouse], [IdIncomingInvoice], [IdWarehouse]) VALUES (2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([IdInventory], [DateEvent], [IdResponsible], [Result]) VALUES (1, CAST(N'2025-01-25' AS Date), 1, N'Все товары учтены')
INSERT [dbo].[Inventory] ([IdInventory], [DateEvent], [IdResponsible], [Result]) VALUES (2, CAST(N'2025-01-26' AS Date), 2, N'Обнаружены расхождения')
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
INSERT [dbo].[InventoryWarehouse] ([IdInventoryWarehouse], [IdIntentory], [IdWarehouse], [AccountingQuantity], [ActualQuantity]) VALUES (1, 1, 1, 100, 100)
INSERT [dbo].[InventoryWarehouse] ([IdInventoryWarehouse], [IdIntentory], [IdWarehouse], [AccountingQuantity], [ActualQuantity]) VALUES (2, 2, 2, 50, 48)
GO
INSERT [dbo].[StorageArea] ([IdStorageArea], [Title]) VALUES (1, N'Зона А')
INSERT [dbo].[StorageArea] ([IdStorageArea], [Title]) VALUES (2, N'Зона Б')
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([IdSupplier], [Title], [INNOrKPP], [Address]) VALUES (1, N'ООО "Электроника"', N'1234567890', N'ул. Мира, д. 15')
INSERT [dbo].[Supplier] ([IdSupplier], [Title], [INNOrKPP], [Address]) VALUES (2, N'ИП Петров', N'0987654321', N'ул. Садовая, д. 20')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Unit] ([IdUnit], [Title]) VALUES (1, N'шт.')
INSERT [dbo].[Unit] ([IdUnit], [Title]) VALUES (2, N'кг')
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([IdWarehouse], [Title], [Address], [IdWarehouseType], [IdStorageArea]) VALUES (1, N'Склад 1', N'ул. Складская, д. 1', 1, 1)
INSERT [dbo].[Warehouse] ([IdWarehouse], [Title], [Address], [IdWarehouseType], [IdStorageArea]) VALUES (2, N'Склад 2', N'ул. Складская, д. 2', 2, 2)
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
INSERT [dbo].[WarehouseType] ([IdWarehouseType], [Title]) VALUES (1, N'Основной склад')
INSERT [dbo].[WarehouseType] ([IdWarehouseType], [Title]) VALUES (2, N'Склад временного хранения')
GO
ALTER TABLE [dbo].[ExpenditureInvoice]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoice_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[ExpenditureInvoice] CHECK CONSTRAINT [FK_ExpenditureInvoice_Client]
GO
ALTER TABLE [dbo].[ExpenditureInvoiceWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoiceWarehouse_ExpenditureInvoice] FOREIGN KEY([IdExpenditureInvoice])
REFERENCES [dbo].[ExpenditureInvoice] ([IdExpenditureInvoice])
GO
ALTER TABLE [dbo].[ExpenditureInvoiceWarehouse] CHECK CONSTRAINT [FK_ExpenditureInvoiceWarehouse_ExpenditureInvoice]
GO
ALTER TABLE [dbo].[ExpenditureInvoiceWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoiceWarehouse_Warehouse] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Warehouse] ([IdWarehouse])
GO
ALTER TABLE [dbo].[ExpenditureInvoiceWarehouse] CHECK CONSTRAINT [FK_ExpenditureInvoiceWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Category]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Unit] FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([IdUnit])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Unit]
GO
ALTER TABLE [dbo].[GoodsWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouse_Goods] FOREIGN KEY([IdGoods])
REFERENCES [dbo].[Goods] ([IdGoods])
GO
ALTER TABLE [dbo].[GoodsWarehouse] CHECK CONSTRAINT [FK_GoodsWarehouse_Goods]
GO
ALTER TABLE [dbo].[GoodsWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouse_Warehouse] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Warehouse] ([IdWarehouse])
GO
ALTER TABLE [dbo].[GoodsWarehouse] CHECK CONSTRAINT [FK_GoodsWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[IncomingInvoice]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoice_Supplier] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([IdSupplier])
GO
ALTER TABLE [dbo].[IncomingInvoice] CHECK CONSTRAINT [FK_IncomingInvoice_Supplier]
GO
ALTER TABLE [dbo].[IncomingInvoiceWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoiceWarehouse_IncomingInvoice] FOREIGN KEY([IdIncomingInvoice])
REFERENCES [dbo].[IncomingInvoice] ([IdIncomingInvoice])
GO
ALTER TABLE [dbo].[IncomingInvoiceWarehouse] CHECK CONSTRAINT [FK_IncomingInvoiceWarehouse_IncomingInvoice]
GO
ALTER TABLE [dbo].[IncomingInvoiceWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoiceWarehouse_Warehouse] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Warehouse] ([IdWarehouse])
GO
ALTER TABLE [dbo].[IncomingInvoiceWarehouse] CHECK CONSTRAINT [FK_IncomingInvoiceWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Employee] FOREIGN KEY([IdResponsible])
REFERENCES [dbo].[Employee] ([IdEmployee])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Employee]
GO
ALTER TABLE [dbo].[InventoryWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_InventoryWarehouse_Inventory] FOREIGN KEY([IdIntentory])
REFERENCES [dbo].[Inventory] ([IdInventory])
GO
ALTER TABLE [dbo].[InventoryWarehouse] CHECK CONSTRAINT [FK_InventoryWarehouse_Inventory]
GO
ALTER TABLE [dbo].[InventoryWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_InventoryWarehouse_Warehouse] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Warehouse] ([IdWarehouse])
GO
ALTER TABLE [dbo].[InventoryWarehouse] CHECK CONSTRAINT [FK_InventoryWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StorageArea] FOREIGN KEY([IdStorageArea])
REFERENCES [dbo].[StorageArea] ([IdStorageArea])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_StorageArea]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_WarehouseType] FOREIGN KEY([IdWarehouseType])
REFERENCES [dbo].[WarehouseType] ([IdWarehouseType])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_WarehouseType]
GO
USE [master]
GO
ALTER DATABASE [Складской_учет] SET  READ_WRITE 
GO
