/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_StudentStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_Students]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_ScheduledClasses]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[StudentStatuses]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClassStatuses]
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClasses]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Enrollments]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/4/2021 9:10:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[CreditHours] [tinyint] NOT NULL,
	[Curriculum] [nvarchar](250) NULL,
	[Notes] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ScheduledClassId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClasses](
	[ScheduleClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[InstructorName] [nvarchar](40) NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
	[SCSID] [int] NOT NULL,
 CONSTRAINT [PK_ScheduledClasses] PRIMARY KEY CLUSTERED 
(
	[ScheduleClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClassStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClassStatuses](
	[SCSID] [int] IDENTITY(1,1) NOT NULL,
	[SCSName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduledClassStatuses] PRIMARY KEY CLUSTERED 
(
	[SCSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Major] [nvarchar](15) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](25) NULL,
	[State] [char](2) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](13) NULL,
	[Email] [nvarchar](60) NOT NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[SSID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/4/2021 9:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentStatuses](
	[SSID] [int] IDENTITY(1,1) NOT NULL,
	[SSName] [nvarchar](30) NOT NULL,
	[SSDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[SSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (2, N'Dungeons and Dragons', N'An in-depth dive into how to have a super fun D&D game', 3, N'Gaming', N'Requires close-toed shoes', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (4, N'Dealing With Demogorgons', N'An overview of fighting demogorgons', 4, N'Science', N'You  might die', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (5, N'Interdimensional Travel', N'A look at how to make it between multiple dimensions', 3, N'Science', N'It''s sometimes painful', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (6, N'Combat', N'Covers hand to hand combat as well as using random objects you find to fight with', 4, N'PE', N'Bring bandaids', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (7, N'Cartography', N'Making maps to track down your enemies', 3, N'Social Studies', NULL, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (8, N'Bicycle Building', N'How to build and maintain your ride', 3, N'Shop', NULL, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (9, N'Holiday Decorations', N'How to make a cozy home while your child is away in the upside down', 2, N'Crafts', NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (10, N'Setting Up Satellites', N'A guide to communicating with your crush via satellites', 3, N'Communications', N'', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (11, N'Scoops Ahoy', N'An ice cream making course focused on precise measurements', 3, N'Math', NULL, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (12, N'Photography', N'A beginning photography course for aspiring artists', 3, N'Elective', N'Bring your own camera', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (14, N'Baby Demogorgon Care', N'An intermediate course for caring for your baby demogorgon', 3, N'Elective', NULL, 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (1, 2, 10, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (4, 6, 16, CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (5, 7, 13, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (7, 8, 6, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (8, 9, 11, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (9, 10, 14, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (10, 11, 5, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (11, 12, 15, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (12, 14, 12, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (13, 18, 9, CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (14, 19, 17, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (15, 20, 16, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (16, 21, 11, CAST(N'2021-08-03' AS Date))
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClasses] ON 

INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (5, 12, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Jonathan Byers', N'RM13', 2)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (6, 5, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Dr Owens', N'RM05', 1)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (9, 9, CAST(N'2020-01-15' AS Date), CAST(N'2020-05-13' AS Date), N'Barb Holland', N'RM08', 4)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (10, 4, CAST(N'2021-05-10' AS Date), CAST(N'2021-08-04' AS Date), N'Dr Martin Brenner', N'RM10', 3)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (11, 6, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Erica Sinclair', N'RM16', 1)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (12, 11, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Robin Buckley', N'RM14', 2)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (13, 10, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Murray Gelman', N'RM11', 3)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (14, 7, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Karen Wheeler', N'RM03', 1)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (15, 8, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Ted Wheeler', N'RM01', 2)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (16, 2, CAST(N'2021-01-12' AS Date), CAST(N'2021-05-10' AS Date), N'Jonathan Byers', N'RM13', 3)
INSERT [dbo].[ScheduledClasses] ([ScheduleClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (17, 14, CAST(N'2021-08-20' AS Date), CAST(N'2021-12-10' AS Date), N'Dustin Wheeler', N'RM15', 4)
SET IDENTITY_INSERT [dbo].[ScheduledClasses] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] ON 

INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (1, N'Active')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (2, N'Pending')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (3, N'Completed')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (2, N'Eleven', N'Ives', N'Telepathy', N'333 A St', N'Hawkins', N'IN', N'46216', N'111-11-1111', N'eleven@student.com', NULL, 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (6, N'Mike', N'Wheeler', N'D&D', N'444 B St', N'Hawkins', N'IN', N'46216', N'222-22-2222', N'mike@student.com', NULL, 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (7, N'Dustin', N'Wheeler', N'Electronics', N'555 C St', N'Hawkins', N'IN', N'46216', N'333-33-3333', N'dustin@student.com', NULL, 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (8, N'Will', N'Byers', N'Wildnerness', N'111 D St', N'Hawkins', N'IN', N'46216', N'444-44-4444', N'will@student.com', NULL, 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (9, N'Lucas', N'Sinclair', N'Sociology', N'222 E St', N'Hawkins', N'IN', N'46216', N'555-55-5555', N'lucas@student.com', NULL, 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (10, N'Max', N'Mayfield', N'Skateboarding', N'666 F St', N'Hawkins', N'IN', N'46216', N'666-66-6666', N'max@student.com', NULL, 4)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (11, N'Billy', N'Hargrove', N'Combat', N'777 G St', N'Hawkins', N'IN', N'46216', N'777-77-7777', N'billy@student.com', NULL, 6)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (12, N'Nancy', N'Wheeler', N'Journalism', N'888 H St', N'Hawkins', N'IN', N'46216', N'888-88-8888', N'nancy@student.com', NULL, 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (14, N'Steve', N'Harrington', N'Baseball', N'999 I St', N'Hawkins', N'IN', N'46216', N'999-99-9999', N'steve@student.com', NULL, 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (18, N'Jim', N'Hopper', N'CriminalJustice', N'100 J St', N'Hawkins', N'IN', N'46216', N'000-00-0000', N'jim@student.com', NULL, 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (19, N'Joyce', N'Byers', N'ChainSmoking', N'445 K St', N'Hawkins', N'IN', N'46216', N'334-44-5555', N'joyce@student.com', NULL, 4)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (20, N'Bob', N'Newby', N'Business', N'554 L St', N'Hawkins', N'IN', N'46216', N'555-44-6666', N'bob@student.com', NULL, 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (21, N'Larry', N'Kline', N'Law', N'667 M St', N'Hawkins', N'IN', N'46216', N'777-55-4444', N'larry@student.com', NULL, 5)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[StudentStatuses] ON 

INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (1, N'Prospect', N'	A student who has inquired about taking classes at the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (2, N'Current Student', N'A student who is actively participating in classes.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (3, N'Former Student- Withdrawn', N'A student who has left the institution on their own accord. ')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (4, N'Former Student- Dismissed', N'A student who has left the institution at our request.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (5, N'Alumni', N'A student who has finished their coursework and left the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (6, N'Booted', N'This is what happens when you don''t go to class. ')
SET IDENTITY_INSERT [dbo].[StudentStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_ScheduledClasses] FOREIGN KEY([ScheduledClassId])
REFERENCES [dbo].[ScheduledClasses] ([ScheduleClassId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_ScheduledClasses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses] FOREIGN KEY([SCSID])
REFERENCES [dbo].[ScheduledClassStatuses] ([SCSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentStatuses] FOREIGN KEY([SSID])
REFERENCES [dbo].[StudentStatuses] ([SSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_StudentStatuses]
GO
