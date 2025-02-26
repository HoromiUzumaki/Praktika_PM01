USE [master]
GO
/****** Object:  Database [Test_Db]    Script Date: 26.02.2025 16:51:34 ******/
CREATE DATABASE [Test_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test_Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Test_Db.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Test_Db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Test_Db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test_Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Test_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test_Db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Test_Db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Test_Db]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[клиент_id] [int] NULL,
	[дата_заказа] [date] NOT NULL,
	[статус] [nvarchar](50) NULL,
	[общая_сумма] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Зоны_хранения]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зоны_хранения](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](100) NOT NULL,
	[склад_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Инвентаризация]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инвентаризация](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[дата_проведения] [date] NOT NULL,
	[ответственный] [nvarchar](255) NULL,
	[результаты] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[История_заказов]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История_заказов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[заказ_id] [int] NULL,
	[дата_изменения] [date] NOT NULL,
	[статус] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](255) NOT NULL,
	[инн] [nvarchar](12) NULL,
	[контактные_данные] [nvarchar](255) NULL,
	[адрес] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[имя] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[пароль] [nvarchar](255) NOT NULL,
	[роль_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](255) NOT NULL,
	[инн] [nvarchar](12) NULL,
	[кпп] [nvarchar](9) NULL,
	[контактные_данные] [nvarchar](255) NULL,
	[адрес] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Приходные_накладные]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Приходные_накладные](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[номер_накладной] [nvarchar](100) NOT NULL,
	[дата_поступления] [date] NOT NULL,
	[поставщик_id] [int] NULL,
	[общая_сумма] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расходные_накладные]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расходные_накладные](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[номер_накладной] [nvarchar](100) NOT NULL,
	[дата_отгрузки] [date] NOT NULL,
	[клиент_id] [int] NULL,
	[общая_сумма] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](100) NOT NULL,
	[описание] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склады]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склады](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](255) NOT NULL,
	[адрес] [nvarchar](255) NULL,
	[тип_склада_id] [int] NULL,
	[зоны_хранения] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы_складов]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы_складов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](100) NOT NULL,
	[описание] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](255) NOT NULL,
	[артикул] [nvarchar](100) NOT NULL,
	[штрихкод] [nvarchar](100) NOT NULL,
	[категория] [nvarchar](100) NULL,
	[единица_измерения] [nvarchar](50) NULL,
	[цена_за_единицу] [decimal](10, 2) NULL,
	[серийный_номер] [nvarchar](100) NULL,
	[минимальный_остаток] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_в_заказах]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_в_заказах](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[заказ_id] [int] NULL,
	[товар_id] [int] NULL,
	[количество] [int] NULL,
	[цена] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_в_приходных_накладных]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_в_приходных_накладных](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[приходная_накладная_id] [int] NULL,
	[товар_id] [int] NULL,
	[количество] [int] NULL,
	[цена] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_в_расходных_накладных]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_в_расходных_накладных](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[расходная_накладная_id] [int] NULL,
	[товар_id] [int] NULL,
	[количество] [int] NULL,
	[цена] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_на_складе]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_на_складе](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[товар_id] [int] NULL,
	[склад_id] [int] NULL,
	[количество] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Характеристики_складов]    Script Date: 26.02.2025 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Характеристики_складов](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[склад_id] [int] NULL,
	[площадь] [decimal](10, 2) NULL,
	[емкость] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 
GO
INSERT [dbo].[Заказы] ([id], [клиент_id], [дата_заказа], [статус], [общая_сумма]) VALUES (1, 1, CAST(N'2023-10-05' AS Date), N'Выполнен', CAST(800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Заказы] ([id], [клиент_id], [дата_заказа], [статус], [общая_сумма]) VALUES (2, 2, CAST(N'2023-10-06' AS Date), N'В процессе', CAST(1200.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
SET IDENTITY_INSERT [dbo].[Зоны_хранения] ON 
GO
INSERT [dbo].[Зоны_хранения] ([id], [название], [склад_id]) VALUES (1, N'Зона 1', 1)
GO
INSERT [dbo].[Зоны_хранения] ([id], [название], [склад_id]) VALUES (2, N'Зона 2', 1)
GO
INSERT [dbo].[Зоны_хранения] ([id], [название], [склад_id]) VALUES (3, N'Зона 3', 2)
GO
INSERT [dbo].[Зоны_хранения] ([id], [название], [склад_id]) VALUES (4, N'Зона 4', 2)
GO
SET IDENTITY_INSERT [dbo].[Зоны_хранения] OFF
GO
SET IDENTITY_INSERT [dbo].[Инвентаризация] ON 
GO
INSERT [dbo].[Инвентаризация] ([id], [дата_проведения], [ответственный], [результаты]) VALUES (1, CAST(N'2023-10-10' AS Date), N'Иван Иванов', N'Все товары на месте.')
GO
INSERT [dbo].[Инвентаризация] ([id], [дата_проведения], [ответственный], [результаты]) VALUES (2, CAST(N'2023-10-15' AS Date), N'Петр Петров', N'Не хватает 5 единиц Товара 1.')
GO
SET IDENTITY_INSERT [dbo].[Инвентаризация] OFF
GO
SET IDENTITY_INSERT [dbo].[История_заказов] ON 
GO
INSERT [dbo].[История_заказов] ([id], [заказ_id], [дата_изменения], [статус]) VALUES (1, 1, CAST(N'2023-10-07' AS Date), N'Обработан')
GO
INSERT [dbo].[История_заказов] ([id], [заказ_id], [дата_изменения], [статус]) VALUES (2, 2, CAST(N'2023-10-08' AS Date), N'Отменен')
GO
SET IDENTITY_INSERT [dbo].[История_заказов] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 
GO
INSERT [dbo].[Клиенты] ([id], [название], [инн], [контактные_данные], [адрес]) VALUES (1, N'Клиент 1', N'1111111111', N'тел: 111-1111, email: client1@example.com', N'Адрес Клиента 1')
GO
INSERT [dbo].[Клиенты] ([id], [название], [инн], [контактные_данные], [адрес]) VALUES (2, N'Клиент 2', N'2222222222', N'тел: 222-2222, email: client2@example.com', N'Адрес Клиента 2')
GO
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[Пользователи] ON 
GO
INSERT [dbo].[Пользователи] ([id], [имя], [email], [пароль], [роль_id]) VALUES (1, N'Иван Иванов', N'ivan@example.com', N'password123', 1)
GO
INSERT [dbo].[Пользователи] ([id], [имя], [email], [пароль], [роль_id]) VALUES (2, N'Светлана Светлова', N'svetlana@example.com', N'password123', 3)
GO
INSERT [dbo].[Пользователи] ([id], [имя], [email], [пароль], [роль_id]) VALUES (3, N'Анна Аннова', N'anna@example.com', N'password123', 4)
GO
INSERT [dbo].[Пользователи] ([id], [имя], [email], [пароль], [роль_id]) VALUES (4, N'Петр Петров', N'petr@example.com', N'password123', 2)
GO
SET IDENTITY_INSERT [dbo].[Пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[Поставщики] ON 
GO
INSERT [dbo].[Поставщики] ([id], [название], [инн], [кпп], [контактные_данные], [адрес]) VALUES (1, N'Поставщик 1', N'1234567890', N'123456789', N'тел: 123-4567, email: supplier1@example.com', N'Адрес Поставщика 1')
GO
INSERT [dbo].[Поставщики] ([id], [название], [инн], [кпп], [контактные_данные], [адрес]) VALUES (2, N'Поставщик 2', N'0987654321', N'987654321', N'тел: 765-4321, email: supplier2@example.com', N'Адрес Поставщика 2')
GO
SET IDENTITY_INSERT [dbo].[Поставщики] OFF
GO
SET IDENTITY_INSERT [dbo].[Приходные_накладные] ON 
GO
INSERT [dbo].[Приходные_накладные] ([id], [номер_накладной], [дата_поступления], [поставщик_id], [общая_сумма]) VALUES (1, N'PN001', CAST(N'2023-10-01' AS Date), 1, CAST(1000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Приходные_накладные] ([id], [номер_накладной], [дата_поступления], [поставщик_id], [общая_сумма]) VALUES (2, N'PN002', CAST(N'2023-10-02' AS Date), 2, CAST(2000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Приходные_накладные] OFF
GO
SET IDENTITY_INSERT [dbo].[Расходные_накладные] ON 
GO
INSERT [dbo].[Расходные_накладные] ([id], [номер_накладной], [дата_отгрузки], [клиент_id], [общая_сумма]) VALUES (1, N'RN001', CAST(N'2023-10-05' AS Date), 1, CAST(800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Расходные_накладные] ([id], [номер_накладной], [дата_отгрузки], [клиент_id], [общая_сумма]) VALUES (2, N'RN002', CAST(N'2023-10-06' AS Date), 2, CAST(1200.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Расходные_накладные] OFF
GO
SET IDENTITY_INSERT [dbo].[Роли] ON 
GO
INSERT [dbo].[Роли] ([id], [название], [описание]) VALUES (1, N'Администратор', N'Управление системой и пользователями.')
GO
INSERT [dbo].[Роли] ([id], [название], [описание]) VALUES (2, N'Кладовщик', N'Управление складскими запасами.')
GO
INSERT [dbo].[Роли] ([id], [название], [описание]) VALUES (3, N'Менеджер по продажам', N'Обработка заказов и взаимодействие с клиентами.')
GO
INSERT [dbo].[Роли] ([id], [название], [описание]) VALUES (4, N'Бухгалтер', N'Учет финансов и отчетность.')
GO
SET IDENTITY_INSERT [dbo].[Роли] OFF
GO
SET IDENTITY_INSERT [dbo].[Склады] ON 
GO
INSERT [dbo].[Склады] ([id], [название], [адрес], [тип_склада_id], [зоны_хранения]) VALUES (1, N'Склад 1', N'Улица 1, дом 1', 1, N'Стеллажи, Ячейки')
GO
INSERT [dbo].[Склады] ([id], [название], [адрес], [тип_склада_id], [зоны_хранения]) VALUES (2, N'Склад 2', N'Улица 2, дом 2', 2, N'Паллеты, Ячейки')
GO
SET IDENTITY_INSERT [dbo].[Склады] OFF
GO
SET IDENTITY_INSERT [dbo].[Типы_складов] ON 
GO
INSERT [dbo].[Типы_складов] ([id], [название], [описание]) VALUES (1, N'Основной', N'Основной склад для хранения товаров.')
GO
INSERT [dbo].[Типы_складов] ([id], [название], [описание]) VALUES (2, N'Временный', N'Временный склад для сезонных товаров.')
GO
SET IDENTITY_INSERT [dbo].[Типы_складов] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары] ON 
GO
INSERT [dbo].[Товары] ([id], [название], [артикул], [штрихкод], [категория], [единица_измерения], [цена_за_единицу], [серийный_номер], [минимальный_остаток]) VALUES (1, N'Товар 1', N'A001', N'1234567890123', N'Категория 1', N'шт.', CAST(100.00 AS Decimal(10, 2)), N'SN001', 10)
GO
INSERT [dbo].[Товары] ([id], [название], [артикул], [штрихкод], [категория], [единица_измерения], [цена_за_единицу], [серийный_номер], [минимальный_остаток]) VALUES (2, N'Товар 2', N'A002', N'1234567890124', N'Категория 1', N'кг', CAST(200.00 AS Decimal(10, 2)), N'SN002', 5)
GO
INSERT [dbo].[Товары] ([id], [название], [артикул], [штрихкод], [категория], [единица_измерения], [цена_за_единицу], [серийный_номер], [минимальный_остаток]) VALUES (3, N'Товар 3', N'A003', N'1234567890125', N'Категория 2', N'литры', CAST(150.00 AS Decimal(10, 2)), N'SN003', 20)
GO
INSERT [dbo].[Товары] ([id], [название], [артикул], [штрихкод], [категория], [единица_измерения], [цена_за_единицу], [серийный_номер], [минимальный_остаток]) VALUES (4, N'Товар 4', N'A004', N'1234567890126', N'Категория 2', N'шт.', CAST(50.00 AS Decimal(10, 2)), N'SN004', 15)
GO
SET IDENTITY_INSERT [dbo].[Товары] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары_в_заказах] ON 
GO
INSERT [dbo].[Товары_в_заказах] ([id], [заказ_id], [товар_id], [количество], [цена]) VALUES (1, 1, 1, 5, CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_заказах] ([id], [заказ_id], [товар_id], [количество], [цена]) VALUES (2, 1, 2, 3, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_заказах] ([id], [заказ_id], [товар_id], [количество], [цена]) VALUES (3, 2, 3, 10, CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_заказах] ([id], [заказ_id], [товар_id], [количество], [цена]) VALUES (4, 2, 4, 5, CAST(50.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Товары_в_заказах] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары_в_приходных_накладных] ON 
GO
INSERT [dbo].[Товары_в_приходных_накладных] ([id], [приходная_накладная_id], [товар_id], [количество], [цена]) VALUES (1, 1, 1, 10, CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_приходных_накладных] ([id], [приходная_накладная_id], [товар_id], [количество], [цена]) VALUES (2, 1, 2, 5, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_приходных_накладных] ([id], [приходная_накладная_id], [товар_id], [количество], [цена]) VALUES (3, 2, 3, 20, CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_приходных_накладных] ([id], [приходная_накладная_id], [товар_id], [количество], [цена]) VALUES (4, 2, 4, 15, CAST(50.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Товары_в_приходных_накладных] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары_в_расходных_накладных] ON 
GO
INSERT [dbo].[Товары_в_расходных_накладных] ([id], [расходная_накладная_id], [товар_id], [количество], [цена]) VALUES (2, 1, 1, 5, CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_расходных_накладных] ([id], [расходная_накладная_id], [товар_id], [количество], [цена]) VALUES (3, 1, 2, 3, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_расходных_накладных] ([id], [расходная_накладная_id], [товар_id], [количество], [цена]) VALUES (4, 2, 3, 10, CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Товары_в_расходных_накладных] ([id], [расходная_накладная_id], [товар_id], [количество], [цена]) VALUES (5, 2, 4, 5, CAST(50.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Товары_в_расходных_накладных] OFF
GO
SET IDENTITY_INSERT [dbo].[Товары_на_складе] ON 
GO
INSERT [dbo].[Товары_на_складе] ([id], [товар_id], [склад_id], [количество]) VALUES (1, 1, 1, 50)
GO
INSERT [dbo].[Товары_на_складе] ([id], [товар_id], [склад_id], [количество]) VALUES (2, 2, 1, 30)
GO
INSERT [dbo].[Товары_на_складе] ([id], [товар_id], [склад_id], [количество]) VALUES (3, 3, 2, 20)
GO
INSERT [dbo].[Товары_на_складе] ([id], [товар_id], [склад_id], [количество]) VALUES (4, 4, 2, 15)
GO
SET IDENTITY_INSERT [dbo].[Товары_на_складе] OFF
GO
SET IDENTITY_INSERT [dbo].[Характеристики_складов] ON 
GO
INSERT [dbo].[Характеристики_складов] ([id], [склад_id], [площадь], [емкость]) VALUES (1, 1, CAST(1000.00 AS Decimal(10, 2)), 200)
GO
INSERT [dbo].[Характеристики_складов] ([id], [склад_id], [площадь], [емкость]) VALUES (2, 2, CAST(500.00 AS Decimal(10, 2)), 100)
GO
SET IDENTITY_INSERT [dbo].[Характеристики_складов] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Пользова__AB6E6164224F3245]    Script Date: 26.02.2025 16:51:34 ******/
ALTER TABLE [dbo].[Пользователи] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD FOREIGN KEY([клиент_id])
REFERENCES [dbo].[Клиенты] ([id])
GO
ALTER TABLE [dbo].[Зоны_хранения]  WITH CHECK ADD FOREIGN KEY([склад_id])
REFERENCES [dbo].[Склады] ([id])
GO
ALTER TABLE [dbo].[История_заказов]  WITH CHECK ADD FOREIGN KEY([заказ_id])
REFERENCES [dbo].[Заказы] ([id])
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD FOREIGN KEY([роль_id])
REFERENCES [dbo].[Роли] ([id])
GO
ALTER TABLE [dbo].[Приходные_накладные]  WITH CHECK ADD FOREIGN KEY([поставщик_id])
REFERENCES [dbo].[Поставщики] ([id])
GO
ALTER TABLE [dbo].[Расходные_накладные]  WITH CHECK ADD FOREIGN KEY([клиент_id])
REFERENCES [dbo].[Клиенты] ([id])
GO
ALTER TABLE [dbo].[Склады]  WITH CHECK ADD FOREIGN KEY([тип_склада_id])
REFERENCES [dbo].[Типы_складов] ([id])
GO
ALTER TABLE [dbo].[Товары_в_заказах]  WITH CHECK ADD FOREIGN KEY([заказ_id])
REFERENCES [dbo].[Заказы] ([id])
GO
ALTER TABLE [dbo].[Товары_в_заказах]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([id])
GO
ALTER TABLE [dbo].[Товары_в_приходных_накладных]  WITH CHECK ADD FOREIGN KEY([приходная_накладная_id])
REFERENCES [dbo].[Приходные_накладные] ([id])
GO
ALTER TABLE [dbo].[Товары_в_приходных_накладных]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([id])
GO
ALTER TABLE [dbo].[Товары_в_расходных_накладных]  WITH CHECK ADD FOREIGN KEY([расходная_накладная_id])
REFERENCES [dbo].[Расходные_накладные] ([id])
GO
ALTER TABLE [dbo].[Товары_в_расходных_накладных]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([id])
GO
ALTER TABLE [dbo].[Товары_на_складе]  WITH CHECK ADD FOREIGN KEY([склад_id])
REFERENCES [dbo].[Склады] ([id])
GO
ALTER TABLE [dbo].[Товары_на_складе]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([id])
GO
ALTER TABLE [dbo].[Характеристики_складов]  WITH CHECK ADD FOREIGN KEY([склад_id])
REFERENCES [dbo].[Склады] ([id])
GO
USE [master]
GO
ALTER DATABASE [Test_Db] SET  READ_WRITE 
GO
