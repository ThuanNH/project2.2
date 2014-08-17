USE [master]
GO
IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'MusicWeb_DB' )
DROP DATABASE MusicWeb_DB
GO
/****** Object:  Database [MusicWeb_DB]    Script Date: 17/08/2014 5:07:49 CH ******/
CREATE DATABASE [MusicWeb_DB]
GO
ALTER DATABASE [MusicWeb_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicWeb_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicWeb_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MusicWeb_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicWeb_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicWeb_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicWeb_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicWeb_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicWeb_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MusicWeb_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicWeb_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicWeb_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicWeb_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicWeb_DB', N'ON'
GO
USE [MusicWeb_DB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Accountname] [varchar](20) NOT NULL,
	[password] [char](32) NOT NULL,
	[accounttypeid] [int] NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[dob] [datetime] NULL,
	[avatar] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[Isactive] [bit] NOT NULL,
	[lastloggedin] [datetime] NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accounttype]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounttype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ads]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ads](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[images] [varchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[Datecreate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bannedaccount]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannedaccount](
	[accountid] [int] NOT NULL,
	[bannedreasonid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bannedreason]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannedreason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[categorytypeid] [int] NOT NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categorytype]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorytype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[contents] [nvarchar](max) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[favoriteplaylist]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoriteplaylist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoriteplaylist] PRIMARY KEY CLUSTERED 
(
	[playlistid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[favoritesong]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritesong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoritesong] PRIMARY KEY CLUSTERED 
(
	[songid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[favoritevideo]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritevideo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[videoid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoritevideo] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[musician]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[musician](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[nickname] [nvarchar](50) NOT NULL,
	[dob] [datetime] NULL,
	[dod] [datetime] NULL,
	[moreinfo] [nvarchar](max) NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playlist]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[playlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[title] [nvarchar](50) NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
	[views] [int] NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playlistcategory]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlistcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_playlistcategory] PRIMARY KEY CLUSTERED 
(
	[playlistid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[playlistcomments]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlistcomments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistid] [int] NOT NULL,
	[commentsid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[playlistitem]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlistitem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[playlistid] [int] NOT NULL,
 CONSTRAINT [pk_playlist] PRIMARY KEY CLUSTERED 
(
	[playlistid] ASC,
	[songid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[singer]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[singer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[nickname] [nvarchar](50) NOT NULL,
	[dob] [datetime] NULL,
	[dod] [datetime] NULL,
	[moreinfo] [nvarchar](max) NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[singercategory]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[singercategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[singerid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_singercategory] PRIMARY KEY CLUSTERED 
(
	[singerid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[slideshowitem]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slideshowitem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[images] [varchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[Datecreate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[song]    Script Date: 17/08/2014 5:07:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[song](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[duration] [int] NULL,
	[views] [int] NULL,
	[moreinfo] [nvarchar](max) NULL,
	[lyricfile] [varchar](100) NOT NULL,
	[lyric] [nvarchar](max) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[songcategory]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_songcategory] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC,
	[songid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[songcomments]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songcomments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[commentsid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[songlike]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songlike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NULL,
 CONSTRAINT [pk_songlike] PRIMARY KEY CLUSTERED 
(
	[songid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[songmusician]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songmusician](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[musicianid] [int] NOT NULL,
	[songid] [int] NOT NULL,
 CONSTRAINT [pk_songmusician] PRIMARY KEY CLUSTERED 
(
	[musicianid] ASC,
	[songid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[songsinger]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songsinger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[singerid] [int] NOT NULL,
	[songid] [int] NOT NULL,
 CONSTRAINT [pk_songsinger] PRIMARY KEY CLUSTERED 
(
	[singerid] ASC,
	[songid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userreport]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userreport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[relatedvideoid] [int] NOT NULL,
	[relatedsongid] [int] NOT NULL,
	[relatedaccountid] [int] NOT NULL,
	[moreinfo] [varchar](max) NOT NULL,
	[Dateadded] [datetime] NULL,
 CONSTRAINT [pk_Accountrp] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC,
	[relatedvideoid] ASC,
	[relatedsongid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[video]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[duration] [int] NULL,
	[views] [int] NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[videocategory]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videocategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[videoid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_videocategory] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[videocomments]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videocomments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[videoid] [int] NOT NULL,
	[commentsid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[videolike]    Script Date: 17/08/2014 5:07:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videolike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[videoid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NULL,
 CONSTRAINT [pk_videolike] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account] FOREIGN KEY([accounttypeid])
REFERENCES [dbo].[accounttype] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account]
GO
ALTER TABLE [dbo].[bannedaccount]  WITH CHECK ADD  CONSTRAINT [FK_bannedaccount] FOREIGN KEY([bannedreasonid])
REFERENCES [dbo].[bannedreason] ([id])
GO
ALTER TABLE [dbo].[bannedaccount] CHECK CONSTRAINT [FK_bannedaccount]
GO
ALTER TABLE [dbo].[bannedaccount]  WITH CHECK ADD  CONSTRAINT [FK_bannedaccount1] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[bannedaccount] CHECK CONSTRAINT [FK_bannedaccount1]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category] FOREIGN KEY([categorytypeid])
REFERENCES [dbo].[categorytype] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments]
GO
ALTER TABLE [dbo].[favoriteplaylist]  WITH CHECK ADD  CONSTRAINT [FK_favoriteplaylist] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[favoriteplaylist] CHECK CONSTRAINT [FK_favoriteplaylist]
GO
ALTER TABLE [dbo].[favoriteplaylist]  WITH CHECK ADD  CONSTRAINT [FK_favoriteplaylist1] FOREIGN KEY([playlistid])
REFERENCES [dbo].[playlist] ([id])
GO
ALTER TABLE [dbo].[favoriteplaylist] CHECK CONSTRAINT [FK_favoriteplaylist1]
GO
ALTER TABLE [dbo].[favoritesong]  WITH CHECK ADD  CONSTRAINT [FK_favoritesong] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[favoritesong] CHECK CONSTRAINT [FK_favoritesong]
GO
ALTER TABLE [dbo].[favoritesong]  WITH CHECK ADD  CONSTRAINT [FK_favoritesong1] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[favoritesong] CHECK CONSTRAINT [FK_favoritesong1]
GO
ALTER TABLE [dbo].[favoritevideo]  WITH CHECK ADD  CONSTRAINT [FK_favirotevideo] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[favoritevideo] CHECK CONSTRAINT [FK_favirotevideo]
GO
ALTER TABLE [dbo].[favoritevideo]  WITH CHECK ADD  CONSTRAINT [FK_favirotevideo1] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[favoritevideo] CHECK CONSTRAINT [FK_favirotevideo1]
GO
ALTER TABLE [dbo].[playlist]  WITH CHECK ADD  CONSTRAINT [FK_playlist] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[playlist] CHECK CONSTRAINT [FK_playlist]
GO
ALTER TABLE [dbo].[playlistcategory]  WITH CHECK ADD  CONSTRAINT [FK_playlistcategory] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[playlistcategory] CHECK CONSTRAINT [FK_playlistcategory]
GO
ALTER TABLE [dbo].[playlistcategory]  WITH CHECK ADD  CONSTRAINT [FK_playlistcategory1] FOREIGN KEY([playlistid])
REFERENCES [dbo].[playlist] ([id])
GO
ALTER TABLE [dbo].[playlistcategory] CHECK CONSTRAINT [FK_playlistcategory1]
GO
ALTER TABLE [dbo].[playlistcomments]  WITH CHECK ADD  CONSTRAINT [FK_playlistcomments] FOREIGN KEY([playlistid])
REFERENCES [dbo].[playlist] ([id])
GO
ALTER TABLE [dbo].[playlistcomments] CHECK CONSTRAINT [FK_playlistcomments]
GO
ALTER TABLE [dbo].[playlistcomments]  WITH CHECK ADD  CONSTRAINT [FK_playlistcomments1] FOREIGN KEY([commentsid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[playlistcomments] CHECK CONSTRAINT [FK_playlistcomments1]
GO
ALTER TABLE [dbo].[playlistitem]  WITH CHECK ADD  CONSTRAINT [FK_playlistitem] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[playlistitem] CHECK CONSTRAINT [FK_playlistitem]
GO
ALTER TABLE [dbo].[playlistitem]  WITH CHECK ADD  CONSTRAINT [FK_playlistitem1] FOREIGN KEY([playlistid])
REFERENCES [dbo].[playlist] ([id])
GO
ALTER TABLE [dbo].[playlistitem] CHECK CONSTRAINT [FK_playlistitem1]
GO
ALTER TABLE [dbo].[singercategory]  WITH CHECK ADD  CONSTRAINT [FK_singercategory] FOREIGN KEY([singerid])
REFERENCES [dbo].[singer] ([id])
GO
ALTER TABLE [dbo].[singercategory] CHECK CONSTRAINT [FK_singercategory]
GO
ALTER TABLE [dbo].[singercategory]  WITH CHECK ADD  CONSTRAINT [FK_singercategory1] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[singercategory] CHECK CONSTRAINT [FK_singercategory1]
GO
ALTER TABLE [dbo].[songcategory]  WITH CHECK ADD  CONSTRAINT [FK_songcategory] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songcategory] CHECK CONSTRAINT [FK_songcategory]
GO
ALTER TABLE [dbo].[songcategory]  WITH CHECK ADD  CONSTRAINT [FK_songcategory1] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[songcategory] CHECK CONSTRAINT [FK_songcategory1]
GO
ALTER TABLE [dbo].[songcomments]  WITH CHECK ADD  CONSTRAINT [FK_songcomments] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songcomments] CHECK CONSTRAINT [FK_songcomments]
GO
ALTER TABLE [dbo].[songcomments]  WITH CHECK ADD  CONSTRAINT [FK_songcomments1] FOREIGN KEY([commentsid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[songcomments] CHECK CONSTRAINT [FK_songcomments1]
GO
ALTER TABLE [dbo].[songlike]  WITH CHECK ADD  CONSTRAINT [FK_songlike] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songlike] CHECK CONSTRAINT [FK_songlike]
GO
ALTER TABLE [dbo].[songlike]  WITH CHECK ADD  CONSTRAINT [FK_songlike1] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[songlike] CHECK CONSTRAINT [FK_songlike1]
GO
ALTER TABLE [dbo].[songmusician]  WITH CHECK ADD  CONSTRAINT [FK_songmusician] FOREIGN KEY([musicianid])
REFERENCES [dbo].[musician] ([id])
GO
ALTER TABLE [dbo].[songmusician] CHECK CONSTRAINT [FK_songmusician]
GO
ALTER TABLE [dbo].[songmusician]  WITH CHECK ADD  CONSTRAINT [FK_songmusician1] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songmusician] CHECK CONSTRAINT [FK_songmusician1]
GO
ALTER TABLE [dbo].[songsinger]  WITH CHECK ADD  CONSTRAINT [FK_songsinger] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songsinger] CHECK CONSTRAINT [FK_songsinger]
GO
ALTER TABLE [dbo].[songsinger]  WITH CHECK ADD  CONSTRAINT [FK_songsinger1] FOREIGN KEY([singerid])
REFERENCES [dbo].[singer] ([id])
GO
ALTER TABLE [dbo].[songsinger] CHECK CONSTRAINT [FK_songsinger1]
GO
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport]
GO
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport1] FOREIGN KEY([relatedvideoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport1]
GO
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport2] FOREIGN KEY([relatedsongid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport2]
GO
ALTER TABLE [dbo].[videocategory]  WITH CHECK ADD  CONSTRAINT [FK_videocategory] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[videocategory] CHECK CONSTRAINT [FK_videocategory]
GO
ALTER TABLE [dbo].[videocategory]  WITH CHECK ADD  CONSTRAINT [FK_videocategory1] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videocategory] CHECK CONSTRAINT [FK_videocategory1]
GO
ALTER TABLE [dbo].[videocomments]  WITH CHECK ADD  CONSTRAINT [FK_videocomments] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videocomments] CHECK CONSTRAINT [FK_videocomments]
GO
ALTER TABLE [dbo].[videocomments]  WITH CHECK ADD  CONSTRAINT [FK_videocomments1] FOREIGN KEY([commentsid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[videocomments] CHECK CONSTRAINT [FK_videocomments1]
GO
ALTER TABLE [dbo].[videolike]  WITH CHECK ADD  CONSTRAINT [FK_videolike] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videolike] CHECK CONSTRAINT [FK_videolike]
GO
ALTER TABLE [dbo].[videolike]  WITH CHECK ADD  CONSTRAINT [FK_videolike1] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[videolike] CHECK CONSTRAINT [FK_videolike1]
GO
USE [master]
GO
ALTER DATABASE [MusicWeb_DB] SET  READ_WRITE 
GO
