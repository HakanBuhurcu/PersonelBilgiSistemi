USE [master]
GO
/****** Object:  Database [TelefonRehberi]    Script Date: 29.4.2019 16:32:42 ******/
CREATE DATABASE [TelefonRehberi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TelefonRehberi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TelefonRehberi.mdf' , SIZE = 3840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TelefonRehberi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TelefonRehberi_log.ldf' , SIZE = 1352KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [TelefonRehberi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TelefonRehberi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TelefonRehberi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TelefonRehberi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TelefonRehberi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TelefonRehberi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TelefonRehberi] SET ARITHABORT OFF 
GO
ALTER DATABASE [TelefonRehberi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TelefonRehberi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TelefonRehberi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TelefonRehberi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TelefonRehberi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TelefonRehberi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TelefonRehberi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TelefonRehberi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TelefonRehberi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TelefonRehberi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TelefonRehberi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TelefonRehberi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TelefonRehberi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TelefonRehberi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TelefonRehberi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TelefonRehberi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TelefonRehberi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TelefonRehberi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TelefonRehberi] SET  MULTI_USER 
GO
ALTER DATABASE [TelefonRehberi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TelefonRehberi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TelefonRehberi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TelefonRehberi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TelefonRehberi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TelefonRehberi] SET QUERY_STORE = OFF
GO
USE [TelefonRehberi]
GO
/****** Object:  Table [dbo].[Departmanlar]    Script Date: 29.4.2019 16:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmanlar](
	[DepID] [int] IDENTITY(1,1) NOT NULL,
	[DepAd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departmanlar] PRIMARY KEY CLUSTERED 
(
	[DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 29.4.2019 16:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [varchar](50) NOT NULL,
	[Parola] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 29.4.2019 16:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](50) NOT NULL,
	[Telefon] [varchar](50) NOT NULL,
	[YoneticiID] [int] NULL,
	[DepartmanID] [int] NOT NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departmanlar] ON 

INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (1, N'Bilgi İşlem')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (2, N'Pazarlama')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (3, N'Hukuk')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (4, N'İnsan Kaynakları')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (5, N'Satış')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (6, N'Üretim ve Ar -GE')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (7, N'Reklam')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (8, N'Yönetim')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (56, N'Muhasabe')
INSERT [dbo].[Departmanlar] ([DepID], [DepAd]) VALUES (91, N'Satın alma')
SET IDENTITY_INSERT [dbo].[Departmanlar] OFF
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciID], [KullaniciAd], [Parola]) VALUES (1, N'Admin', N'123')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (1, N'Hakan', N'BUHURCU', N'531 402 05 18', NULL, 1)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (2, N'Furkan', N'KAPLAN', N'538 459 01 34', NULL, 1)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (4, N'Yunus', N'AKÇA', N'532 305 21 41', NULL, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (5, N'Ayşe', N'TEKİN', N'538 540 60 54 ', 4, 4)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (17, N'Selma', N'DEMİRCİ', N'526 452 10 25', 5, 5)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (18, N'Fatma', N'KARDELEN', N'505 414 25 26', 4, 5)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (28, N'Erdem', N'YILMAZ', N'523 651 45 14', 2, 1)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (30, N'Büşra Cansu', N'KARVEL', N'505 624 52 65', 1, 1)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (31, N'Melis', N'ÖZER', N'520 252 64 58', 1, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (63, N'Fatih Salih', N'KAHRAMAN', N'532 256 52 65', 5, 4)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (64, N'Serdar', N'TURHAN', N'552 451 14 36', 5, 4)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (65, N'Emine', N'KARA', N'535 452 14 87', 28, 6)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (68, N'Burcu', N'DURAK', N'535 624 14 25', 64, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (74, N'Salih', N'DEMİRCİ', N'532 526 25 14', 18, 7)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (82, N'Alphan', N'GEZER', N'535 540 01 34', NULL, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (103, N'Kemal', N'YILDIRIM', N'541 235 65 14', 5, 3)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (104, N'Mehmet', N'TOPÇU', N'538 662 12 77', 17, 6)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (105, N'Salih', N'GÜNER', N'532 145 26 24', 2, 3)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (109, N'Kübra', N'ŞEN', N'536 542 14 26', 110, 3)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (110, N'Orhan', N'ÇETİN', N'532 141 25 26', NULL, 3)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (111, N'Kadir', N'YAVUZ', N'532 542 05 17', 110, 3)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (112, N'Bekir', N'GÜNEŞ', N'534 415 21 26', NULL, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (113, N'Osman', N'ÖZKAN', N'534 415 26 37', 112, 2)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (114, N'Demet', N'YALÇIN', N'532 452 01 12', NULL, 4)
INSERT [dbo].[Personeller] ([PersonelID], [Ad], [Soyad], [Telefon], [YoneticiID], [DepartmanID]) VALUES (139, N'Buse', N'ASLAN', N'535 452 14 75', 114, 4)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Departmanlar] FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departmanlar] ([DepID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Departmanlar]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Personeller] FOREIGN KEY([YoneticiID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Personeller]
GO
USE [master]
GO
ALTER DATABASE [TelefonRehberi] SET  READ_WRITE 
GO
