USE [project]
GO
/****** Object:  Table [dbo].[accounttype]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounttype](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user1]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user1](
	[id] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password1] [char](32) NOT NULL,
	[accountstateid] [int] NOT NULL,
	[accounttypeid] [int] NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[dob] [datetime] NULL,
	[avatar] [varchar](100) NULL,
	[moreinfo] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL,
	[notes] [nvarchar](max) NULL,
	[Isactive] [bit] NOT NULL,
	[lastloggedin] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playist]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[playist](
	[id] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[title] [nvarchar](50) NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
	[view1] [int] NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playistcomment]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playistcomment](
	[id] [int] NOT NULL,
	[playistid] [int] NOT NULL,
	[commentid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[length1] [int] NULL,
	[view1] [int] NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[videolike]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videolike](
	[id] [int] NOT NULL,
	[videoid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NULL,
 CONSTRAINT [pk_videolike] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videocomment]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videocomment](
	[id] [int] NOT NULL,
	[videoid] [int] NOT NULL,
	[commentid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favoritevideo]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritevideo](
	[id] [int] NOT NULL,
	[videoid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoritevideo] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[singer]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[singer](
	[id] [int] NOT NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playistitem]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playistitem](
	[id] [int] NOT NULL,
	[songid] [int] NOT NULL,
	[playistid] [int] NOT NULL,
 CONSTRAINT [pk_playist] PRIMARY KEY CLUSTERED 
(
	[playistid] ASC,
	[songid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musician]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[musician](
	[id] [int] NOT NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[song]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[song](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[length1] [int] NULL,
	[view1] [int] NULL,
	[moreinfo] [nvarchar](max) NULL,
	[lyricfile] [varchar](100) NOT NULL,
	[lyric] [nvarchar](max) NOT NULL,
	[datecreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userreport]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userreport](
	[id] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[relatedvideoid] [int] NOT NULL,
	[relatedsongid] [int] NOT NULL,
	[relatedaccountid] [int] NOT NULL,
	[moreinfo] [varchar](max) NOT NULL,
	[Dateadded] [datetime] NULL,
 CONSTRAINT [pk_userrp] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC,
	[relatedvideoid] ASC,
	[relatedsongid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[songlike]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songlike](
	[id] [int] NOT NULL,
	[songid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
	[dateadded] [datetime] NULL,
 CONSTRAINT [pk_songlike] PRIMARY KEY CLUSTERED 
(
	[songid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songcomment]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songcomment](
	[id] [int] NOT NULL,
	[songid] [int] NOT NULL,
	[commentid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favoritesong]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritesong](
	[id] [int] NOT NULL,
	[songid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoritesong] PRIMARY KEY CLUSTERED 
(
	[songid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slideshowitem]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slideshowitem](
	[id] [int] NOT NULL,
	[link] [varchar](max) NOT NULL,
	[images] [varchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[Datecreate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[favoriteplayist]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoriteplayist](
	[id] [int] NOT NULL,
	[playistid] [int] NOT NULL,
	[accountid] [int] NOT NULL,
 CONSTRAINT [pk_favoriteplayist] PRIMARY KEY CLUSTERED 
(
	[playistid] ASC,
	[accountid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bannedreason]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannedreason](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bannedaccount]    Script Date: 08/15/2014 23:21:46 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ads]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ads](
	[id] [int] NOT NULL,
	[link] [varchar](max) NOT NULL,
	[images] [varchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[Datecreate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categorytype]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorytype](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[categorytypeid] [int] NOT NULL,
	[thumbnail] [varchar](100) NOT NULL,
	[moreinfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[playistcategory]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playistcategory](
	[id] [int] NOT NULL,
	[playistid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_playistcategory] PRIMARY KEY CLUSTERED 
(
	[playistid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songsinger]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songsinger](
	[id] [int] NOT NULL,
	[singerid] [int] NOT NULL,
	[songid] [int] NOT NULL,
 CONSTRAINT [pk_songsinger] PRIMARY KEY CLUSTERED 
(
	[singerid] ASC,
	[songid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songmusician]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songmusician](
	[id] [int] NOT NULL,
	[musicianid] [int] NOT NULL,
	[songid] [int] NOT NULL,
 CONSTRAINT [pk_songmusician] PRIMARY KEY CLUSTERED 
(
	[musicianid] ASC,
	[songid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videocategory]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videocategory](
	[id] [int] NOT NULL,
	[videoid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_videocategory] PRIMARY KEY CLUSTERED 
(
	[videoid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songcategory]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songcategory](
	[id] [int] NOT NULL,
	[songid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_songcategory] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC,
	[songid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[singercategories]    Script Date: 08/15/2014 23:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[singercategories](
	[id] [int] NOT NULL,
	[singerid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [pk_singercategories] PRIMARY KEY CLUSTERED 
(
	[singerid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_user]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[user1]  WITH CHECK ADD  CONSTRAINT [FK_user] FOREIGN KEY([accountstateid])
REFERENCES [dbo].[bannedaccount] ([accountid])
GO
ALTER TABLE [dbo].[user1] CHECK CONSTRAINT [FK_user]
GO
/****** Object:  ForeignKey [FK_user1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[user1]  WITH CHECK ADD  CONSTRAINT [FK_user1] FOREIGN KEY([accounttypeid])
REFERENCES [dbo].[accounttype] ([id])
GO
ALTER TABLE [dbo].[user1] CHECK CONSTRAINT [FK_user1]
GO
/****** Object:  ForeignKey [FK_playist]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[playist]  WITH CHECK ADD  CONSTRAINT [FK_playist] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[playist] CHECK CONSTRAINT [FK_playist]
GO
/****** Object:  ForeignKey [FK_comment]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment]
GO
/****** Object:  ForeignKey [FK_playistcomment]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[playistcomment]  WITH CHECK ADD  CONSTRAINT [FK_playistcomment] FOREIGN KEY([playistid])
REFERENCES [dbo].[playist] ([id])
GO
ALTER TABLE [dbo].[playistcomment] CHECK CONSTRAINT [FK_playistcomment]
GO
/****** Object:  ForeignKey [FK_playistcomment1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[playistcomment]  WITH CHECK ADD  CONSTRAINT [FK_playistcomment1] FOREIGN KEY([commentid])
REFERENCES [dbo].[comment] ([id])
GO
ALTER TABLE [dbo].[playistcomment] CHECK CONSTRAINT [FK_playistcomment1]
GO
/****** Object:  ForeignKey [FK_videolike]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videolike]  WITH CHECK ADD  CONSTRAINT [FK_videolike] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videolike] CHECK CONSTRAINT [FK_videolike]
GO
/****** Object:  ForeignKey [FK_videolike1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videolike]  WITH CHECK ADD  CONSTRAINT [FK_videolike1] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[videolike] CHECK CONSTRAINT [FK_videolike1]
GO
/****** Object:  ForeignKey [FK_videocomment]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videocomment]  WITH CHECK ADD  CONSTRAINT [FK_videocomment] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videocomment] CHECK CONSTRAINT [FK_videocomment]
GO
/****** Object:  ForeignKey [FK_videocomment1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videocomment]  WITH CHECK ADD  CONSTRAINT [FK_videocomment1] FOREIGN KEY([commentid])
REFERENCES [dbo].[comment] ([id])
GO
ALTER TABLE [dbo].[videocomment] CHECK CONSTRAINT [FK_videocomment1]
GO
/****** Object:  ForeignKey [FK_favirotevideo]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[favoritevideo]  WITH CHECK ADD  CONSTRAINT [FK_favirotevideo] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[favoritevideo] CHECK CONSTRAINT [FK_favirotevideo]
GO
/****** Object:  ForeignKey [FK_favirotevideo1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[favoritevideo]  WITH CHECK ADD  CONSTRAINT [FK_favirotevideo1] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[favoritevideo] CHECK CONSTRAINT [FK_favirotevideo1]
GO
/****** Object:  ForeignKey [FK_userreport]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport]
GO
/****** Object:  ForeignKey [FK_userreport1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport1] FOREIGN KEY([relatedvideoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport1]
GO
/****** Object:  ForeignKey [FK_userreport2]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[userreport]  WITH CHECK ADD  CONSTRAINT [FK_userreport2] FOREIGN KEY([relatedsongid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[userreport] CHECK CONSTRAINT [FK_userreport2]
GO
/****** Object:  ForeignKey [FK_songlike]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songlike]  WITH CHECK ADD  CONSTRAINT [FK_songlike] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songlike] CHECK CONSTRAINT [FK_songlike]
GO
/****** Object:  ForeignKey [FK_songlike1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songlike]  WITH CHECK ADD  CONSTRAINT [FK_songlike1] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[songlike] CHECK CONSTRAINT [FK_songlike1]
GO
/****** Object:  ForeignKey [FK_songcomment]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songcomment]  WITH CHECK ADD  CONSTRAINT [FK_songcomment] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songcomment] CHECK CONSTRAINT [FK_songcomment]
GO
/****** Object:  ForeignKey [FK_songcomment1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songcomment]  WITH CHECK ADD  CONSTRAINT [FK_songcomment1] FOREIGN KEY([commentid])
REFERENCES [dbo].[comment] ([id])
GO
ALTER TABLE [dbo].[songcomment] CHECK CONSTRAINT [FK_songcomment1]
GO
/****** Object:  ForeignKey [FK_favoritesong]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[favoritesong]  WITH CHECK ADD  CONSTRAINT [FK_favoritesong] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[favoritesong] CHECK CONSTRAINT [FK_favoritesong]
GO
/****** Object:  ForeignKey [FK_favoritesong1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[favoritesong]  WITH CHECK ADD  CONSTRAINT [FK_favoritesong1] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[favoritesong] CHECK CONSTRAINT [FK_favoritesong1]
GO
/****** Object:  ForeignKey [FK_bannedaccount]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[bannedaccount]  WITH CHECK ADD  CONSTRAINT [FK_bannedaccount] FOREIGN KEY([bannedreasonid])
REFERENCES [dbo].[bannedreason] ([id])
GO
ALTER TABLE [dbo].[bannedaccount] CHECK CONSTRAINT [FK_bannedaccount]
GO
/****** Object:  ForeignKey [FK_bannedaccount1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[bannedaccount]  WITH CHECK ADD  CONSTRAINT [FK_bannedaccount1] FOREIGN KEY([accountid])
REFERENCES [dbo].[user1] ([id])
GO
ALTER TABLE [dbo].[bannedaccount] CHECK CONSTRAINT [FK_bannedaccount1]
GO
/****** Object:  ForeignKey [FK_category]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category] FOREIGN KEY([categorytypeid])
REFERENCES [dbo].[categorytype] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category]
GO
/****** Object:  ForeignKey [FK_playistcategory]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[playistcategory]  WITH CHECK ADD  CONSTRAINT [FK_playistcategory] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[playistcategory] CHECK CONSTRAINT [FK_playistcategory]
GO
/****** Object:  ForeignKey [FK_playistcategory1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[playistcategory]  WITH CHECK ADD  CONSTRAINT [FK_playistcategory1] FOREIGN KEY([playistid])
REFERENCES [dbo].[playist] ([id])
GO
ALTER TABLE [dbo].[playistcategory] CHECK CONSTRAINT [FK_playistcategory1]
GO
/****** Object:  ForeignKey [FK_songsinger]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songsinger]  WITH CHECK ADD  CONSTRAINT [FK_songsinger] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songsinger] CHECK CONSTRAINT [FK_songsinger]
GO
/****** Object:  ForeignKey [FK_songsinger1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songsinger]  WITH CHECK ADD  CONSTRAINT [FK_songsinger1] FOREIGN KEY([singerid])
REFERENCES [dbo].[singer] ([id])
GO
ALTER TABLE [dbo].[songsinger] CHECK CONSTRAINT [FK_songsinger1]
GO
/****** Object:  ForeignKey [FK_songmusician]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songmusician]  WITH CHECK ADD  CONSTRAINT [FK_songmusician] FOREIGN KEY([musicianid])
REFERENCES [dbo].[musician] ([id])
GO
ALTER TABLE [dbo].[songmusician] CHECK CONSTRAINT [FK_songmusician]
GO
/****** Object:  ForeignKey [FK_songmusician1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songmusician]  WITH CHECK ADD  CONSTRAINT [FK_songmusician1] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songmusician] CHECK CONSTRAINT [FK_songmusician1]
GO
/****** Object:  ForeignKey [FK_videocategory]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videocategory]  WITH CHECK ADD  CONSTRAINT [FK_videocategory] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[videocategory] CHECK CONSTRAINT [FK_videocategory]
GO
/****** Object:  ForeignKey [FK_videocategory1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[videocategory]  WITH CHECK ADD  CONSTRAINT [FK_videocategory1] FOREIGN KEY([videoid])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[videocategory] CHECK CONSTRAINT [FK_videocategory1]
GO
/****** Object:  ForeignKey [FK_songcategory]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songcategory]  WITH CHECK ADD  CONSTRAINT [FK_songcategory] FOREIGN KEY([songid])
REFERENCES [dbo].[song] ([id])
GO
ALTER TABLE [dbo].[songcategory] CHECK CONSTRAINT [FK_songcategory]
GO
/****** Object:  ForeignKey [FK_songcategory1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[songcategory]  WITH CHECK ADD  CONSTRAINT [FK_songcategory1] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[songcategory] CHECK CONSTRAINT [FK_songcategory1]
GO
/****** Object:  ForeignKey [FK_singercategory]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[singercategories]  WITH CHECK ADD  CONSTRAINT [FK_singercategory] FOREIGN KEY([singerid])
REFERENCES [dbo].[singer] ([id])
GO
ALTER TABLE [dbo].[singercategories] CHECK CONSTRAINT [FK_singercategory]
GO
/****** Object:  ForeignKey [FK_singercategory1]    Script Date: 08/15/2014 23:21:46 ******/
ALTER TABLE [dbo].[singercategories]  WITH CHECK ADD  CONSTRAINT [FK_singercategory1] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[singercategories] CHECK CONSTRAINT [FK_singercategory1]
GO
