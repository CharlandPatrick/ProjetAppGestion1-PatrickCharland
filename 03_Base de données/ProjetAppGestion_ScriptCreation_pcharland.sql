USE [master]
GO
/****** Object:  Database [SigmaProtocolBD]    Script Date: 2017-05-06 11:20:02 ******/
CREATE DATABASE [SigmaProtocolBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SigmaProtocolBD', FILENAME = N'C:\Users\blupp\SigmaProtocolBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SigmaProtocolBD_log', FILENAME = N'C:\Users\blupp\SigmaProtocolBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SigmaProtocolBD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SigmaProtocolBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SigmaProtocolBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SigmaProtocolBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SigmaProtocolBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SigmaProtocolBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SigmaProtocolBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SigmaProtocolBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SigmaProtocolBD] SET  MULTI_USER 
GO
ALTER DATABASE [SigmaProtocolBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SigmaProtocolBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SigmaProtocolBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SigmaProtocolBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SigmaProtocolBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SigmaProtocolBD] SET QUERY_STORE = OFF
GO
USE [SigmaProtocolBD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SigmaProtocolBD]
GO
/****** Object:  Table [dbo].[Armes]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](max) NOT NULL,
	[distanceCourte] [nvarchar](max) NOT NULL,
	[distanceLongue] [nvarchar](max) NOT NULL,
	[dommage] [nvarchar](max) NOT NULL,
	[teteAtteinte] [nvarchar](max) NOT NULL,
	[UnitesSpeciale_Id] [int] NOT NULL,
	[ArmesType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Armes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArmesEmportees]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmesEmportees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Personnage_Id] [int] NOT NULL,
	[Arme_Id] [int] NOT NULL,
 CONSTRAINT [PK_ArmesEmportees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArmesMotsCles]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmesMotsCles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Arme_Id] [int] NOT NULL,
	[MotsCle_Id] [int] NOT NULL,
 CONSTRAINT [PK_ArmesMotsCles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArmesTypes]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](16) NOT NULL,
 CONSTRAINT [PK_ArmesTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Armures]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[modele] [nchar](32) NOT NULL,
	[bonus] [int] NOT NULL,
	[absortion] [int] NOT NULL,
	[vitesse] [int] NOT NULL,
	[EquipementsID] [int] NOT NULL,
 CONSTRAINT [PK_Armures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributs]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nchar](32) NOT NULL,
	[combat] [int] NOT NULL,
	[tir] [int] NOT NULL,
	[eveil] [int] NOT NULL,
	[furtivite] [int] NOT NULL,
	[resistence] [int] NOT NULL,
	[leadership] [int] NOT NULL,
	[formePhysique] [int] NOT NULL,
	[capaciteTechnique] [int] NOT NULL,
 CONSTRAINT [PK_Attributs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BonusAttributs]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BonusAttributs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bonusAttribut] [nvarchar](max) NOT NULL,
	[valeur] [int] NOT NULL,
 CONSTRAINT [PK_BonusAttributs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassesArmesTypes]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesArmesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassesSoldat_Id] [int] NOT NULL,
	[ArmesType_Id] [int] NOT NULL,
 CONSTRAINT [PK_ClassesArmesTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassesSoldats]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesSoldats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](16) NOT NULL,
	[bonus] [nchar](128) NOT NULL,
 CONSTRAINT [PK_ClassesSoldats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipementEmportes]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipementEmportes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
	[entraine] [bit] NOT NULL,
	[Personnage_Id] [int] NOT NULL,
	[Equipement_Id] [int] NOT NULL,
 CONSTRAINT [PK_EquipementEmportes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipements]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
	[nonEntraine] [nchar](128) NOT NULL,
	[entraine] [nchar](128) NOT NULL,
	[Armures_Id] [int] NOT NULL,
	[Type] [nchar](16) NULL,
 CONSTRAINT [PK_Equipements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipementSpecialites]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipementSpecialites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialitesSecondaire_Id] [int] NOT NULL,
	[Equipements_Id] [int] NOT NULL,
 CONSTRAINT [PK_EquipementSpecialites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Joueurs]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Joueurs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[prenom] [nchar](32) NOT NULL,
 CONSTRAINT [PK_Joueurs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Langages]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Langages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Langages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManoeuvresTactiques]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManoeuvresTactiques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ManoeuvresTactiques] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MotsCles]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotsCles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](16) NOT NULL,
	[effet] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MotsCles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personnages]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[prenom] [nchar](32) NOT NULL,
	[nom] [nchar](32) NOT NULL,
	[nomDeCode] [nchar](16) NOT NULL,
	[niveau] [int] NOT NULL,
	[descriptionPhsique] [nvarchar](max) NOT NULL,
	[biographie] [nvarchar](max) NOT NULL,
	[SpecialitesSecondaire_Id] [int] NOT NULL,
	[UnitesSpeciales_Id] [int] NOT NULL,
	[ClassesSoldat_Id] [int] NOT NULL,
	[SpecialitesPrimaire_Id] [int] NOT NULL,
	[Joueur_Id] [int] NOT NULL,
	[Attribut_Id] [int] NOT NULL,
 CONSTRAINT [PK_Personnages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialitesPrimaires]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialitesPrimaires](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
	[ManoeuvresTactique_Id] [int] NOT NULL,
 CONSTRAINT [PK_SpecialitesPrimaires] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialitesPrimairesBonus]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialitesPrimairesBonus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialitesPrimaire_Id] [int] NOT NULL,
	[BonusAttribut_Id] [int] NOT NULL,
 CONSTRAINT [PK_SpecialitesPrimairesBonus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialitesPrmairesBonus]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialitesPrmairesBonus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialitesPrimaire_Id] [int] NOT NULL,
	[BonusAttribut_Id] [int] NOT NULL,
 CONSTRAINT [PK_SpecialitesPrmairesBonus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialitesSecondaires]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialitesSecondaires](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
 CONSTRAINT [PK_SpecialitesSecondaires] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitesSpeciales]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitesSpeciales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nchar](32) NOT NULL,
 CONSTRAINT [PK_UnitesSpeciales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitesSpecialesLangages]    Script Date: 2017-05-06 11:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitesSpecialesLangages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitesSpeciale_Id] [int] NOT NULL,
	[Langage_Id] [int] NOT NULL,
 CONSTRAINT [PK_UnitesSpecialesLangages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Armes] ON 

INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (3, N'92fs', N'5', N'10', N'3', N'0', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (4, N'Desert Eagle', N'4', N'8', N'4', N'0', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (5, N'Mk.23', N'5', N'10', N'2', N'18', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (8, N'G17', N'6', N'12', N'3', N'0', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (9, N'Riot Revolver', N'4', N'8', N'2', N'0', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (10, N'Taser', N'3', N'6', N'6', N'10', 1, 2)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (11, N'MP5', N'6', N'12', N'4', N'0', 1, 3)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (12, N'MP5-SD', N'8', N'16', N'3', N'18', 1, 3)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (13, N'UMP 45', N'5', N'10', N'5', N'0', 1, 3)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (14, N'P90', N'5', N'10', N'3', N'0', 1, 3)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (15, N'AK-47', N'8', N'16', N'6', N'0', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (16, N'M4', N'12', N'24', N'4', N'18', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (17, N'L85A2', N'8', N'16', N'6', N'0', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (18, N'FAMAS', N'10', N'20', N'5', N'0', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (19, N'Steyr AUG', N'12', N'24', N'4', N'0', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (20, N'G36k', N'10', N'20', N'5', N'0', 1, 4)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (21, N'M249', N'10', N'20', N'4', N'0', 1, 5)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (22, N'RPD', N'10', N'20', N'6', N'0', 1, 5)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (23, N'M60', N'6', N'12', N'6', N'0', 1, 5)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (24, N'HK11', N'8', N'16', N'5', N'0', 1, 5)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (25, N'SL8', N'18', N'36', N'7', N'18', 1, 6)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (26, N'Dragunov', N'20', N'40', N'8', N'19', 1, 6)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (27, N'M82A1', N'20', N'40', N'8', N'19', 1, 6)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (28, N'AWS Covert', N'22', N'44', N'6', N'19', 1, 6)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (29, N'Saiga 20', N'5', N'10', N'3', N'0', 1, 7)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (30, N'Jackhammer', N'6', N'12', N'10', N'0', 1, 7)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (31, N'Mossberg 590', N'8', N'16', N'3', N'0', 1, 7)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (32, N'USAS-12', N'5', N'10', N'4', N'0', 1, 7)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (34, N'Riot Shotgun', N'5', N'10', N'4', N'0', 1, 7)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (36, N'Fragmentation', N'5', N'10', N'4', N'0', 1, 8)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (37, N'Flashbang', N'8', N'16', N'6', N'0', 1, 8)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (38, N'Fumigène', N'6', N'12', N'0', N'0', 1, 8)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (39, N'Lacrimogène', N'6', N'12', N'6', N'0', 1, 8)
INSERT [dbo].[Armes] ([Id], [nom], [distanceCourte], [distanceLongue], [dommage], [teteAtteinte], [UnitesSpeciale_Id], [ArmesType_Id]) VALUES (40, N'Incendiaire', N'5', N'10', N'4', N'0', 1, 8)
SET IDENTITY_INSERT [dbo].[Armes] OFF
SET IDENTITY_INSERT [dbo].[ArmesEmportees] ON 

INSERT [dbo].[ArmesEmportees] ([Id], [Personnage_Id], [Arme_Id]) VALUES (1, 1, 3)
INSERT [dbo].[ArmesEmportees] ([Id], [Personnage_Id], [Arme_Id]) VALUES (2, 1, 4)
INSERT [dbo].[ArmesEmportees] ([Id], [Personnage_Id], [Arme_Id]) VALUES (3, 2, 5)
INSERT [dbo].[ArmesEmportees] ([Id], [Personnage_Id], [Arme_Id]) VALUES (4, 2, 8)
SET IDENTITY_INSERT [dbo].[ArmesEmportees] OFF
SET IDENTITY_INSERT [dbo].[ArmesMotsCles] ON 

INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (2, 3, 9)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (3, 4, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (4, 5, 10)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (7, 9, 14)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (8, 10, 1)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (9, 10, 14)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (10, 10, 15)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (11, 12, 10)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (12, 14, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (13, 16, 10)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (14, 17, 5)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (16, 18, 5)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (17, 19, 9)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (18, 19, 5)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (19, 21, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (20, 21, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (21, 22, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (22, 22, 6)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (23, 22, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (24, 23, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (25, 23, 6)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (26, 23, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (27, 24, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (28, 24, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (29, 25, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (30, 26, 1)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (31, 26, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (32, 27, 1)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (33, 27, 2)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (34, 27, 6)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (35, 27, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (36, 28, 1)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (37, 28, 10)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (38, 28, 11)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (39, 29, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (40, 30, 4)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (41, 31, 1)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (42, 31, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (43, 32, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (44, 34, 14)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (45, 36, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (47, 37, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (48, 37, 3)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (49, 38, 12)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (50, 39, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (51, 39, 8)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (52, 40, 13)
INSERT [dbo].[ArmesMotsCles] ([Id], [Arme_Id], [MotsCle_Id]) VALUES (54, 40, 7)
SET IDENTITY_INSERT [dbo].[ArmesMotsCles] OFF
SET IDENTITY_INSERT [dbo].[ArmesTypes] ON 

INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (1, N'Mêlée           ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (2, N'Pistolet        ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (3, N'SMG             ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (4, N'Assaut          ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (5, N'Mitraillette    ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (6, N'Sniper          ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (7, N'Shotgun         ')
INSERT [dbo].[ArmesTypes] ([Id], [nom]) VALUES (8, N'Grenade         ')
SET IDENTITY_INSERT [dbo].[ArmesTypes] OFF
SET IDENTITY_INSERT [dbo].[Armures] ON 

INSERT [dbo].[Armures] ([Id], [modele], [bonus], [absortion], [vitesse], [EquipementsID]) VALUES (1, N'Armure Légère                   ', 3, 0, 6, 1)
INSERT [dbo].[Armures] ([Id], [modele], [bonus], [absortion], [vitesse], [EquipementsID]) VALUES (2, N'Armure Médium                   ', 4, 1, 5, 1)
INSERT [dbo].[Armures] ([Id], [modele], [bonus], [absortion], [vitesse], [EquipementsID]) VALUES (3, N'Armure Lourde                   ', 5, 2, 4, 1)
INSERT [dbo].[Armures] ([Id], [modele], [bonus], [absortion], [vitesse], [EquipementsID]) VALUES (4, N'Bouclier Balistique             ', 1, 0, -1, 1)
INSERT [dbo].[Armures] ([Id], [modele], [bonus], [absortion], [vitesse], [EquipementsID]) VALUES (5, N'Casque Balistique               ', 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Armures] OFF
SET IDENTITY_INSERT [dbo].[Attributs] ON 

INSERT [dbo].[Attributs] ([Id], [type], [combat], [tir], [eveil], [furtivite], [resistence], [leadership], [formePhysique], [capaciteTechnique]) VALUES (1, N'Balancé                         ', 15, 14, 14, 13, 12, 10, 10, 8)
INSERT [dbo].[Attributs] ([Id], [type], [combat], [tir], [eveil], [furtivite], [resistence], [leadership], [formePhysique], [capaciteTechnique]) VALUES (2, N'Attaque                         ', 15, 15, 15, 15, 8, 8, 8, 8)
INSERT [dbo].[Attributs] ([Id], [type], [combat], [tir], [eveil], [furtivite], [resistence], [leadership], [formePhysique], [capaciteTechnique]) VALUES (3, N'Défensive                       ', 13, 13, 13, 13, 12, 12, 12, 12)
SET IDENTITY_INSERT [dbo].[Attributs] OFF
SET IDENTITY_INSERT [dbo].[BonusAttributs] ON 

INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (1, N'STL', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (3, N'STL', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (4, N'ATL', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (5, N'ATL', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (6, N'CBT', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (7, N'CBT', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (8, N'TEC', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (9, N'TEC', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (10, N'AWR', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (11, N'AWR', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (12, N'SHT', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (13, N'SHT', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (14, N'RES', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (15, N'RES', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (16, N'LED', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (17, N'LED', 2)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (19, N'ANY', 1)
INSERT [dbo].[BonusAttributs] ([Id], [bonusAttribut], [valeur]) VALUES (20, N'ANY', 2)
SET IDENTITY_INSERT [dbo].[BonusAttributs] OFF
SET IDENTITY_INSERT [dbo].[ClassesArmesTypes] ON 

INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (1, 1, 3)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (2, 1, 4)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (3, 2, 2)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (4, 2, 7)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (5, 3, 2)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (6, 3, 6)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (7, 4, 4)
INSERT [dbo].[ClassesArmesTypes] ([Id], [ClassesSoldat_Id], [ArmesType_Id]) VALUES (9, 4, 5)
SET IDENTITY_INSERT [dbo].[ClassesArmesTypes] OFF
SET IDENTITY_INSERT [dbo].[ClassesSoldats] ON 

INSERT [dbo].[ClassesSoldats] ([Id], [nom], [bonus]) VALUES (1, N'Assaut          ', N'When you are wielding a weapon that you are proficient with, add your proficiency bonus to your initiative test.                ')
INSERT [dbo].[ClassesSoldats] ([Id], [nom], [bonus]) VALUES (2, N'Ingénieur       ', N'You can carry 1 additional tool.                                                                                                ')
INSERT [dbo].[ClassesSoldats] ([Id], [nom], [bonus]) VALUES (3, N'Reconnaissance  ', N'You always have advantage on Stealth check.                                                                                     ')
INSERT [dbo].[ClassesSoldats] ([Id], [nom], [bonus]) VALUES (4, N'Support         ', N'When an ally is being attacked, you can use your reaction to impose disadvantage on the attack roll.                            ')
SET IDENTITY_INSERT [dbo].[ClassesSoldats] OFF
SET IDENTITY_INSERT [dbo].[EquipementEmportes] ON 

INSERT [dbo].[EquipementEmportes] ([Id], [nom], [entraine], [Personnage_Id], [Equipement_Id]) VALUES (1, N'E-1                             ', 0, 1, 15)
INSERT [dbo].[EquipementEmportes] ([Id], [nom], [entraine], [Personnage_Id], [Equipement_Id]) VALUES (2, N'E-2                             ', 1, 2, 6)
SET IDENTITY_INSERT [dbo].[EquipementEmportes] OFF
SET IDENTITY_INSERT [dbo].[Equipements] ON 

INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (1, N'Bullet Proof Suit               ', N'Cumbersome Your armor gains a +1 soak value bonus against bullets.                                                              ', N'Your armor gains a +1 soak value bonus against bullets.                                                                         ', 0, N'Armor           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (2, N'Fire Proof Suit                 ', N'Cumbersome Your armor gains a +1 soak value bonus against fire                                                                  ', N'Your armor gains a +1 soak value bonus against fire.                                                                            ', 0, N'Armor           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (3, N'Blast Proof Suit                ', N'Cumbersome Your armor gains a +1 soak value bonus against explosion.                                                            ', N'Your armor gains a +1 soak value bonus against explosion.                                                                       ', 0, N'Armor           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (4, N'Brass-knuckles Gloves           ', N'Restricted                                                                                                                      ', N'Built-in brass knuckles. Doesn''t take a toolset slot.                                                                           ', 0, N'Armor           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (5, N'Ballistic Helmet                ', N'Restricted                                                                                                                      ', N'Headshot against you must be confirmed.                                                                                         ', 0, N'Armor           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (6, N'Laptop                          ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Computer        ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (7, N'Comm. Scrambler                 ', N'Restricted                                                                                                                      ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Computer        ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (8, N'Electronic Lock Breaker         ', N'Restricted                                                                                                                      ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Computer        ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (9, N'Remote C4                       ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll. Must do a Ready Action to trigger the explosion.                                             ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (10, N'Claymore                        ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (11, N'Breaching charges               ', N'No data                                                                                                                         ', N'Add proficiency to TEC roll.                                                                                                    ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (12, N'Defusing Tools                  ', N'No data                                                                                                                         ', N'Add proficiency to TEC roll.                                                                                                    ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (13, N'Blast Proof Suit                ', N'Restricted                                                                                                                      ', N'Your armor gains a +1 soak value bonus against explosion.                                                                       ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (15, N'Claymore MK2                    ', N'Restricted                                                                                                                      ', N'Spread 2                                                                                                                        ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (16, N'Breaching Charge  MK2           ', N'Restricted                                                                                                                      ', N'Spread 3, Blind                                                                                                                 ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (18, N'Defusing Tool MK2               ', N'Restricted                                                                                                                      ', N'Double proficiency bonus to TEC roll when defusing a bomb.                                                                      ', 0, N'Explosive       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (19, N'Heartbeat Sensor                ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (20, N'Snake Cam                       ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (21, N'Tie Wraps                       ', N'No data                                                                                                                         ', N'Add TEC modifier to DC check when target tries to escape. Doesn''t take a toolset slot.                                          ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (22, N'Taser Gun                       ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (23, N'Heartbeat Sensor MK2            ', N'Restricted                                                                                                                      ', N'Double the range for the heartbeat sensor.                                                                                      ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (24, N'Flying Drone                    ', N'Restricted                                                                                                                      ', N'Can use a remote-controlled flying drone. Add proficiency bonus to TEC roll.                                                    ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (25, N'Rolling Drone                   ', N'Restricted                                                                                                                      ', N'Can use a remote-controlled rolling drone. Add proficiency bonus to TEC roll.                                                   ', 0, N'Gadget          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (26, N'Fragmentation                   ', N'No data                                                                                                                         ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Grenade         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (27, N'Flashbang                       ', N'No data                                                                                                                         ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Grenade         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (28, N'Smoke                           ', N'No data                                                                                                                         ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Grenade         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (29, N'Tear Gas                        ', N'Restricted                                                                                                                      ', N'Can use tear gas grenade. Add proficiency bonus to SHT roll.                                                                    ', 0, N'Grenade         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (30, N'Incendiary                      ', N'Restricted                                                                                                                      ', N'Can use the incendiary grenade. Add proficiency bonus to SHT roll.                                                              ', 0, N'Grenade         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (31, N'Criminal Organisation           ', N'No data                                                                                                                         ', N'Add proficiency bonus to LED roll. Applies when dealing with criminals.                                                         ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (32, N'Public Relation                 ', N'No data                                                                                                                         ', N'Add proficiency bonus to LED roll. Applies when dealing with victims.                                                           ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (33, N'Linguistic                      ', N'Restricted                                                                                                                      ', N'Knows 3 new languages. Doesn''t take a toolset slot.                                                                             ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (34, N'Criminal Organisation Expert    ', N'No data                                                                                                                         ', N'Doesn''t take a toolset slot.                                                                                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (35, N'Public Relation Expert          ', N'No data                                                                                                                         ', N'Doesn''t take a toolset slot.                                                                                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (36, N'Jihad                           ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Applies to any roll. Doesn''t take a toolset slot.                                  ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (37, N'Soviet Nostalgic                ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Applies to any roll. Doesn''t take a toolset slot.                                  ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (38, N'Neo Nazi                        ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (39, N'North Korea                     ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (40, N'Chinese Triad                   ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (41, N'USA White Supremacist           ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (42, N'European Soldier                ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (43, N'Drug Cartel                     ', N'Restricted                                                                                                                      ', N'Double proficiency bonus against that enemy. Apply to any roll. Doesn''t take a toolset slot.                                    ', 0, N'Knowledge       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (44, N'Lockpick                        ', N'No data                                                                                                                         ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Locksmith       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (45, N'Handcuffs                       ', N'No data                                                                                                                         ', N'Add TEC modifier to DC check when target tries to escape.                                                                       ', 0, N'Locksmith       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (46, N'Skeleton Key                    ', N'Restricted                                                                                                                      ', N'Opens any lock.                                                                                                                 ', 0, N'Locksmith       ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (47, N'Hand to hand combat training    ', N'No data                                                                                                                         ', N'Add proficiency bonus to CBT roll.                                                                                              ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (48, N'Black Belt                      ', N'Restricted                                                                                                                      ', N'No saving throw required when using a MArtial Arts Advanced Toolset. Doesn''t take a toolset slot.                               ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (49, N'Judo                            ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Grappling Attack                                                                                       ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (50, N'Choy Lee Fut                    ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Extra Bullet                                                                                           ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (51, N'Krav Maga                       ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Precision Attack                                                                                       ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (52, N'Silat                           ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Evasive Footwork                                                                                       ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (53, N'Aikido                          ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Disarming Shot                                                                                         ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (54, N'Muay Thai                       ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Knockdown                                                                                              ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (55, N'Tae Kwon Do                     ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuvrer: Pushing Attack                                                                                         ', 0, N'Martial Arts    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (58, N'First Aid Kit                   ', N'No data                                                                                                                         ', N'Add proficiency bonus to LED roll to stabilize a target with 0 HP.                                                              ', 0, N'Medical         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (59, N'Adrenaline Syringe              ', N'Gain 1 temporary HP.                                                                                                            ', N'Gain Temporary HP equals to Proficiency Bonus.                                                                                  ', 0, N'Medical         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (60, N'Premier First Aid Kit           ', N'Restricted                                                                                                                      ', N'No roll needed to stabilize a target with 0 HP.                                                                                 ', 0, N'Medical         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (61, N'Adrenaline Syringe XL           ', N'Restricted                                                                                                                      ', N'Gain Temporary HP equals to twice Proficiency Bonus.                                                                            ', 0, N'Medical         ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (62, N'Melee weapons                   ', N'No data                                                                                                                         ', N'Add proficiency bonus to CBT roll while using a melee weapon.                                                                   ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (63, N'K-Bar knife Expert              ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver: Precision Attack                                                                                        ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (64, N'Push Knife Expert               ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver:  Covering Fire                                                                                          ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (65, N'Karambit Knife Expert           ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver: Extra Bullet                                                                                            ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (66, N'Tonfa Expert                    ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver:  Disarming Shot                                                                                         ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (67, N'Anti-Riot Stick Expert          ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver:  Distracting Shot                                                                                       ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (68, N'Garrotte                        ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver:  Grappling Attack                                                                                       ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (69, N'Sledgehammer Expert             ', N'Restricted                                                                                                                      ', N'Free Tactical Maneuver: Knockdown                                                                                               ', 0, N'Melee Weapon    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (70, N'Ballistic Shield                ', N'Cumbersome Cannot wield any weapon at the same time.                                                                            ', N'Can wield a pistol or a SMG while holding a shield.                                                                             ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (71, N'Ballistic Helmet                ', N'No data                                                                                                                         ', N'Headshot against you must be confirmed.                                                                                         ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (72, N'Anti-Riot Stick                 ', N'No data                                                                                                                         ', N'Add proficiency bonus to CBT roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (73, N'Riot Revolver                   ', N'No data                                                                                                                         ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (74, N'Riot Shotgun                    ', N'No data                                                                                                                         ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (75, N'Tie Wraps                       ', N'No data                                                                                                                         ', N'Add TEC Modifier to DC check when target tries to escape. Doesn''t take a toolset slot.                                          ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (76, N'Smoke                           ', N'Restricted                                                                                                                      ', N'Add proficiency bonus to SHT roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (77, N'Taser Gun                       ', N'Restricted                                                                                                                      ', N'Add proficiency bonus to TEC roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (78, N'Anti-Riot Stick Expert          ', N'Restricted                                                                                                                      ', N'Add proficiency bonus to CBT roll.                                                                                              ', 0, N'Riot Control    ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (79, N'Tear Gas Mask                   ', N'Cannot add proficiency bonus to any dice check.                                                                                 ', N'Can add proficiency bonus normally.                                                                                             ', 0, N'Toxic           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (80, N'Tear Gas Grenade                ', N'No data                                                                                                                         ', N'Can use the tear gas grenade. Add proficiency bonus to SHT roll.                                                                ', 0, N'Toxic           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (81, N'Hazmat Suit                     ', N'Restricted                                                                                                                      ', N'Can wear a Hazmat Suit.                                                                                                         ', 0, N'Toxic           ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (82, N'Night Vision Goggle             ', N'Cannot add proficiency bonus to any dice check.                                                                                 ', N'Proficiency Bonus apply normally.                                                                                               ', 0, N'Vision          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (83, N'Thermal Vision Goggles          ', N'Restricted                                                                                                                      ', N'Target cannot gain concealment from environnmental and/or light conditions.                                                     ', 0, N'Vision          ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (84, N'Retractable Stock               ', N'No data                                                                                                                         ', N'Equipped weapon gain Bullpup.                                                                                                   ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (85, N'Forward Grip                    ', N'No data                                                                                                                         ', N'Equipped weapon gain Quick Draw.                                                                                                ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (86, N'Red Dot                         ', N'No data                                                                                                                         ', N'Equipped weapon gain Headshot Threshold -1.                                                                                     ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (87, N'Silencer                        ', N'No data                                                                                                                         ', N'Equipped weapon gain Silenced.                                                                                                  ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (88, N'Scope                           ', N'No data                                                                                                                         ', N'Equipped weapon gain Double Range.                                                                                              ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (89, N'Laser Sight                     ', N'Restricted                                                                                                                      ', N'Equipped weapon gain Headshot Threshold -2.                                                                                     ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (90, N'Piercing Bullets                ', N'Restricted                                                                                                                      ', N'Ignore 1 point of armor''s soak value.                                                                                           ', 0, N'Weapon Mod      ')
INSERT [dbo].[Equipements] ([Id], [nom], [nonEntraine], [entraine], [Armures_Id], [Type]) VALUES (91, N'Tracer Bullets                  ', N'Restricted                                                                                                                      ', N'Double Proficiency Bonus.                                                                                                       ', 0, N'Weapon Mod      ')
SET IDENTITY_INSERT [dbo].[Equipements] OFF
SET IDENTITY_INSERT [dbo].[EquipementSpecialites] ON 

INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (1, 1, 34)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (2, 1, 34)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (3, 2, 58)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (4, 2, 1)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (5, 3, 82)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (6, 3, 24)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (7, 4, 81)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (8, 4, 81)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (9, 5, 31)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (10, 5, 62)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (11, 6, 70)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (12, 6, 47)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (13, 7, 47)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (14, 7, 1)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (15, 8, 19)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (16, 8, 6)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (17, 9, 1)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (18, 9, 62)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (19, 10, 48)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (20, 10, 48)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (21, 11, 84)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (22, 11, 26)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (23, 12, 31)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (24, 12, 82)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (25, 13, 31)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (26, 13, 33)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (27, 14, 84)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (28, 14, 82)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (29, 15, 59)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (30, 15, 59)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (31, 16, 44)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (32, 16, 70)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (33, 17, 1)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (34, 17, 84)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (35, 18, 35)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (36, 18, 35)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (37, 19, 7)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (38, 19, 7)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (39, 20, 19)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (40, 20, 82)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (41, 21, 9)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (42, 21, 44)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (43, 22, 84)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (44, 22, 84)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (45, 23, 62)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (46, 23, 58)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (47, 25, 12)
INSERT [dbo].[EquipementSpecialites] ([Id], [SpecialitesSecondaire_Id], [Equipements_Id]) VALUES (48, 25, 12)
SET IDENTITY_INSERT [dbo].[EquipementSpecialites] OFF
SET IDENTITY_INSERT [dbo].[Joueurs] ON 

INSERT [dbo].[Joueurs] ([Id], [prenom]) VALUES (1, N'Patrick                         ')
INSERT [dbo].[Joueurs] ([Id], [prenom]) VALUES (2, N'Luc                             ')
SET IDENTITY_INSERT [dbo].[Joueurs] OFF
SET IDENTITY_INSERT [dbo].[Langages] ON 

INSERT [dbo].[Langages] ([Id], [nom]) VALUES (1, N'English')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (2, N'French')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (3, N'Spanish')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (4, N'German')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (5, N'Italian')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (6, N'Russian')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (7, N'Chinese')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (8, N'Norwegian')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (9, N'Hebrew')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (10, N'Arabic')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (11, N'Japanese')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (12, N'Polish')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (13, N'Portuguese')
INSERT [dbo].[Langages] ([Id], [nom]) VALUES (14, N'Greek')
SET IDENTITY_INSERT [dbo].[Langages] OFF
SET IDENTITY_INSERT [dbo].[ManoeuvresTactiques] ON 

INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (2, N'Commander’s Strike              ', N'When you take the Attack action on your turn, you can forgo one of your attacks and use a bonus action to direct one ally to strike. When you do so, choose an ally and expend one Tactical Die. That ally can immediately use its reaction to make one attack, adding your Tactical Die to the attack’s damage.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (3, N'Covering Fire                   ', N'When you hit an enemy, you can expend one Tactical Die to maneuver one ally. You add the Tactical Die to the attack’s damage, and you choose an ally. That ally can use its reaction to move up to half its speed without provoking opportunity attacks from the target of your attack.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (4, N'Disarming Shot                  ', N'When you hit an enemy, you can expend one Tactical Die to attempt to disarm the target, forcing it to drop one item of your choice that it’s holding. You add the Tactical Die to the attack’s damage, and the target must make a RES saving throw. On a failed save, it drops the object you choose. The object lands at its feet.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (5, N'Distracting Strike              ', N'When you hit an enemy, you can expend one Tactical Die to distract him, giving your allies an opening. You add your Tactical Die to the attack’s damage. The next attack roll against the target by an ally has advantage if the attack is made before the start of your next turn.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (6, N'Evasive Footwork                ', N'When you move, you can expend one Tactical Die, rolling the die and adding the number rolled to your AC until you stop moving.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (7, N'Extra Bullet                    ', N'When you hit an enemy within short range, you can expend one Tactical Die to attempt to damage another enemy with the same attack. Choose another enemy maximum 3 squares away from the original target. If the original attack roll would hit the second target, it takes damage equal to the number you roll on your Tactical Die.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (8, N'Far Shot                        ', N'When you make an attack on your turn, you can expend one Tactical Die to increase the range for the attack by 50%. If you hit, you add the Tactical Die to the attack’s damage.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (9, N'Feinting Attack                 ', N'You can expend one Tactical Die and use a bonus action on your turn to feint, choosing one enemy within short range. You have advantage on your next attack roll against that enemy. If the attack hits, add the Tactical Die to the attack’s damage.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (10, N'Goading Attack                  ', N'When you hit an enemy, you can expend one Tactical Die to attempt to goad the target into attacking you. You add your Tactical Die to the attack’s damage, and the target must make a LED saving throw. On a failed save, the target has disadvantage on all attack rolls against targets other than you until the end of your next turn.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (11, N'Grappling Attack                ', N'When you hit an enemy, you can expend one Tactical Die to attempt to grapple the target. You add your Tactical Die to the attack’s damage, and the target must make a ATL saving throw. On a failed save, the target is grappled.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (12, N'Knockdown                       ', N'When you hit an enemy, you can expend one Tactical Die to attempt to knock the target down. You add the Tactical Die to the attack’s damage, and the target must make a RES saving throw. On a failed save, you knock the target prone.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (13, N'Menacing Attack                 ', N'When you hit an enemy, you can expend one Tactical Die to attempt to frighten the target. You add the Tactical Die to the attack’s damage, and the target must make a LED saving throw. On a failed save, it is frightened of you until the end of your next turn.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (14, N'Morale Boost                    ', N'On your turn, you can use a bonus action and expend one Tactical Die to bolster the resolve of an ally. When you do so, choose an ally who will gain temporary hit points equal to the Tactical Die plus your LED modifier.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (15, N'Painkillers                     ', N'When an enemy damages you, you can use your reaction and expend one Tactical Die to reduce the damage by the number you roll on your Tactical Die plus your RES modifier.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (16, N'Precision Attack                ', N'When you make an attack roll, you can expend one Tactical Die to add it to the roll.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (17, N'Pushing Attack                  ', N'When you hit an enemy, you can expend one Tactical Die to attempt to drive the target back. You add your Tactical Die to the attack’s damage, and the target must make a LED saving throw. On a failed save, you move the target half its speed away from you.')
INSERT [dbo].[ManoeuvresTactiques] ([Id], [nom], [description]) VALUES (18, N'Riposte                         ', N'When an enemy misses you while within short range, you can use your reaction and expend one Tactical Die to make an attack against that enemy. If you hit, you add your Tactical Die to the attack’s damage.')
SET IDENTITY_INSERT [dbo].[ManoeuvresTactiques] OFF
SET IDENTITY_INSERT [dbo].[MotsCles] ON 

INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (1, N'Ammo X          ', N'Has limited ammo equal to X. Character must use his reaction action in order to reload the weapon.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (2, N'Bipod           ', N'Required the character to remain steady using either the environment or a bipod. When moving, a movement point is needed to set it up.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (3, N'Blind           ', N'This weapon deals non-lethal damage only. Damage point dealt to the character is converted into the number of rounds he is blinded (soak doesn’t apply).')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (4, N'Breach          ', N'Can be used top open doors.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (5, N'Bullpup         ', N'The design of this weapon allows it to not hinder the character when doing rappelling maneuver, hence not giving disadvantage.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (6, N'Cumbersome      ', N'Require an additional tool slot to carry.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (7, N'Fire X          ', N'This weapon deal fire damage overtime. At the start of each round, target
23
suffers X damage. Target cannot take reaction. Taking a full round actions to quench the flames ends the effect.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (8, N'Poison          ', N'This weapon deals non-lethal damage only. Damage point dealt to the character is converted into the number of rounds he is poisoned (soak doesn’t apply).')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (9, N'Quick Draw      ', N'When equipped, gives +2 to the initiative roll. Can be draw/holstered as a free action.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (10, N'Silenced        ', N'Comes equipped with a silencer. If the character has concealment when shooting, the target has disadvantage on his perception check.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (11, N'Slow Draw       ', N'When equipped, gives -2 to the initiative roll. Cost 1 movement point to draw/holstered.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (12, N'Smoke X         ', N'This weapon creates a cloud of smoke on the target’s location and each adjacent square. Target outside of the cloud benefits from three-quarters cover from the clouded target. Effect last for X rounds.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (13, N'Spread X        ', N'Each character adjacent to the target receives X damage (soak applies). Also has the “Breach” keyword.')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (14, N'Stun            ', N'This weapon deals non-lethal damage only. Damage point dealt to the character is converted into the number of rounds he is stunned (soak applies).')
INSERT [dbo].[MotsCles] ([Id], [nom], [effet]) VALUES (15, N'TEC             ', N'Player can use either SHT or TEC attribute.')
SET IDENTITY_INSERT [dbo].[MotsCles] OFF
SET IDENTITY_INSERT [dbo].[Personnages] ON 

INSERT [dbo].[Personnages] ([Id], [prenom], [nom], [nomDeCode], [niveau], [descriptionPhsique], [biographie], [SpecialitesSecondaire_Id], [UnitesSpeciales_Id], [ClassesSoldat_Id], [SpecialitesPrimaire_Id], [Joueur_Id], [Attribut_Id]) VALUES (1, N'Bob                             ', N'Heinstein                       ', N'Rocket          ', 1, N'Grand et fort', N'Vient du Nord', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Personnages] ([Id], [prenom], [nom], [nomDeCode], [niveau], [descriptionPhsique], [biographie], [SpecialitesSecondaire_Id], [UnitesSpeciales_Id], [ClassesSoldat_Id], [SpecialitesPrimaire_Id], [Joueur_Id], [Attribut_Id]) VALUES (2, N'Dand                            ', N'Frima                           ', N'Jam             ', 1, N'Agile', N'Vient du Sud', 2, 2, 2, 6, 2, 3)
INSERT [dbo].[Personnages] ([Id], [prenom], [nom], [nomDeCode], [niveau], [descriptionPhsique], [biographie], [SpecialitesSecondaire_Id], [UnitesSpeciales_Id], [ClassesSoldat_Id], [SpecialitesPrimaire_Id], [Joueur_Id], [Attribut_Id]) VALUES (3, N'Armand                          ', N'Beaulieu                        ', N'Maple           ', 1, N'Grand et barbu', N'Vient du Grand Nord', 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Personnages] OFF
SET IDENTITY_INSERT [dbo].[SpecialitesPrimaires] ON 

INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (1, N'Advanced Recon Division         ', 16)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (4, N'Airborne Infantryman            ', 6)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (5, N'Guerilla Warfare Division       ', 3)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (6, N'Cyber Warfare Division          ', 5)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (7, N'Covert Operation Specialist     ', 18)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (8, N'ERT Division                    ', 5)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (9, N'EOD                             ', 15)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (10, N'Strategic Command Operations    ', 2)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (11, N'Air Defense Artillery Division  ', 8)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (12, N'Armored Assault Vehicle Division', 10)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (13, N'CLASSIFIED                      ', 13)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (14, N'Criminal Investigation Division ', 12)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (15, N'Jungle Warfare                  ', 9)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (16, N'Ordnance R&D                    ', 7)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (17, N'St. Cuthbert Abbey              ', 14)
INSERT [dbo].[SpecialitesPrimaires] ([Id], [nom], [ManoeuvresTactique_Id]) VALUES (18, N'Subversive Operations           ', 17)
SET IDENTITY_INSERT [dbo].[SpecialitesPrimaires] OFF
SET IDENTITY_INSERT [dbo].[SpecialitesPrmairesBonus] ON 

INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (1, 1, 3)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (2, 4, 5)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (3, 5, 7)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (4, 6, 9)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (5, 7, 11)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (6, 8, 12)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (7, 8, 10)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (8, 9, 14)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (9, 9, 8)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (10, 10, 17)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (11, 11, 13)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (12, 12, 15)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (14, 13, 19)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (15, 14, 16)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (16, 14, 8)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (17, 15, 6)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (18, 15, 12)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (19, 16, 12)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (20, 16, 8)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (21, 17, 10)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (22, 17, 16)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (23, 18, 1)
INSERT [dbo].[SpecialitesPrmairesBonus] ([Id], [SpecialitesPrimaire_Id], [BonusAttribut_Id]) VALUES (24, 18, 6)
SET IDENTITY_INSERT [dbo].[SpecialitesPrmairesBonus] OFF
SET IDENTITY_INSERT [dbo].[SpecialitesSecondaires] ON 

INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (1, N'Anti-Terrorist Specialist       ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (2, N'Battlefield Medic               ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (3, N'Battle Copter Pilot             ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (4, N'CBR Warfare                     ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (5, N'Cook                            ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (6, N'Dog Handler                     ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (7, N'Drill Sergeant                  ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (8, N'Electronics Engineer            ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (9, N'Fireman                         ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (10, N'Hand-to-hand Combat Instructor  ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (11, N'Heavy Weapons                   ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (12, N'Intelligence                    ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (13, N'Interpreter                     ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (14, N'Marksmanship Instructor         ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (15, N'Medical Doctor                  ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (16, N'Military Policeman              ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (17, N'Paratrooper                     ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (18, N'Public Relations                ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (19, N'Radio Telecommunications        ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (20, N'LRRP (Long Range Recon Patrol)  ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (21, N'Sabotage                        ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (22, N'Small Arms Armourer             ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (23, N'Survival Training Instructor    ')
INSERT [dbo].[SpecialitesSecondaires] ([Id], [nom]) VALUES (25, N'Underwater Demo Instructor      ')
SET IDENTITY_INSERT [dbo].[SpecialitesSecondaires] OFF
SET IDENTITY_INSERT [dbo].[UnitesSpeciales] ON 

INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (1, N'Navy SEAL                       ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (2, N'Delta Force                     ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (3, N'JTF2                            ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (4, N'GOE                             ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (5, N'Bérêts Verts                    ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (6, N'SAS                             ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (7, N'KSK                             ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (8, N'Jagdkommando                    ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (9, N'SOCOMD                          ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (10, N'GIS                             ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (11, N'Spetsnaz                        ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (12, N'PLA Special Forces              ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (13, N'MJK                             ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (14, N'Shayetet 13                     ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (15, N'Special Forces Group            ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (16, N'GROM                            ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (17, N'ARD 10                          ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (18, N'COMANF                          ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (19, N'Raider Forces                   ')
INSERT [dbo].[UnitesSpeciales] ([Id], [nom]) VALUES (20, N'Special Forces Group            ')
SET IDENTITY_INSERT [dbo].[UnitesSpeciales] OFF
SET IDENTITY_INSERT [dbo].[UnitesSpecialesLangages] ON 

INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (2, 1, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (3, 1, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (5, 2, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (6, 2, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (7, 3, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (8, 3, 2)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (9, 4, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (10, 4, 3)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (11, 5, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (12, 5, 2)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (13, 6, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (14, 6, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (15, 7, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (16, 7, 4)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (17, 8, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (18, 8, 4)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (19, 9, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (20, 9, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (21, 10, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (22, 10, 5)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (23, 11, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (24, 11, 6)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (25, 12, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (26, 12, 7)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (27, 13, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (28, 13, 8)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (29, 14, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (30, 14, 9)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (31, 15, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (32, 15, 11)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (33, 16, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (34, 16, 12)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (35, 17, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (36, 17, 2)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (37, 18, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (38, 18, 13)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (39, 19, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (40, 19, 14)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (41, 20, 1)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (42, 20, 2)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (43, 17, 4)
INSERT [dbo].[UnitesSpecialesLangages] ([Id], [UnitesSpeciale_Id], [Langage_Id]) VALUES (44, 14, 10)
SET IDENTITY_INSERT [dbo].[UnitesSpecialesLangages] OFF
/****** Object:  Index [IX_FK_ArmesTypeArme]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ArmesTypeArme] ON [dbo].[Armes]
(
	[ArmesType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UnitesSpecialeArme]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UnitesSpecialeArme] ON [dbo].[Armes]
(
	[UnitesSpeciale_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ArmeArmesEmportee]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ArmeArmesEmportee] ON [dbo].[ArmesEmportees]
(
	[Arme_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonnageArmesEmportee]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonnageArmesEmportee] ON [dbo].[ArmesEmportees]
(
	[Personnage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ArmeArmesMotsCle]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ArmeArmesMotsCle] ON [dbo].[ArmesMotsCles]
(
	[Arme_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MotsCleArmesMotsCle]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MotsCleArmesMotsCle] ON [dbo].[ArmesMotsCles]
(
	[MotsCle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ArmesTypeClassesArmesType]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ArmesTypeClassesArmesType] ON [dbo].[ClassesArmesTypes]
(
	[ArmesType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClassesSoldatClassesArmesType]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClassesSoldatClassesArmesType] ON [dbo].[ClassesArmesTypes]
(
	[ClassesSoldat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EquipementEmporteEquipement]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EquipementEmporteEquipement] ON [dbo].[EquipementEmportes]
(
	[Equipement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EquipementEmportePersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EquipementEmportePersonnage] ON [dbo].[EquipementEmportes]
(
	[Personnage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EquipementEquipementType]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EquipementEquipementType] ON [dbo].[Equipements]
(
	[Armures_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EquipementSpecialiteEquipement]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EquipementSpecialiteEquipement] ON [dbo].[EquipementSpecialites]
(
	[Equipements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SpecialitesSecondaireEquipementSpecialite]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SpecialitesSecondaireEquipementSpecialite] ON [dbo].[EquipementSpecialites]
(
	[SpecialitesSecondaire_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_AttributPersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AttributPersonnage] ON [dbo].[Personnages]
(
	[Attribut_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClassesSoldatPersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClassesSoldatPersonnage] ON [dbo].[Personnages]
(
	[ClassesSoldat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_JoueurPersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_JoueurPersonnage] ON [dbo].[Personnages]
(
	[Joueur_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonnageUnitesSpeciale]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonnageUnitesSpeciale] ON [dbo].[Personnages]
(
	[UnitesSpeciales_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SpecialitesPrimairePersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SpecialitesPrimairePersonnage] ON [dbo].[Personnages]
(
	[SpecialitesPrimaire_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SpecialitesSecondairePersonnage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SpecialitesSecondairePersonnage] ON [dbo].[Personnages]
(
	[SpecialitesSecondaire_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ManoeuvresTactiqueSpecialitesPrimaire]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ManoeuvresTactiqueSpecialitesPrimaire] ON [dbo].[SpecialitesPrimaires]
(
	[ManoeuvresTactique_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BonusAttributSpecialitesPrmairesBonus]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_BonusAttributSpecialitesPrmairesBonus] ON [dbo].[SpecialitesPrmairesBonus]
(
	[BonusAttribut_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SpecialitesPrimaireSpecialitesPrmairesBonus]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SpecialitesPrimaireSpecialitesPrmairesBonus] ON [dbo].[SpecialitesPrmairesBonus]
(
	[SpecialitesPrimaire_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LangageUnitesSpecialesLangage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_LangageUnitesSpecialesLangage] ON [dbo].[UnitesSpecialesLangages]
(
	[Langage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UnitesSpecialeUnitesSpecialesLangage]    Script Date: 2017-05-06 11:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UnitesSpecialeUnitesSpecialesLangage] ON [dbo].[UnitesSpecialesLangages]
(
	[UnitesSpeciale_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipements] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[Armes]  WITH CHECK ADD  CONSTRAINT [FK_ArmesTypeArme] FOREIGN KEY([ArmesType_Id])
REFERENCES [dbo].[ArmesTypes] ([Id])
GO
ALTER TABLE [dbo].[Armes] CHECK CONSTRAINT [FK_ArmesTypeArme]
GO
ALTER TABLE [dbo].[Armes]  WITH CHECK ADD  CONSTRAINT [FK_UnitesSpecialeArme] FOREIGN KEY([UnitesSpeciale_Id])
REFERENCES [dbo].[UnitesSpeciales] ([Id])
GO
ALTER TABLE [dbo].[Armes] CHECK CONSTRAINT [FK_UnitesSpecialeArme]
GO
ALTER TABLE [dbo].[ArmesEmportees]  WITH CHECK ADD  CONSTRAINT [FK_ArmeArmesEmportee] FOREIGN KEY([Arme_Id])
REFERENCES [dbo].[Armes] ([Id])
GO
ALTER TABLE [dbo].[ArmesEmportees] CHECK CONSTRAINT [FK_ArmeArmesEmportee]
GO
ALTER TABLE [dbo].[ArmesEmportees]  WITH CHECK ADD  CONSTRAINT [FK_PersonnageArmesEmportee] FOREIGN KEY([Personnage_Id])
REFERENCES [dbo].[Personnages] ([Id])
GO
ALTER TABLE [dbo].[ArmesEmportees] CHECK CONSTRAINT [FK_PersonnageArmesEmportee]
GO
ALTER TABLE [dbo].[ArmesMotsCles]  WITH CHECK ADD  CONSTRAINT [FK_ArmeArmesMotsCle] FOREIGN KEY([Arme_Id])
REFERENCES [dbo].[Armes] ([Id])
GO
ALTER TABLE [dbo].[ArmesMotsCles] CHECK CONSTRAINT [FK_ArmeArmesMotsCle]
GO
ALTER TABLE [dbo].[ArmesMotsCles]  WITH CHECK ADD  CONSTRAINT [FK_MotsCleArmesMotsCle] FOREIGN KEY([MotsCle_Id])
REFERENCES [dbo].[MotsCles] ([Id])
GO
ALTER TABLE [dbo].[ArmesMotsCles] CHECK CONSTRAINT [FK_MotsCleArmesMotsCle]
GO
ALTER TABLE [dbo].[Armures]  WITH CHECK ADD  CONSTRAINT [FK_Armures_Equipementse] FOREIGN KEY([EquipementsID])
REFERENCES [dbo].[Equipements] ([Id])
GO
ALTER TABLE [dbo].[Armures] CHECK CONSTRAINT [FK_Armures_Equipementse]
GO
ALTER TABLE [dbo].[ClassesArmesTypes]  WITH CHECK ADD  CONSTRAINT [FK_ArmesTypeClassesArmesType] FOREIGN KEY([ArmesType_Id])
REFERENCES [dbo].[ArmesTypes] ([Id])
GO
ALTER TABLE [dbo].[ClassesArmesTypes] CHECK CONSTRAINT [FK_ArmesTypeClassesArmesType]
GO
ALTER TABLE [dbo].[ClassesArmesTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClassesSoldatClassesArmesType] FOREIGN KEY([ClassesSoldat_Id])
REFERENCES [dbo].[ClassesSoldats] ([Id])
GO
ALTER TABLE [dbo].[ClassesArmesTypes] CHECK CONSTRAINT [FK_ClassesSoldatClassesArmesType]
GO
ALTER TABLE [dbo].[EquipementEmportes]  WITH CHECK ADD  CONSTRAINT [FK_EquipementEmporteEquipement] FOREIGN KEY([Equipement_Id])
REFERENCES [dbo].[Equipements] ([Id])
GO
ALTER TABLE [dbo].[EquipementEmportes] CHECK CONSTRAINT [FK_EquipementEmporteEquipement]
GO
ALTER TABLE [dbo].[EquipementEmportes]  WITH CHECK ADD  CONSTRAINT [FK_EquipementEmportePersonnage] FOREIGN KEY([Personnage_Id])
REFERENCES [dbo].[Personnages] ([Id])
GO
ALTER TABLE [dbo].[EquipementEmportes] CHECK CONSTRAINT [FK_EquipementEmportePersonnage]
GO
ALTER TABLE [dbo].[EquipementSpecialites]  WITH CHECK ADD  CONSTRAINT [FK_EquipementSpecialiteEquipement] FOREIGN KEY([Equipements_Id])
REFERENCES [dbo].[Equipements] ([Id])
GO
ALTER TABLE [dbo].[EquipementSpecialites] CHECK CONSTRAINT [FK_EquipementSpecialiteEquipement]
GO
ALTER TABLE [dbo].[EquipementSpecialites]  WITH CHECK ADD  CONSTRAINT [FK_SpecialitesSecondaireEquipementSpecialite] FOREIGN KEY([SpecialitesSecondaire_Id])
REFERENCES [dbo].[SpecialitesSecondaires] ([Id])
GO
ALTER TABLE [dbo].[EquipementSpecialites] CHECK CONSTRAINT [FK_SpecialitesSecondaireEquipementSpecialite]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_AttributPersonnage] FOREIGN KEY([Attribut_Id])
REFERENCES [dbo].[Attributs] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_AttributPersonnage]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_ClassesSoldatPersonnage] FOREIGN KEY([ClassesSoldat_Id])
REFERENCES [dbo].[ClassesSoldats] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_ClassesSoldatPersonnage]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_JoueurPersonnage] FOREIGN KEY([Joueur_Id])
REFERENCES [dbo].[Joueurs] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_JoueurPersonnage]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_PersonnageUnitesSpeciale] FOREIGN KEY([UnitesSpeciales_Id])
REFERENCES [dbo].[UnitesSpeciales] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_PersonnageUnitesSpeciale]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_SpecialitesPrimairePersonnage] FOREIGN KEY([SpecialitesPrimaire_Id])
REFERENCES [dbo].[SpecialitesPrimaires] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_SpecialitesPrimairePersonnage]
GO
ALTER TABLE [dbo].[Personnages]  WITH CHECK ADD  CONSTRAINT [FK_SpecialitesSecondairePersonnage] FOREIGN KEY([SpecialitesSecondaire_Id])
REFERENCES [dbo].[SpecialitesSecondaires] ([Id])
GO
ALTER TABLE [dbo].[Personnages] CHECK CONSTRAINT [FK_SpecialitesSecondairePersonnage]
GO
ALTER TABLE [dbo].[SpecialitesPrimaires]  WITH CHECK ADD  CONSTRAINT [FK_ManoeuvresTactiqueSpecialitesPrimaire] FOREIGN KEY([ManoeuvresTactique_Id])
REFERENCES [dbo].[ManoeuvresTactiques] ([Id])
GO
ALTER TABLE [dbo].[SpecialitesPrimaires] CHECK CONSTRAINT [FK_ManoeuvresTactiqueSpecialitesPrimaire]
GO
ALTER TABLE [dbo].[SpecialitesPrimairesBonus]  WITH CHECK ADD  CONSTRAINT [FK_BonusAttributSpecialitesPrimairesBonus] FOREIGN KEY([BonusAttribut_Id])
REFERENCES [dbo].[BonusAttributs] ([Id])
GO
ALTER TABLE [dbo].[SpecialitesPrimairesBonus] CHECK CONSTRAINT [FK_BonusAttributSpecialitesPrimairesBonus]
GO
ALTER TABLE [dbo].[SpecialitesPrimairesBonus]  WITH CHECK ADD  CONSTRAINT [FK_SpecialitesPrimaireSpecialitesPrimairesBonus] FOREIGN KEY([SpecialitesPrimaire_Id])
REFERENCES [dbo].[SpecialitesPrimaires] ([Id])
GO
ALTER TABLE [dbo].[SpecialitesPrimairesBonus] CHECK CONSTRAINT [FK_SpecialitesPrimaireSpecialitesPrimairesBonus]
GO
ALTER TABLE [dbo].[SpecialitesPrmairesBonus]  WITH CHECK ADD  CONSTRAINT [FK_BonusAttributSpecialitesPrmairesBonus] FOREIGN KEY([BonusAttribut_Id])
REFERENCES [dbo].[BonusAttributs] ([Id])
GO
ALTER TABLE [dbo].[SpecialitesPrmairesBonus] CHECK CONSTRAINT [FK_BonusAttributSpecialitesPrmairesBonus]
GO
ALTER TABLE [dbo].[SpecialitesPrmairesBonus]  WITH CHECK ADD  CONSTRAINT [FK_SpecialitesPrimaireSpecialitesPrmairesBonus] FOREIGN KEY([SpecialitesPrimaire_Id])
REFERENCES [dbo].[SpecialitesPrimaires] ([Id])
GO
ALTER TABLE [dbo].[SpecialitesPrmairesBonus] CHECK CONSTRAINT [FK_SpecialitesPrimaireSpecialitesPrmairesBonus]
GO
ALTER TABLE [dbo].[UnitesSpecialesLangages]  WITH CHECK ADD  CONSTRAINT [FK_LangageUnitesSpecialesLangage] FOREIGN KEY([Langage_Id])
REFERENCES [dbo].[Langages] ([Id])
GO
ALTER TABLE [dbo].[UnitesSpecialesLangages] CHECK CONSTRAINT [FK_LangageUnitesSpecialesLangage]
GO
ALTER TABLE [dbo].[UnitesSpecialesLangages]  WITH CHECK ADD  CONSTRAINT [FK_UnitesSpecialeUnitesSpecialesLangage] FOREIGN KEY([UnitesSpeciale_Id])
REFERENCES [dbo].[UnitesSpeciales] ([Id])
GO
ALTER TABLE [dbo].[UnitesSpecialesLangages] CHECK CONSTRAINT [FK_UnitesSpecialeUnitesSpecialesLangage]
GO
USE [master]
GO
ALTER DATABASE [SigmaProtocolBD] SET  READ_WRITE 
GO
