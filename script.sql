USE [mytesdb]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 23/06/2022 14:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[skillId] [int] NOT NULL,
	[skillName] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[skillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillLevel]    Script Date: 23/06/2022 14:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillLevel](
	[skillLevelId] [int] NOT NULL,
	[skillLevelName] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[skillLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23/06/2022 14:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 23/06/2022 14:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[username] [nvarchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[bod] [date] NULL,
	[email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSkills]    Script Date: 23/06/2022 14:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSkills](
	[UserSkillId] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[skillId] [int] NOT NULL,
	[skillLevelId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserSkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (1, N'PHP')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (2, N'C#')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (3, N'Python')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (4, N'Dart')
GO
INSERT [dbo].[SkillLevel] ([skillLevelId], [skillLevelName]) VALUES (1, N'Bronze')
INSERT [dbo].[SkillLevel] ([skillLevelId], [skillLevelName]) VALUES (2, N'Silver')
INSERT [dbo].[SkillLevel] ([skillLevelId], [skillLevelName]) VALUES (3, N'Gold')
INSERT [dbo].[SkillLevel] ([skillLevelId], [skillLevelName]) VALUES (4, N'Master')
INSERT [dbo].[SkillLevel] ([skillLevelId], [skillLevelName]) VALUES (5, N'Grand Master')
GO
INSERT [dbo].[User] ([username], [password]) VALUES (N'Dummy1', N'Password1')
INSERT [dbo].[User] ([username], [password]) VALUES (N'Dummy2', N'Password2')
INSERT [dbo].[User] ([username], [password]) VALUES (N'Dummy3', N'Password3')
INSERT [dbo].[User] ([username], [password]) VALUES (N'Dummy4', N'Password4')
INSERT [dbo].[User] ([username], [password]) VALUES (N'Dummy5', N'Password5')
GO
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'Dummy1', N'name1', N'address1', CAST(N'2022-06-23' AS Date), N'dummy1@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'Dummy2', N'name2', N'address2', CAST(N'2022-06-23' AS Date), N'dummy2@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'Dummy3', N'name3', N'address3', CAST(N'2022-06-23' AS Date), N'dummy3@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'Dummy4', N'name4', N'address4', CAST(N'2022-06-23' AS Date), N'dummy4@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'Dummy5', N'name5', N'address5', CAST(N'2022-06-23' AS Date), N'dummy5@gmail.com')
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD FOREIGN KEY([skillId])
REFERENCES [dbo].[Skill] ([skillId])
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD FOREIGN KEY([skillLevelId])
REFERENCES [dbo].[SkillLevel] ([skillLevelId])
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
