USE [master]
GO

ALTER DATABASE [FurnitureStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurnitureStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurnitureStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurnitureStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurnitureStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurnitureStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurnitureStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurnitureStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurnitureStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurnitureStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurnitureStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurnitureStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurnitureStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurnitureStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurnitureStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurnitureStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurnitureStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurnitureStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FurnitureStore] SET  MULTI_USER 
GO
ALTER DATABASE [FurnitureStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurnitureStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FurnitureStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FurnitureStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FurnitureStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FurnitureStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FurnitureStore] SET QUERY_STORE = OFF
GO
USE [FurnitureStore]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13/05/2021 6:22:04 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](10) NOT NULL,
	[BirthDate] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 13/05/2021 6:22:04 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 13/05/2021 6:22:04 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryDate] [date] NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 13/05/2021 6:22:04 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13/05/2021 6:22:04 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
USE [master]
GO
ALTER DATABASE [FurnitureStore] SET  READ_WRITE 
GO

USE [FurnitureStore]
GO

SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (1, N'Herrod', N'Guerra', CAST(N'1933-10-27' AS Date), N'502-6307', N'577-2571 Dui. Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (2, N'Micah', N'Cardenas', CAST(N'1960-11-23' AS Date), N'666-9725', N'P.O. Box 160, 9095 Mi Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (3, N'Kenneth', N'Curry', CAST(N'1975-03-21' AS Date), N'1-936-857-7924', N'5657 Magna. Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (4, N'Carla', N'Trevino', CAST(N'1993-07-01' AS Date), N'1-752-105-9186', N'P.O. Box 252, 296 Quis Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (5, N'Brody', N'Montgomery', CAST(N'1956-07-10' AS Date), NULL, N'P.O. Box 358, 592 Vestibulum St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (6, N'Xenos', N'Hicks', CAST(N'1988-04-01' AS Date), N'1-926-540-0054', N'Ap #995-5862 Nec Ave')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (7, N'Abel', N'Myers', CAST(N'1983-09-20' AS Date), N'125-3249', N'654-4411 Volutpat Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (8, N'Donovan', N'Kennedy', CAST(N'1967-01-10' AS Date), N'1-110-643-1198', N'Ap #788-2302 Proin Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (9, N'Vivian', N'Glenn', CAST(N'2001-09-17' AS Date), NULL, N'1361 Orci Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (10, N'Dante', N'Weiss', CAST(N'1958-07-28' AS Date), N'1-219-203-6247', N'6859 Sed St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (11, N'Tanek', N'Kemp', CAST(N'1940-01-23' AS Date), N'1-215-185-2982', N'Ap #773-5888 Tempus Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (12, N'Illiana', N'Stephenson', CAST(N'1980-01-03' AS Date), N'1-486-832-2151', N'667-9441 Ipsum St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (13, N'Driscoll', N'Washington', CAST(N'1945-06-02' AS Date), N'715-4647', N'P.O. Box 607, 3852 Amet, Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (14, N'Aileen', N'Erickson', CAST(N'1950-10-03' AS Date), NULL, N'Ap #499-5519 Velit. St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (15, N'Jerry', N'Clements', CAST(N'1971-04-18' AS Date), N'555-6260', N'Ap #364-3529 Lectus Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (16, N'Chaim', N'Kidd', CAST(N'1998-03-12' AS Date), N'848-7219', N'395-4865 Bibendum. Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (17, N'Deirdre', N'Graham', CAST(N'2004-01-04' AS Date), N'1-437-736-5872', N'4387 Lorem, St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (18, N'Lynn', N'Key', CAST(N'1990-07-05' AS Date), N'1-507-746-1318', N'Ap #324-8118 Lectus Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (19, N'Palmer', N'Saunders', CAST(N'1959-03-15' AS Date), N'1-629-714-0137', N'751-9276 Porttitor St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (20, N'Baxter', N'Mcmillan', CAST(N'1949-01-09' AS Date), N'734-4260', N'Ap #682-2350 Tortor. Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (21, N'Marsden', N'Pennington', CAST(N'1982-09-26' AS Date), N'1-451-786-6560', N'745-389 Vitae, Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (22, N'Justina', N'Leach', CAST(N'1972-07-02' AS Date), N'1-596-707-5792', N'P.O. Box 546, 154 Lorem Ave')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (23, N'Leo', N'Lewis', CAST(N'1931-02-26' AS Date), N'1-296-790-6516', N'P.O. Box 650, 6251 Sed Ave')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (24, N'Selma', N'Hickman', CAST(N'1940-01-21' AS Date), N'924-7379', N'P.O. Box 614, 1488 Integer Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (25, N'Gay', N'Crane', CAST(N'1947-09-15' AS Date), N'586-2174', N'P.O. Box 846, 9371 Mauris Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (26, N'Aimee', N'Flores', CAST(N'1947-01-31' AS Date), N'1-973-787-7561', N'2027 Metus Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (27, N'Stuart', N'Fowler', CAST(N'1971-11-13' AS Date), N'1-100-207-0659', N'472-3794 Sed Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (28, N'Quintessa', N'Vargas', CAST(N'1944-02-09' AS Date), N'1-539-359-8334', N'856-3941 Augue St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (29, N'Perry', N'Walton', CAST(N'1984-05-13' AS Date), N'217-4122', N'817-2868 Suspendisse Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (30, N'Drake', N'Stewart', CAST(N'1965-01-30' AS Date), N'378-3770', N'Ap #922-731 Mauris Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (31, N'Brianna', N'Randolph', CAST(N'1961-07-12' AS Date), N'558-7096', N'Ap #667-5050 Proin Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (32, N'Deanna', N'Duffy', CAST(N'1987-02-27' AS Date), N'575-6829', N'9104 Felis Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (33, N'Jerry', N'Markus', CAST(N'1979-07-19' AS Date), N'1-713-767-1745', N'P.O. Box 703, 1214 Lorem Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (34, N'Jasmine', N'Mccullough', CAST(N'1995-04-17' AS Date), N'1-535-812-6098', N'812-5035 Enim. St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (35, N'Ifeoma', N'Morrison', CAST(N'1946-09-19' AS Date), N'148-4862', N'Ap #395-1448 Integer St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (36, N'Mariko', N'Avila', CAST(N'1990-10-11' AS Date), N'1-401-293-0390', N'5756 Ligula. St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (37, N'Willa', N'Faulkner', CAST(N'1991-06-12' AS Date), N'1-655-136-7891', N'4463 Vivamus Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (38, N'Angela', N'Mcneil', CAST(N'1932-05-13' AS Date), N'1-754-849-5720', N'P.O. Box 366, 1563 Sagittis St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (39, N'Cooper', N'Fuller', CAST(N'1974-10-30' AS Date), N'1-382-638-1344', N'Ap #293-4829 Sagittis Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (40, N'Kyle', N'Kent', CAST(N'1999-06-24' AS Date), N'1-810-497-4027', N'320-1413 Facilisis Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (41, N'Charles', N'Day', CAST(N'1989-03-31' AS Date), N'102-9085', N'Ap #243-4334 Aenean Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (42, N'Drew', N'Mccullough', CAST(N'1977-10-24' AS Date), N'1-604-121-9429', N'P.O. Box 455, 7457 Mi Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (43, N'Joshua', N'Mccullough', CAST(N'1983-05-04' AS Date), N'523-0514', N'9379 Vulputate Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (44, N'Amery', N'Cotton', CAST(N'1999-06-28' AS Date), N'1-108-399-6030', N'Ap #136-9739 Ut Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (45, N'Kristen', N'Hickman', CAST(N'1971-07-26' AS Date), N'953-3552', N'Ap #467-2887 Interdum Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (46, N'Baker', N'Justice', CAST(N'1961-08-15' AS Date), N'980-5102', N'406-5813 Posuere Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (47, N'Xena', N'Gray', CAST(N'1955-09-08' AS Date), N'1-632-778-0876', N'165-4027 Enim Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (48, N'Mufutau', N'Santana', CAST(N'2001-06-03' AS Date), N'914-0133', N'Ap #735-8192 Risus, Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (49, N'Aline', N'Alvarez', CAST(N'1949-11-20' AS Date), N'697-5188', N'Ap #169-8879 Justo Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (50, N'Buckminster', N'Moran', CAST(N'1990-07-10' AS Date), N'1-200-367-9627', N'766-6599 Erat Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (51, N'Ivory', N'Barron', CAST(N'1992-04-26' AS Date), N'1-874-926-8250', N'3542 Velit. Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (52, N'Ray', N'Dickerson', CAST(N'1932-10-16' AS Date), N'159-5258', N'179-6836 Egestas Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (53, N'Lucian', N'Kane', CAST(N'2001-09-06' AS Date), N'672-7657', N'599-2028 Eu, Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (54, N'Mia', N'Mendoza', CAST(N'1934-03-16' AS Date), N'1-131-758-0509', N'282-5290 Natoque St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (55, N'Lyle', N'Duffy', CAST(N'1965-02-20' AS Date), N'1-796-342-5611', N'703 Aliquam St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (56, N'Peter', N'Jefferson', CAST(N'1952-02-08' AS Date), N'961-0973', N'P.O. Box 614, 8465 Natoque Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (57, N'Tarik', N'Maynard', CAST(N'1963-12-28' AS Date), N'495-3555', N'392-5403 Sed Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (58, N'Nora', N'Cabrera', CAST(N'1999-08-26' AS Date), N'1-102-247-7941', N'357-6428 Cras Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (59, N'Rajah', N'Oneil', CAST(N'1948-09-22' AS Date), N'1-163-333-0107', N'Ap #792-532 Quam. Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (60, N'Dorian', N'Stewart', CAST(N'1988-02-23' AS Date), N'485-0276', N'P.O. Box 815, 7369 Nibh St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (61, N'Paki', N'Pennington', CAST(N'1962-04-11' AS Date), N'867-4518', N'P.O. Box 425, 5058 Fermentum St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (62, N'Lee', N'Christian', CAST(N'1996-09-30' AS Date), N'1-913-671-6550', N'7044 Est St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (63, N'Daryl', N'Case', CAST(N'1991-02-17' AS Date), N'1-233-322-2103', N'323-9397 Integer Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (64, N'Demetrius', N'Guerrero', CAST(N'1983-11-21' AS Date), N'745-9886', N'2016 Ipsum Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (65, N'Kathleen', N'Morales', CAST(N'1942-05-08' AS Date), N'1-164-186-7233', N'113-3766 Donec Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (66, N'Giselle', N'Gay', CAST(N'1965-05-24' AS Date), N'1-112-197-6180', N'720-529 Justo Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (67, N'Georgia', N'Aguirre', CAST(N'1960-01-19' AS Date), N'163-8995', N'Ap #849-2102 Diam Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (68, N'Yvonne', N'Harding', CAST(N'1936-07-20' AS Date), N'391-4835', N'791-2050 Hymenaeos. Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (69, N'Virginia', N'Ball', CAST(N'1974-02-03' AS Date), N'663-2150', N'302-6273 Euismod Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (70, N'Moana', N'Daugherty', CAST(N'1956-04-01' AS Date), N'738-7782', N'855-3692 Nunc Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (71, N'Xena', N'Hendricks', CAST(N'1989-10-04' AS Date), N'1-449-831-0149', N'Ap #328-9952 Venenatis Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (72, N'Harlan', N'Coleman', CAST(N'1962-10-10' AS Date), N'199-5235', N'6730 Quis Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (73, N'Amethyst', N'Mullins', CAST(N'1977-11-30' AS Date), N'578-2008', N'366-3638 Dolor Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (74, N'Keith', N'Myers', CAST(N'1967-11-26' AS Date), N'1-961-255-5202', N'P.O. Box 576, 4038 Dictum Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (75, N'Mia', N'Berger', CAST(N'1980-11-13' AS Date), N'409-6237', N'P.O. Box 476, 9187 Et, Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (76, N'Astra', N'Walton', CAST(N'1952-02-28' AS Date), N'641-1713', N'P.O. Box 766, 4222 Amet Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (77, N'Quyn', N'Carey', CAST(N'1962-10-02' AS Date), N'1-438-907-9280', N'P.O. Box 170, 8791 Commodo Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (78, N'Yetta', N'Jefferson', CAST(N'1962-05-23' AS Date), N'1-846-128-8045', N'1481 Ac, Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (79, N'Justine', N'Beck', CAST(N'1941-09-19' AS Date), N'294-7975', N'3361 Nisi. St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (80, N'Carly', N'Carter', CAST(N'1983-09-01' AS Date), N'1-515-878-6676', N'P.O. Box 360, 7669 Mauris Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (81, N'Halee', N'Reeves', CAST(N'1932-05-13' AS Date), N'764-4615', N'873 Phasellus St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (82, N'Hu', N'Cain', CAST(N'1991-02-13' AS Date), N'1-169-923-1326', N'8414 Tristique St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (83, N'Britanney', N'Page', CAST(N'1980-06-07' AS Date), N'1-215-612-0604', N'833-1515 Pellentesque Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (84, N'Charles', N'Mcneil', CAST(N'1945-02-21' AS Date), N'1-847-504-0807', N'689-859 Fermentum Avenue')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (85, N'Kieran', N'Cooley', CAST(N'1934-10-07' AS Date), N'388-1999', N'P.O. Box 551, 7853 Massa Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (86, N'Uriah', N'Jefferson', CAST(N'1990-03-31' AS Date), N'996-2932', N'3932 Ultrices, Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (87, N'Amanda', N'Rasmussen', CAST(N'1971-02-22' AS Date), N'1-284-610-5765', N'P.O. Box 721, 6190 Faucibus Ave')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (88, N'Nelle', N'Hicks', CAST(N'1997-06-08' AS Date), N'1-404-770-9086', N'314 Amet Ave')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (89, N'Cole', N'Cohen', CAST(N'1932-09-07' AS Date), N'1-375-832-4987', N'P.O. Box 138, 9556 Consectetuer Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (90, N'Zachery', N'Hardin', CAST(N'1934-09-28' AS Date), N'220-1297', N'P.O. Box 429, 7068 In St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (91, N'Zena', N'David', CAST(N'1998-09-22' AS Date), N'263-9631', N'Ap #710-7273 Bibendum. Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (92, N'Callum', N'Cash', CAST(N'1963-08-30' AS Date), N'158-8897', N'6833 Vitae, Av.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (93, N'Ima', N'Bush', CAST(N'1937-07-28' AS Date), N'923-8675', N'Ap #514-6301 Duis Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (94, N'Charles', N'Kent', CAST(N'1942-11-27' AS Date), N'862-4949', N'P.O. Box 680, 7306 Sit Rd.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (95, N'Cameron', N'Obrien', CAST(N'1970-05-25' AS Date), N'768-3716', N'P.O. Box 178, 7989 Egestas St.')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (96, N'Ezra', N'Frederick', CAST(N'1964-06-16' AS Date), N'778-7891', N'Ap #971-8117 Suspendisse Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (97, N'Sawyer', N'Simon', CAST(N'2003-05-05' AS Date), N'1-323-520-2977', N'7221 Libero. Road')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (98, N'Jonah', N'Alexander', CAST(N'1933-06-14' AS Date), N'1-705-179-6065', N'9013 Porta Street')
INSERT [dbo].[Clients] ([Id], [FirstName], [LastName], [BirthDate], [Phone], [Address]) VALUES (99, N'Glenna', N'Kidd', CAST(N'1976-10-01' AS Date), N'746-1945', N'Ap #820-5009 Vel Rd.')

SET IDENTITY_INSERT [dbo].[Clients] OFF

SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (1, N'Sofas')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (2, N'Armchairs')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (3, N'Chairs')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (4, N'Tables')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (5, N'Bookcases')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (6, N'Beds')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (7, N'Wardrobes')

SET IDENTITY_INSERT [dbo].[ProductCategories] OFF

SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (1, N'3 seater fabric sofa', CAST(3916.86 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (2, N'2 seater fabric sofa', CAST(2587.12 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (3, N'Sectional sofa', CAST(1643.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (4, N'Modular sofa', CAST(4321.32 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (5, N'Armchair with armrest',  CAST(543.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (6, N'Armchair with removable armrest', CAST(873.15 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (7, N'Easy chair', CAST(249.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (8, N'Swivel armchair', CAST(344.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (9, N'Plastic chair with armrest', CAST(189.49 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (10, N'Polyethylene chair', CAST(873.15 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (11, N'Fabric chair', CAST(87.99 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (12, N'Leather chair', CAST(196.55 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (13, N'Rectangular table', CAST(538.24 AS Decimal(18, 2)), 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (14, N'Oval marble table', CAST(766.15 AS Decimal(18, 2)), 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (15, N'Round dining table', CAST(412.99 AS Decimal(18, 2)), 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (16, N'Extending rectangular table', CAST(358.99 AS Decimal(18, 2)), 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (17, N'Open wood and class bookcase', CAST(143.22 AS Decimal(18, 2)), 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (18, N'Open wooden bookcase', CAST(234.15 AS Decimal(18, 2)), 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (19, N'Modular wood bookcase', CAST(339.99 AS Decimal(18, 2)), 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (20, N'Wall-mounted bookcase', CAST(412.99 AS Decimal(18, 2)), 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (21, N'Solid wood bed', CAST(2965.11 AS Decimal(18, 2)), 6)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (22, N'Fabric double bed', CAST(3467.66 AS Decimal(18, 2)), 6)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (23, N'Leather double bed', CAST(2872.99 AS Decimal(18, 2)), 6)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (24, N'Storage bed with removable covers', CAST(1978.77 AS Decimal(18, 2)), 6)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (25, N'Glass wardrobe', CAST(1762.11 AS Decimal(18, 2)), 7)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (26, N'Wood and glass wardrobe', CAST(1432.32 AS Decimal(18, 2)), 7)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (27, N'Highboard wardrobe', CAST(1765.22 AS Decimal(18, 2)), 7)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (28, N'Aluminium wardrobe', CAST(1897.12 AS Decimal(18, 2)), 7)

SET IDENTITY_INSERT [dbo].[Products] OFF 