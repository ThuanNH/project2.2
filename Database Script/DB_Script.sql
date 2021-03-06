USE [master]
GO
IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'MusicWeb_DB' )
DROP DATABASE MusicWeb_DB
GO
/****** Object:  Database [MusicWeb_DB]    Script Date: 03/09/2014 2:09:58 CH ******/
CREATE DATABASE [MusicWeb_DB]
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
/****** Object:  Table [dbo].[Account]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[password] [char](32) NOT NULL,
	[accounttypeid] [int] NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[dob] [datetime] NULL,
	[avatar] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[IsActivated] [bit] NOT NULL,
	[IsDisabled] [bit] NOT NULL,
	[lastloggedin] [datetime] NOT NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accounttype]    Script Date: 03/09/2014 2:23:42 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ads]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ads](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[AdsContainerID] [int] NOT NULL,
	[BeginDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[images] [varchar](100) NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[Datecreate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adsContainer]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adsContainer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[Datecreate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menuContainer]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuContainer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO
/****** Object:  Table [dbo].[menuItem]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuContainerID] [int] NOT NULL references menuContainer(id),
	[menuParentID] [int] NULL references [menuItem](id),
	[Title] [nvarchar](100) NOT NULL,
	[Link] [nvarchar](max) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bannedaccount]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannedaccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[bannedreasonid] [int] NOT NULL,
	[bannedDays] [int] NULL,
	[StartDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bannedreason]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannedreason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
	[bannedDays] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 03/09/2014 2:23:42 CH ******/
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
	[thumbnail] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categorytype]    Script Date: 03/09/2014 2:23:42 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[contents] [nvarchar](max) NOT NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[favoriteplaylist]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[favoritesong]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[favoritevideo]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[musician]    Script Date: 03/09/2014 2:23:42 CH ******/
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
	[thumbnail] [varchar](100) NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playlist]    Script Date: 03/09/2014 2:23:42 CH ******/
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
	[thumbnail] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[views] [int] NOT NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playlistcategory]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[playlistcomments]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[playlistitem]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [pk_reportType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[singer]    Script Date: 03/09/2014 2:23:42 CH ******/
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
	[thumbnail] [varchar](100) NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[singercategory]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[slideshowitem]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slideshowitem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[images] [varchar](100) NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[Datecreate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[song]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[song](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[accountid] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[views] [int] NOT NULL,
	[moreSingers] [nvarchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[lyricfile] [varchar](100) NULL,
	[lyric] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[songcategory]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[songcomments]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[songlike]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songlike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NOT NULL,
 CONSTRAINT [pk_songlike] PRIMARY KEY CLUSTERED 
(
	[songid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[songmusician]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[SongQuality]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SongQuality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[songsinger]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[SongSource]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SongSource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SongID] [int] NOT NULL,
	[fileSrc] [varchar](100) NOT NULL,
	[SongQualityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[SongQualityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userreport]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userreport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[objectID] [int] NOT NULL,
	[reportTypeID] [int] NOT NULL,
	[moreinfo] [varchar](max) NOT NULL,
	[Dateadded] [datetime] NOT NULL,
 CONSTRAINT [pk_userreport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[video]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[fileSrc] [varchar](100) NOT NULL,
	[duration] [int] NOT NULL,
	[views] [int] NOT NULL,
	[thumbnail] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[datecreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[videocategory]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[videocomments]    Script Date: 03/09/2014 2:23:42 CH ******/
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
/****** Object:  Table [dbo].[videolike]    Script Date: 03/09/2014 2:23:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videolike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[videoid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NOT NULL,
 CONSTRAINT [pk_videolike] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('default.jpg') FOR [avatar]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [IsDisabled]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [lastloggedin]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[ads] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[ads] ADD  DEFAULT (getdate()) FOR [Datecreate]
GO
ALTER TABLE [dbo].[adsContainer] ADD  DEFAULT (getdate()) FOR [Datecreate]
GO
ALTER TABLE [dbo].[bannedaccount] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[bannedreason] ADD  DEFAULT ((7)) FOR [bannedDays]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[musician] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[playlist] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[playlist] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[singer] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[slideshowitem] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[slideshowitem] ADD  DEFAULT (getdate()) FOR [Datecreate]
GO
ALTER TABLE [dbo].[song] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[song] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[songlike] ADD  DEFAULT (getdate()) FOR [dateadded]
GO
ALTER TABLE [dbo].[userreport] ADD  DEFAULT (getdate()) FOR [Dateadded]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[videolike] ADD  DEFAULT (getdate()) FOR [dateadded]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account] FOREIGN KEY([accounttypeid])
REFERENCES [dbo].[accounttype] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account]
GO
ALTER TABLE [dbo].[ads]  WITH CHECK ADD FOREIGN KEY([AdsContainerID])
REFERENCES [dbo].[adsContainer] ([id])
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
ALTER TABLE [dbo].[song]  WITH CHECK ADD  CONSTRAINT [FK_Song] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[song] CHECK CONSTRAINT [FK_Song]
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
ALTER TABLE [dbo].[SongSource]  WITH CHECK ADD  CONSTRAINT [FK_songsource] FOREIGN KEY([SongID])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[SongSource] CHECK CONSTRAINT [FK_songsource]
GO
ALTER TABLE [dbo].[SongSource]  WITH CHECK ADD  CONSTRAINT [FK_songsource1] FOREIGN KEY([SongQualityID])
REFERENCES [dbo].[SongQuality] ([id])
GO
ALTER TABLE [dbo].[SongSource] CHECK CONSTRAINT [FK_songsource1]
GO
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport]
GO
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport1] FOREIGN KEY([reportTypeID])
REFERENCES [dbo].[ReportType] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport1]
GO
ALTER TABLE [dbo].[video]  WITH CHECK ADD  CONSTRAINT [FK_video] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[video] CHECK CONSTRAINT [FK_video]
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

USE [MusicWeb_DB]
GO
Insert accounttype(name,descriptions) values(N'Admin',N'Tài khoản dành cho admin'),
									        (N'User',N'Tài khoản dành cho user')
GO
Insert categorytype(name,moreinfo) values(N'Video',N'Loại dành cho bài hát, playlist, singer, musician'),
									     (N'Song',N'Loại dành cho video')
GO
Insert category(name,categorytypeid,thumbnail) values(N'Tiền chiến',2,N'default.jpg'),
											         (N'Rap việt',2,N'default.jpg'),
											         (N'Pop',2,N'default.jpg'),
											         (N'Blue/Jaz',2,N'default.jpg'),
											         (N'Hàn quốc',2,N'default.jpg'),
											         (N'Rock',2,N'default.jpg'),
											         (N'Country',2,N'default.jpg'),
											         (N'Nhạc hoa',2,N'default.jpg'),
											         (N'Nhạc trẻ',2,N'default.jpg'),
											         (N'Nhạc trịnh',2,N'default.jpg'),
											         (N'Nhạc nhật',2,N'default.jpg'),
											         (N'Dance',2,N'default.jpg'),
											         (N'Latin',2,N'default.jpg'),
											         (N'Rock việt',2,N'default.jpg'),
											         (N'Không lời',2,N'default.jpg'),
											         (N'Trữ tình',2,N'default.jpg'),
											         (N'R&B / HipHop / Rap',2,N'default.jpg'),
											         (N'india',2,N'default.jpg'),
											         (N'Cách mạng',2,N'default.jpg'),
											         (N'Thiếu nhi',2,N'default.jpg'),
													 (N'Thể loại khác',2,N'default.jpg')	
GO
Insert category(name,categorytypeid,thumbnail) values(N'Âu mĩ',1,N'default.jpg'),
													 (N'Nhạc hoa',1,N'default.jpg'),
													 (N'Cip vui',1,N'default.jpg'),
													 (N'Phim',1,N'default.jpg'),
													 (N'N+ show',1,N'default.jpg'),
													 (N'Việt nam',1,N'default.jpg'),
													 (N'Hàn quốc',1,N'default.jpg'),
													 (N'Nhạc nhật',1,N'default.jpg'),
													 (N'Hài kịch',1,N'default.jpg'),
													 (N'Giải trí khác',1,N'default.jpg'),
													 (N'Thể loại khác',1,N'default.jpg')
GO
insert slideshowitem([link],[Title],[images],[IsActivated]) values('Google.com','Title Cho item 1','slide1.jpg',1),
										  				  ('Google.com','Title Cho item 2','slide2.jpg',1),
														  ('Google.com','Title Cho item 3','slide3.jpg',1),
														  ('Google.com','Title Cho item 4','slide4.jpg',1)
GO

insert ReportType([Name]) values(N'Thông báo liên quan đến video'),
								(N'Thông báo liên quan đến Tài Khoản'),
								(N'Thông báo liên quan đến bài hát'),
								(N'Thông báo liên quan đến bình luận')
										  			
GO

insert adsContainer([Name],[Description],[IsActivated]) values('Sidebar Top','Quảng cáo trên top của sidebar',1),
															  ('Sidebar bottom','Quảng cáo bên dưới bottom của sidebar',1),
															  ('MediaPlayer Poster','Quảng cáo trên poster của media player',1)

GO

insert ads([Title],[AdsContainerID],[link],[images],[IsActivated]) values('Quảng cáo google',1,'google.com','default.jpg',1),
																	     ('Quảng cáo google',2,'google.com','default.jpg',1),
																		 ('Quảng cáo google',3,'google.com','default.jpg',1)

GO

insert SongQuality([Name],[Description]) values('128K','Chất lượng âm thanh 128K'),
											   ('360K','Chất lượng âm thanh 360K')
																	  
GO

insert bannedreason([title],[descriptions]) values('Spamer','Spamer là các tài khoản thường hay spam'),
											      ('Quảng cáo','Dùng để cấm các tài khoản post link ngoài website'),
											      ('Nói tục','Dùng để cấm các tài khoản comment có nội tục tiểu')
																	  
GO

insert Account([IsActivated],[accounttypeid],[fullname],[Username],[password],[dob],[email]) values(1,2,N'Nguyễn Văn A','User','25f9e794323b453885f5181f1b624d0b','1/1/1990','nguyenhoangthuan.tn@gmail.com'),
																								   (1,1,N'Nguyễn Văn B','Admin','25f9e794323b453885f5181f1b624d0b','1/1/1990','thuannguyen1993@gmail.com')

GO

insert menuContainer([Name],[Description]) values('Admin Menu','Menu sử dụng trong trang của administrator'),
								                 ('User Menu','Menu sử dụng trong trang của user')
GO

insert menuItem([Title],[menuContainerID],[Link]) values('Bài hát',2,'Google.com'),
														('Playlist',2,'Google.com'),
														('Video',2,'Google.com'),
														('Ca sĩ',2,'Google.com'),
														('Nhạc sĩ',2,'Google.com')
GO

insert menuItem([Title],[menuContainerID],menuParentID,[Link]) values('Mới & Hot',2,1,'Google.com'),
																     ('Tiền chiến',2,1,'Google.com'),
																     ('Rap việt',2,1,'Google.com'),
																     ('Pop',2,1,'Google.com'),
																     ('Blue/Jaz',2,1,'Google.com'),
																     ('Hàn quốc',2,1,'Google.com'),
																     ('Rock',2,1,'Google.com'),
																     ('Country',2,1,'Google.com'),
																     ('Nhạc hoa',2,1,'Google.com'),
																     ('Nhạc trẻ',2,1,'Google.com'),
																     ('Nhạc trịnh',2,1,'Google.com'),
																     ('Nhạc nhật',2,1,'Google.com'),
																     ('Dance',2,1,'Google.com'),
																     ('Latin',2,1,'Google.com'),
																     ('Rock việt',2,1,'Google.com'),
																     ('Không lời',2,1,'Google.com'),
																     ('Trữ tình',2,1,'Google.com'),
																     ('R&B / HipHop / Rap',2,1,'Google.com'),
																     ('india',2,1,'Google.com'),
																     ('Cách mạng',2,1,'Google.com'),
																     ('Thiếu nhi',2,1,'Google.com'),
																     ('Thể loại khác',2,1,'Google.com'),
																	 ('Mới & Hot',2,2,'Google.com'),
																     ('Tiền chiến',2,2,'Google.com'),
																     ('Rap việt',2,2,'Google.com'),
																     ('Pop',2,2,'Google.com'),
																     ('Blue/Jaz',2,2,'Google.com'),
																     ('Hàn quốc',2,2,'Google.com'),
																     ('Rock',2,2,'Google.com'),
																     ('Country',2,2,'Google.com'),
																     ('Nhạc hoa',2,2,'Google.com'),
																     ('Nhạc trẻ',2,2,'Google.com'),
																     ('Nhạc trịnh',2,2,'Google.com'),
																     ('Nhạc nhật',2,2,'Google.com'),
																     ('Dance',2,2,'Google.com'),
																     ('Latin',2,2,'Google.com'),
																     ('Rock việt',2,2,'Google.com'),
																     ('Không lời',2,2,'Google.com'),
																     ('Trữ tình',2,2,'Google.com'),
																     ('R&B / HipHop / Rap',2,2,'Google.com'),
																     ('india',2,2,'Google.com'),
																     ('Cách mạng',2,2,'Google.com'),
																     ('Thiếu nhi',2,2,'Google.com'),
																     ('Thể loại khác',2,2,'Google.com'),
																     ('Âu mĩ',2,3,'Google.com'),
																     ('Nhạc hoa',2,3,'Google.com'),
																     ('Cip vui',2,3,'Google.com'),
																     ('Phim',2,3,'Google.com'),
																     ('N+ show',2,3,'Google.com'),
																     ('Việt nam',2,3,'Google.com'),
																     ('Hàn quốc',2,3,'Google.com'),
																     ('Nhạc nhật',2,3,'Google.com'),
																     ('Hài kịch',2,3,'Google.com'),
																     ('Giải trí khác',2,3,'Google.com'),
																     ('Thể loại khác',2,3,'Google.com')

	



