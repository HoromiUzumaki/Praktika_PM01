USE [master]
GO
/****** Object:  Database [WarehouseManagement]    Script Date: 28.02.2025 18:44:46 ******/
CREATE DATABASE [WarehouseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WarehouseManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WarehouseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WarehouseManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WarehouseManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WarehouseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WarehouseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WarehouseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WarehouseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WarehouseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WarehouseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WarehouseManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WarehouseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WarehouseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WarehouseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WarehouseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WarehouseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WarehouseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WarehouseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WarehouseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WarehouseManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WarehouseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WarehouseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WarehouseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WarehouseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WarehouseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WarehouseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WarehouseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WarehouseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WarehouseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WarehouseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WarehouseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WarehouseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WarehouseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WarehouseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WarehouseManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WarehouseManagement] SET QUERY_STORE = OFF
GO
USE [WarehouseManagement]
GO
/****** Object:  Table [dbo].[Barcodes]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcodes](
	[BarcodeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[BarcodeData] [nvarchar](100) NOT NULL,
	[GeneratedBy] [int] NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BarcodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[FileType] [nvarchar](50) NOT NULL,
	[FileData] [varbinary](max) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[UploadedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomingInvoiceItems]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingInvoiceItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomingInvoices]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](100) NOT NULL,
	[DateReceived] [date] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryDate] [date] NOT NULL,
	[ResponsiblePerson] [nvarchar](255) NOT NULL,
	[Notes] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryResults]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryResults](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ActualQuantity] [int] NOT NULL,
	[RecordedQuantity] [int] NOT NULL,
	[Difference] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutgoingInvoiceItems]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutgoingInvoiceItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutgoingInvoices]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutgoingInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](100) NOT NULL,
	[DateShipped] [date] NOT NULL,
	[ClientID] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Article] [nvarchar](100) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Category] [nvarchar](100) NULL,
	[UnitOfMeasurement] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ExpiryDate] [date] NULL,
	[SerialNumber] [nvarchar](100) NULL,
	[MinimumStockLevel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [nvarchar](100) NOT NULL,
	[GeneratedBy] [int] NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
	[ReportData] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneID] [int] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageZones]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageZones](
	[ZoneID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[INN] [nvarchar](20) NULL,
	[KPP] [nvarchar](20) NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogs]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Action] [nvarchar](255) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[FullName] [nvarchar](255) NULL,
	[RoleID] [int] NOT NULL,
	[TwoFactorSecret] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 28.02.2025 18:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Type] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [Name], [ContactPhone], [Email], [Address]) VALUES (1, N'ИП Иванов', N'+79997654321', N'ivanov@mail.ru', N'ул. Советская, 20')
INSERT [dbo].[Clients] ([ClientID], [Name], [ContactPhone], [Email], [Address]) VALUES (2, N'ООО "ТехноМир"', N'+79998765432', N'tech@technomir.ru', N'ул. Ленина, 30')
INSERT [dbo].[Clients] ([ClientID], [Name], [ContactPhone], [Email], [Address]) VALUES (3, N'ИП Петрова', N'+79999876543', N'petrova@mail.ru', N'ул. Пушкина, 10')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomingInvoiceItems] ON 

INSERT [dbo].[IncomingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 3, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[IncomingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 2, 10, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[IncomingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 3, 20, CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[IncomingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (4, 3, 4, 2, CAST(30000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[IncomingInvoiceItems] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomingInvoices] ON 

INSERT [dbo].[IncomingInvoices] ([InvoiceID], [InvoiceNumber], [DateReceived], [SupplierID], [TotalAmount]) VALUES (1, N'INV-001', CAST(N'2023-10-01' AS Date), 1, CAST(150000.00 AS Decimal(18, 2)))
INSERT [dbo].[IncomingInvoices] ([InvoiceID], [InvoiceNumber], [DateReceived], [SupplierID], [TotalAmount]) VALUES (2, N'INV-002', CAST(N'2023-10-05' AS Date), 2, CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[IncomingInvoices] ([InvoiceID], [InvoiceNumber], [DateReceived], [SupplierID], [TotalAmount]) VALUES (3, N'INV-003', CAST(N'2023-10-10' AS Date), 3, CAST(50000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[IncomingInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([InventoryID], [InventoryDate], [ResponsiblePerson], [Notes]) VALUES (1, CAST(N'2023-10-15' AS Date), N'Петров Петр', N'Плановая инвентаризация')
INSERT [dbo].[Inventory] ([InventoryID], [InventoryDate], [ResponsiblePerson], [Notes]) VALUES (2, CAST(N'2023-10-20' AS Date), N'Сидорова Анна', N'Внеплановая проверка')
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryResults] ON 

INSERT [dbo].[InventoryResults] ([ResultID], [InventoryID], [ProductID], [ActualQuantity], [RecordedQuantity], [Difference]) VALUES (1, 1, 1, 100, 98, 2)
INSERT [dbo].[InventoryResults] ([ResultID], [InventoryID], [ProductID], [ActualQuantity], [RecordedQuantity], [Difference]) VALUES (2, 1, 2, 500, 495, 5)
INSERT [dbo].[InventoryResults] ([ResultID], [InventoryID], [ProductID], [ActualQuantity], [RecordedQuantity], [Difference]) VALUES (3, 2, 3, 30, 28, 2)
INSERT [dbo].[InventoryResults] ([ResultID], [InventoryID], [ProductID], [ActualQuantity], [RecordedQuantity], [Difference]) VALUES (4, 2, 4, 5, 4, 1)
SET IDENTITY_INSERT [dbo].[InventoryResults] OFF
GO
SET IDENTITY_INSERT [dbo].[OutgoingInvoiceItems] ON 

INSERT [dbo].[OutgoingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OutgoingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 2, 5, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[OutgoingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 3, 10, CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[OutgoingInvoiceItems] ([ItemID], [InvoiceID], [ProductID], [Quantity], [Price]) VALUES (4, 3, 4, 1, CAST(30000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OutgoingInvoiceItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OutgoingInvoices] ON 

INSERT [dbo].[OutgoingInvoices] ([InvoiceID], [InvoiceNumber], [DateShipped], [ClientID], [TotalAmount]) VALUES (1, N'OUT-001', CAST(N'2023-10-02' AS Date), 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OutgoingInvoices] ([InvoiceID], [InvoiceNumber], [DateShipped], [ClientID], [TotalAmount]) VALUES (2, N'OUT-002', CAST(N'2023-10-06' AS Date), 2, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OutgoingInvoices] ([InvoiceID], [InvoiceNumber], [DateShipped], [ClientID], [TotalAmount]) VALUES (3, N'OUT-003', CAST(N'2023-10-11' AS Date), 3, CAST(30000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OutgoingInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [Article], [Barcode], [Category], [UnitOfMeasurement], [Price], [ExpiryDate], [SerialNumber], [MinimumStockLevel]) VALUES (1, N'Ноутбук Lenovo', N'LN123', N'123456789012', N'Электроника', N'шт.', CAST(50000.00 AS Decimal(18, 2)), CAST(N'2025-12-31' AS Date), N'SN123456', 10)
INSERT [dbo].[Products] ([ProductID], [Name], [Article], [Barcode], [Category], [UnitOfMeasurement], [Price], [ExpiryDate], [SerialNumber], [MinimumStockLevel]) VALUES (2, N'Мышь Logitech', N'ML456', N'987654321098', N'Аксессуары', N'шт.', CAST(1500.00 AS Decimal(18, 2)), NULL, NULL, 50)
INSERT [dbo].[Products] ([ProductID], [Name], [Article], [Barcode], [Category], [UnitOfMeasurement], [Price], [ExpiryDate], [SerialNumber], [MinimumStockLevel]) VALUES (3, N'Клавиатура HP', N'KH789', N'456789123456', N'Аксессуары', N'шт.', CAST(2500.00 AS Decimal(18, 2)), NULL, NULL, 30)
INSERT [dbo].[Products] ([ProductID], [Name], [Article], [Barcode], [Category], [UnitOfMeasurement], [Price], [ExpiryDate], [SerialNumber], [MinimumStockLevel]) VALUES (4, N'Монитор Samsung', N'MS321', N'789123456789', N'Электроника', N'шт.', CAST(30000.00 AS Decimal(18, 2)), NULL, NULL, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Бухгалтер')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Кладовщик')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Менеджер по продажам')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [Quantity]) VALUES (1, 1, 1, 1, 100)
INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [Quantity]) VALUES (2, 2, 1, 2, 500)
INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [Quantity]) VALUES (3, 3, 2, 3, 30)
INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [Quantity]) VALUES (4, 4, 3, 4, 5)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[StorageZones] ON 

INSERT [dbo].[StorageZones] ([ZoneID], [WarehouseID], [ZoneName], [Description]) VALUES (1, 1, N'Зона А', N'Для электроники')
INSERT [dbo].[StorageZones] ([ZoneID], [WarehouseID], [ZoneName], [Description]) VALUES (2, 1, N'Зона Б', N'Для аксессуаров')
INSERT [dbo].[StorageZones] ([ZoneID], [WarehouseID], [ZoneName], [Description]) VALUES (3, 2, N'Зона В', N'Для временного хранения')
INSERT [dbo].[StorageZones] ([ZoneID], [WarehouseID], [ZoneName], [Description]) VALUES (4, 3, N'Зона Г', N'Для розничных товаров')
SET IDENTITY_INSERT [dbo].[StorageZones] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [Name], [INN], [KPP], [ContactPhone], [Email], [Address]) VALUES (1, N'ООО "Электроникс"', N'1234567890', N'987654321', N'+79991234567', N'info@electronics.ru', N'ул. Мира, 15')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [INN], [KPP], [ContactPhone], [Email], [Address]) VALUES (2, N'ИП "Компьютерные технологии"', N'9876543210', N'123456789', N'+79992345678', N'tech@computer.ru', N'ул. Советская, 20')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [INN], [KPP], [ContactPhone], [Email], [Address]) VALUES (3, N'ООО "Гаджеты и Ко"', N'4567891230', N'654321987', N'+79993456789', N'gadgets@mail.ru', N'ул. Центральная, 5')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [Phone], [FullName], [RoleID], [TwoFactorSecret]) VALUES (1, N'admin', N'hashed_password_1', N'admin@warehouse.ru', N'+79991112233', N'Иванов Иван', 1, N'secret1')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [Phone], [FullName], [RoleID], [TwoFactorSecret]) VALUES (2, N'storekeeper', N'hashed_password_2', N'storekeeper@warehouse.ru', N'+79992223344', N'Петров Петр', 2, N'secret2')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [Phone], [FullName], [RoleID], [TwoFactorSecret]) VALUES (3, N'sales_manager', N'hashed_password_3', N'sales@warehouse.ru', N'+79993334455', N'Сидорова Анна', 3, N'secret3')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [Phone], [FullName], [RoleID], [TwoFactorSecret]) VALUES (4, N'accountant', N'hashed_password_4', N'accountant@warehouse.ru', N'+79994445566', N'Козлова Ольга', 4, N'secret4')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Address], [Type]) VALUES (1, N'Основной склад', N'ул. Ленина, 10', N'Основной')
INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Address], [Type]) VALUES (2, N'Временный склад', N'ул. Пушкина, 5', N'Временный')
INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Address], [Type]) VALUES (3, N'Розничный склад', N'ул. Гагарина, 15', N'Розничный')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__177800D346EECF7C]    Script Date: 28.02.2025 18:44:47 ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[Barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B616077AEE7C6]    Script Date: 28.02.2025 18:44:47 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4F5A7391A]    Script Date: 28.02.2025 18:44:47 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barcodes] ADD  DEFAULT (getdate()) FOR [GeneratedDate]
GO
ALTER TABLE [dbo].[Files] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT (getdate()) FOR [GeneratedDate]
GO
ALTER TABLE [dbo].[UserLogs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Barcodes]  WITH CHECK ADD FOREIGN KEY([GeneratedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Barcodes]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[IncomingInvoiceItems]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[IncomingInvoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[IncomingInvoiceItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[IncomingInvoices]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[InventoryResults]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[InventoryResults]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OutgoingInvoiceItems]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[OutgoingInvoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[OutgoingInvoiceItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OutgoingInvoices]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([GeneratedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ZoneID])
REFERENCES [dbo].[StorageZones] ([ZoneID])
GO
ALTER TABLE [dbo].[StorageZones]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[UserLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [WarehouseManagement] SET  READ_WRITE 
GO
