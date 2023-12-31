USE [master]
GO
/****** Object:  Database [NewSession1]    Script Date: 03.07.2023 23:34:16 ******/
CREATE DATABASE [NewSession1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewSession1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NewSession1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NewSession1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NewSession1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NewSession1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewSession1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewSession1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewSession1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewSession1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewSession1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewSession1] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewSession1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewSession1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewSession1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewSession1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewSession1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewSession1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewSession1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewSession1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewSession1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewSession1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NewSession1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewSession1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewSession1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewSession1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewSession1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewSession1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewSession1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewSession1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NewSession1] SET  MULTI_USER 
GO
ALTER DATABASE [NewSession1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewSession1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewSession1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewSession1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewSession1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NewSession1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NewSession1] SET QUERY_STORE = ON
GO
ALTER DATABASE [NewSession1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NewSession1]
GO
/****** Object:  Table [dbo].[Discussion]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discussion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NULL,
	[EmployeeId] [int] NULL,
	[Text] [nvarchar](500) NULL,
 CONSTRAINT [PK_Discussion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[MiddleName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Observer]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observer](
	[EmployeeId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
 CONSTRAINT [PK_Observer] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullTitle] [nvarchar](50) NULL,
	[ShortTitle] [nvarchar](20) NULL,
	[Icon] [image] NULL,
	[CreatedTime] [datetime] NULL,
	[DeletedTime] [datetime] NULL,
	[StartScheduledDate] [date] NULL,
	[FinishScheduledDate] [date] NULL,
	[Description] [nvarchar](500) NULL,
	[CreatorEmployeeId] [int] NULL,
	[ResponsibleEmployeeId] [int] NULL,
 CONSTRAINT [PK_Projcet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusHistory]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NULL,
	[StatusId] [int] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_StatusHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[FullTitle] [nvarchar](50) NULL,
	[ShortTitle] [nvarchar](20) NULL,
	[Description] [nvarchar](500) NULL,
	[ExecuriveEmployeeId] [int] NULL,
	[StatusId] [int] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[DeletedTime] [datetime] NULL,
	[Deadline] [datetime] NULL,
	[StartActualTime] [datetime] NULL,
	[FinishActualTime] [datetime] NULL,
	[PreviousTaskId] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 03.07.2023 23:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[ColorHex] [nvarchar](7) NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FirstName], [MiddleName], [LastName]) VALUES (1, N'Петров', N'Петр', N'Петрович')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (1, N'654', N'5345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (2, NULL, N'567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (3, NULL, N'567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (4, NULL, N'567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (5, NULL, N'7657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (6, NULL, N'5675', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (7, NULL, N'87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (8, NULL, N'6758959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (9, NULL, N'89789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (10, NULL, N'679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (11, NULL, N'6789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (12, NULL, N'7869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (13, NULL, N'576564', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (14, NULL, N'8764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (15, NULL, N'7567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (16, NULL, N'75647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (17, NULL, N'567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (18, NULL, N'8765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (19, NULL, N'346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (20, NULL, N'978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (21, NULL, N'367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (22, NULL, N'9786', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (23, NULL, N'3456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (24, NULL, N'967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (25, NULL, N'34567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (26, NULL, N'90678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (27, NULL, N'3467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (28, NULL, N'976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [FullTitle], [ShortTitle], [Icon], [CreatedTime], [DeletedTime], [StartScheduledDate], [FinishScheduledDate], [Description], [CreatorEmployeeId], [ResponsibleEmployeeId]) VALUES (29, NULL, N'567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [ProjectId], [FullTitle], [ShortTitle], [Description], [ExecuriveEmployeeId], [StatusId], [CreatedTime], [UpdatedTime], [DeletedTime], [Deadline], [StartActualTime], [FinishActualTime], [PreviousTaskId]) VALUES (8, 1, N'123', NULL, NULL, 1, 2, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-07-03T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [ProjectId], [FullTitle], [ShortTitle], [Description], [ExecuriveEmployeeId], [StatusId], [CreatedTime], [UpdatedTime], [DeletedTime], [Deadline], [StartActualTime], [FinishActualTime], [PreviousTaskId]) VALUES (9, 1, N'123', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2023-07-02T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] ON 

INSERT [dbo].[TaskStatus] ([Id], [Name], [ColorHex]) VALUES (1, N'Закрыта', NULL)
INSERT [dbo].[TaskStatus] ([Id], [Name], [ColorHex]) VALUES (2, N'Открыта', NULL)
INSERT [dbo].[TaskStatus] ([Id], [Name], [ColorHex]) VALUES (3, N'В работе', NULL)
SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
GO
ALTER TABLE [dbo].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Discussion] CHECK CONSTRAINT [FK_Discussion_Employee]
GO
ALTER TABLE [dbo].[Discussion]  WITH CHECK ADD  CONSTRAINT [FK_Discussion_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[Discussion] CHECK CONSTRAINT [FK_Discussion_Task]
GO
ALTER TABLE [dbo].[Observer]  WITH CHECK ADD  CONSTRAINT [FK_Observer_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Observer] CHECK CONSTRAINT [FK_Observer_Employee]
GO
ALTER TABLE [dbo].[Observer]  WITH CHECK ADD  CONSTRAINT [FK_Observer_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[Observer] CHECK CONSTRAINT [FK_Observer_Task]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employee] FOREIGN KEY([CreatorEmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Employee]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employee1] FOREIGN KEY([ResponsibleEmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Employee1]
GO
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_StatusHistory_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[StatusHistory] CHECK CONSTRAINT [FK_StatusHistory_Task]
GO
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_StatusHistory_TaskStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[StatusHistory] CHECK CONSTRAINT [FK_StatusHistory_TaskStatus]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Employee] FOREIGN KEY([ExecuriveEmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Employee]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_TaskStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_TaskStatus]
GO
USE [master]
GO
ALTER DATABASE [NewSession1] SET  READ_WRITE 
GO
