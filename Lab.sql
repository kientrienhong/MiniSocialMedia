USE [master]
GO
/****** Object:  Database [LAB1]    Script Date: 9/30/2020 3:01:45 PM ******/
CREATE DATABASE [LAB1] ON  PRIMARY 
( NAME = N'LAB1', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LAB1.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LAB1_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LAB1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LAB1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB1] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAB1] SET  MULTI_USER 
GO
ALTER DATABASE [LAB1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB1] SET DB_CHAINING OFF 
GO
USE [LAB1]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[image] [varchar](50) NULL,
	[date] [datetime] NOT NULL,
	[registrationEmail] [varchar](50) NOT NULL,
	[id] [varchar](100) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Article_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeVerify]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeVerify](
	[registrationEmail] [varchar](50) NOT NULL,
	[codeVerify] [varchar](15) NOT NULL,
 CONSTRAINT [PK_CodeVerify] PRIMARY KEY CLUSTERED 
(
	[registrationEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[articleId] [varchar](100) NOT NULL,
	[registrationEmail] [varchar](50) NOT NULL,
	[contentComment] [nvarchar](100) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[id] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emotion](
	[articleId] [varchar](100) NOT NULL,
	[registrationEmail] [varchar](50) NOT NULL,
	[isLike] [bit] NOT NULL,
	[id] [varchar](100) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Emotion] PRIMARY KEY CLUSTERED 
(
	[articleId] ASC,
	[registrationEmail] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[registrationEmail] [varchar](50) NOT NULL,
	[articleId] [varchar](100) NOT NULL,
	[date] [datetime] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[registrationEmail] ASC,
	[articleId] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 9/30/2020 3:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[email] [varchar](50) NOT NULL,
	[password] [varchar](80) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Weather', N'Today is beautiful', N'sunny.jpg', CAST(N'2020-09-28T16:10:10.853' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:10:10.853', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Weather', N'Today is very sad', N'rainny.jpg', CAST(N'2020-09-28T16:11:43.103' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:11:43.104', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Wallpaper', N'This my first wallpaper', N'wallpaper1.jpg', CAST(N'2020-09-28T16:12:10.697' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:12:10.697', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Vacation', N'Go to the beach', N'vacation.jpg', CAST(N'2020-09-28T16:13:14.017' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:13:14.015', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Grape', N'My favortite food', N'grape.png', CAST(N'2020-09-28T16:26:20.590' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:26:20.589', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'durian', N'This is my hatest fruit', N'durian.jpg', CAST(N'2020-09-28T16:27:05.237' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:27:05.235', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Food', N'My favorite cuisine is chinese cuisine', N'chinesecuisine.jpg', CAST(N'2020-09-28T16:28:16.560' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:28:16.559', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Vietnamese cuisine', N'I also like vietnamse cuisine', N'vietnamese-cuisine.jpg', CAST(N'2020-09-28T16:29:09.250' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:29:09.251', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'France bakery', N'It''s my favorite bakery', N'franceakery.jpg', CAST(N'2020-09-28T16:29:51.837' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:29:51.835', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'France Dessert', N'France has well reputation about dessert making', N'frenchdessert.jpg', CAST(N'2020-09-28T16:31:55.567' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 16:31:55.568', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Chocolate', N'I really like this sweet thing!!', N'chocolate1.jpg', CAST(N'2020-09-28T17:19:27.757' AS DateTime), N'kientrienhong@gmail.com', N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'France Dessert', N'I also love France Dessert', N'franceDessert.jpg', CAST(N'2020-09-28T16:33:39.453' AS DateTime), N'zxc', N'zxc__2020-09-28 16:33:39.453', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Durian', N'I like durian', N'durian.jpg', CAST(N'2020-09-28T16:34:22.647' AS DateTime), N'zxc', N'zxc__2020-09-28 16:34:22.645', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Vacation', N'I''m looking for a summer vocation', N'vacation.jpg', CAST(N'2020-09-28T16:34:58.073' AS DateTime), N'zxc', N'zxc__2020-09-28 16:34:58.074', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Rainy', N'I love rainny day', N'rainny.jpg', CAST(N'2020-09-28T16:35:22.477' AS DateTime), N'zxc', N'zxc__2020-09-28 16:35:22.475', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Japanses Dessert', N'I love japanese dessert', N'japansesdessert.jpg', CAST(N'2020-09-28T16:36:25.373' AS DateTime), N'zxc', N'zxc__2020-09-28 16:36:25.372', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Takoyaki', N'What a delicious food!', N'takoyaki.jpg', CAST(N'2020-09-28T16:37:05.227' AS DateTime), N'zxc', N'zxc__2020-09-28 16:37:05.226', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Oreo', N'Ice cream Oreo', N'oreo.jpg', CAST(N'2020-09-28T16:37:58.083' AS DateTime), N'zxc', N'zxc__2020-09-28 16:37:58.083', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Chocolate', N'Ice cream', N'chocolate.jpg', CAST(N'2020-09-28T16:38:35.507' AS DateTime), N'zxc', N'zxc__2020-09-28 16:38:35.507', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Junk food', N'a very delicious', N'junkfood.jpg', CAST(N'2020-09-28T16:39:19.843' AS DateTime), N'zxc', N'zxc__2020-09-28 16:39:19.844', N'Active')
INSERT [dbo].[Article] ([title], [description], [image], [date], [registrationEmail], [id], [status]) VALUES (N'Fast Food', N'It''s cheap and convienice for busy guys', N'fastfood.jpg', CAST(N'2020-09-28T16:40:26.093' AS DateTime), N'zxc', N'zxc__2020-09-28 16:40:26.092', N'Active')
INSERT [dbo].[CodeVerify] ([registrationEmail], [codeVerify]) VALUES (N'admin@gmail.com', N'XCXQHMOBNX')
INSERT [dbo].[CodeVerify] ([registrationEmail], [codeVerify]) VALUES (N'kientrienhong@gmail.com', N'ETIAGOEOSD')
INSERT [dbo].[Comment] ([articleId], [registrationEmail], [contentComment], [date], [status], [id]) VALUES (N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'kientrienhong@gmail.com', N'cực phẩm!!', CAST(N'2020-09-30T14:56:47.500' AS DateTime), N'Active', N'kientrienhong@gmail.com_2020-09-30 14:56:47.501')
INSERT [dbo].[Comment] ([articleId], [registrationEmail], [contentComment], [date], [status], [id]) VALUES (N'zxc__2020-09-28 16:40:26.092', N'kientrienhong@gmail.com', N'i agree to this opinion', CAST(N'2020-09-30T14:57:17.023' AS DateTime), N'Active', N'kientrienhong@gmail.com_2020-09-30 14:57:17.024')
INSERT [dbo].[Comment] ([articleId], [registrationEmail], [contentComment], [date], [status], [id]) VALUES (N'zxc__2020-09-28 16:36:25.372', N'kientrienhong@gmail.com', N'this makes me remind doreamon', CAST(N'2020-09-30T14:57:48.890' AS DateTime), N'Deactive', N'kientrienhong@gmail.com_2020-09-30 14:57:48.889')
INSERT [dbo].[Emotion] ([articleId], [registrationEmail], [isLike], [id], [status]) VALUES (N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'kientrienhong@gmail.com', 1, N'kientrienhong@gmail.com_kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'ACTIVE')
INSERT [dbo].[Emotion] ([articleId], [registrationEmail], [isLike], [id], [status]) VALUES (N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'zxc', 0, N'zxc_kientrienhong@gmail.com__2020-09-28 17:19:27.755', N'ACTIVE')
INSERT [dbo].[Emotion] ([articleId], [registrationEmail], [isLike], [id], [status]) VALUES (N'zxc__2020-09-28 16:38:35.507', N'kientrienhong@gmail.com', 1, N'kientrienhong@gmail.com_zxc__2020-09-28 16:38:35.507', N'ACTIVE')
INSERT [dbo].[Emotion] ([articleId], [registrationEmail], [isLike], [id], [status]) VALUES (N'zxc__2020-09-28 16:39:19.844', N'kientrienhong@gmail.com', 0, N'kientrienhong@gmail.com_zxc__2020-09-28 16:39:19.844', N'ACTIVE')
INSERT [dbo].[Emotion] ([articleId], [registrationEmail], [isLike], [id], [status]) VALUES (N'zxc__2020-09-28 16:40:26.092', N'kientrienhong@gmail.com', 1, N'kientrienhong@gmail.com_zxc__2020-09-28 16:40:26.092', N'ACTIVE')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:36:25.372', CAST(N'2020-09-30T14:57:48.890' AS DateTime), N'comment', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:38:35.507', CAST(N'2020-09-29T09:33:18.960' AS DateTime), N'like', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:39:19.844', CAST(N'2020-09-29T09:17:04.450' AS DateTime), N'comment', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:39:19.844', CAST(N'2020-09-29T09:22:24.600' AS DateTime), N'like', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:39:19.844', CAST(N'2020-09-29T09:30:34.063' AS DateTime), N'dislike', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:39:19.844', CAST(N'2020-09-29T17:16:32.213' AS DateTime), N'comment', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:40:26.092', CAST(N'2020-09-30T14:57:17.023' AS DateTime), N'comment', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'kientrienhong@gmail.com', N'zxc__2020-09-28 16:40:26.092', CAST(N'2020-09-30T14:57:19.607' AS DateTime), N'like', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'zxc', N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', CAST(N'2020-09-29T18:35:37.133' AS DateTime), N'like', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'zxc', N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', CAST(N'2020-09-29T18:41:18.313' AS DateTime), N'dislike', N'Active')
INSERT [dbo].[Notification] ([registrationEmail], [articleId], [date], [type], [status]) VALUES (N'zxc', N'kientrienhong@gmail.com__2020-09-28 17:19:27.755', CAST(N'2020-09-29T19:51:27.290' AS DateTime), N'comment', N'Active')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'123', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'New', N'member', N'123')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'admin@gmail.com', N'3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Active', N'admin', N'Admin')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'kientrienhong@gmail.com', N'3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Active', N'member', N'Kien Trien')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'kientrienhong@yahoo.com.vn', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'New', N'member', N'Trien')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'test@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Active', N'member', N'Test')
INSERT [dbo].[Registration] ([email], [password], [status], [role], [name]) VALUES (N'zxc', N'657f18518eaa2f41307895e18c3ba0d12d97b8a23c6de3966f52c6ba39a07ee4', N'Active', N'member', N'zxc')
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Registration1] FOREIGN KEY([registrationEmail])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Registration1]
GO
ALTER TABLE [dbo].[CodeVerify]  WITH CHECK ADD  CONSTRAINT [FK_CodeVerify_Registration] FOREIGN KEY([registrationEmail])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[CodeVerify] CHECK CONSTRAINT [FK_CodeVerify_Registration]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Registration] FOREIGN KEY([registrationEmail])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Registration]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Article] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([id])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Article]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Registration] FOREIGN KEY([registrationEmail])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Registration]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Article] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Article]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Registration] FOREIGN KEY([registrationEmail])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Registration]
GO
USE [master]
GO
ALTER DATABASE [LAB1] SET  READ_WRITE 
GO
