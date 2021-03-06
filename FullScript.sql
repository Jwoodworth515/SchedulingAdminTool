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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[StudentStatuses]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClassStatuses]
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClasses]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[Enrollments]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/9/2021 1:08:47 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/9/2021 1:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/9/2021 1:08:47 PM ******/
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
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/9/2021 1:08:47 PM ******/
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
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/9/2021 1:08:47 PM ******/
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
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 8/9/2021 1:08:47 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 8/9/2021 1:08:47 PM ******/
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
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 8/9/2021 1:08:47 PM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108041748052_InitialCreate', N'SchedulingAdminTool.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C4E8DE85B76D6F8C8C2F98B607791BB025769B1889D24A94D746902FCB433E29BF90A244A9255E74E9565FBC18606091C553C562912C168BFDBFFFFC77FCD36BE05B2F384E484827F6C9E8D8B63075438FD0E5C44ED9E2874FF64F3FFEF10FE32B2F78B5BE1674679C0E5AD264623F33169D3B4EE23EE30025A380B87198840B3672C3C0415EE89C1E1FFFCD3939713040D8806559E32F296524C0D9077C4E43EAE288A5C8BF0D3DEC27A21C6A6619AA7587029C44C8C5139B9778A90FF25D7801A18F61E88F9E6E46B75FA7A3BCB16D5DF804816033EC2F6C0B511A32C440ECF3A704CF581CD2E52C8202E43FBE4518E816C84FB0E8CEF98ABC6BCF8E4F79CF9C55C302CA4D1316063D014FCE84AA1CB9F95A0AB74B558232AF40E9EC8DF73A53E8C4BEF17056F425F4410132C3F3A91F73E2897D5BB2B848A23BCC4645C3510E791D03DC6F61FC7D54453CB23AB73B2A4DEB7474CCFF1D59D3D467698C2714A72C46FE91F590CE7DE2FE03BF3D86DF319D9C9DCC17679F3E7C44DED9C7BFE2B30FD59E425F81AE5600450F7118E11864C38BB2FFB6E5D4DB3972C3B259A54DAE15B025B042DBBA45AF9F315DB267983FA79F6CEB9ABC62AF2811C6F544094C2A68C4E2143EEF52DF47731F97F54E234FFE7F03D7D30F1F07E17A875EC8321B7A893F4C9C18E6D517EC67B5C93389F2E9551BEF6F82EC3A0E03FE5DB7AFBCF6DB2C4C6397772634923CA27889595DBAB1B332DE4E26CDA18637EB02F5F04D9B4BAA9AB7969477689D9950B0D8F56C28E4DD2EDFCE1677114530789969718D34195CEBDE3592C08E2C739395619D74352C0A1DFE3DAF93570122FE000B65072EE0B22C481CE0B2973FC3C860447BCBFC809204D609EFEF28796E101DFE1C40F41976D318CC77C650106D9DDBC37348F15D1ACCF9ACD81DAFC186E6F1B7F01AB92C8CAF286FB531DEE7D0FD1EA6EC8A7A9788E127E61680FCF39104DD010611E7C27571925C8331636F1A82475E00DE507676DA1B8EAF57FB7654A63E2281DE539156D66F05E9CA5BD153281E8B814CE7B53489FA395C12DA4DD482D42C6A4ED12AAA20EB2B2A07EB26A9A0340B9A11B4CA99530DE607662334BC2398C11EBE27B8D9E66D5A0B2A6A9CC10A897FC114C7B08C790F88311CD3D508745937F6E12C64C3C7996E7D6FCA387D457E3A34ABB56643B6080C3F1B32D8C39F0D999850FC423CEE9574381E15C400DF895E7FF26A9F739264BB9E0EB56EEE9AF96ED600D374B94892D025D92CD004C64458A32E3FF870567B8C23EF8D1C27818E81A113BEE54109F4CD968DEA9E5E621F336C5DB879E0708A121779AA1AA1435E0FC18A1D5523D82A5E5217EE2F0A4FB0741CF346881F821298A98432755A10EA9208F9AD5A925A76DCC278DF4B1E72CD258E30E50C5B35D185B93E3CC20528F94883D2A6A1B153B1B866433478ADA6316F736157E3AE442D7662932DBEB3C12E85FFB615C36CD6D80E8CB359255D043086FAF661A0E2ACD2D500E483CBA119A874623218A870A97662A0758DEDC140EB2A7977069A1F51BB8EBF745E3D34F3AC1F9477BFAD37AA6B0FB659D3C7819966EE7B421B062D70AC9AE7E59C57E257A6399C819CE27C9608575736110E3EC3AC1EB259F9BB5A3FD46906918DA8097065682DA0E29250015226540FE18A585EA374C28BE8015BC4DD1A61C5DA2FC1566C40C5AE5E965608CD57AAB271763A7D943D2BAD4131F24E87850A8EC620E4C5ABDEF10E4A31C56555C574F185FB78C3958E89C16850508BE76A5052D199C1B5549866BB96740E591F976C232D49EE93414B456706D792B0D17625699C821E6EC1462AAA6FE1034DB622D251EE3665DDD8C953AA44C1D831E45E8D6F511411BAACE46289126B9627624D7F98F54F490A720CC74D349949A5B4252716C66889A55A600D925E9338619788A139E2719EA9172864DABDD5B0FC172CABDBA73A88C53E5050F3BFC5CD6AEBD57E6DEB557D1301790D1D0EB8839345D535E6A06F6EF15439E4A35813C89F867E1A50B3BF656E9D5FE755DBE7252AC2D891E457FC2945798AD75B1F894EE3A4CE91ED8C59E9DDAC3F6E660893F60BDFB4AA7F93BF6A4629C257551453486B6FE368727336193BD9A1EC3F74AD08DB9975228BA50A208A7A6254122114B04A5D77D47AAE4A15B35ED31D514A48A9424A553DA4ACA69DD484AC56AC8567D0A89EA23B0735D1A48AAED67647D6A49C54A135D56B606B6496EBBAA36AB252AAC09AEAEED8AB1415794D3DE07DCD78CC196A63CB0FC69BED6C068CED2C90C36C8C95FBFF2A50A5B82796B8E157C044F9411A97F174389471E5E191CD8CCB80615E976A17E9F565A9F1F6DF8C59BB1DAF2DFD4DD90166BC7E26BC554351CE8A3249C9BD3C334A67C3B138A7B53FDE510E6E39896D156A04F37A4B180E469C6034FBD59FFA04F345BE20B845942C70C2F28C10FBF4F8E4547AF073388F6F9C24F17CCD39D7F402A73E663B48EEA22F28769F51ACA65A6CF0406505AA44B16FA8875F27F6BFB256E7594084FF95151F5937C91325BFA650F118A7D8FAB79A3A3A4CC27EF389EC409F5774D7EACD3FBFE54D8FACFB1866CCB9752CE9729D11AE3FBAE8254DDE740369D67E8AF17E2754ED258316559A10EB3F5C981336C8A38542CA3F05E8F5CF7D45D33E4CD80851F3F86028BC4154687A5CB00E96F16181079F2C7B58D0AFB3FA8706EB88667C6440687F30F98941F765A868B9C7AD467344DAC59294E9B935457BA37CCD7DEF4D4A26F746135DCDD6EE01B74146F61A96F1CE929907DB1D35B9CA8361EFD3B4B79EA07C2839C9AB6C91FDA622EF32FBB8E10EE97795747C0069729AB49FFDA716EFDAD64C61DD03CFCFEC97407C60C62692C1F69F26BC6B633385790FDCD87A25031F98ADED6BFFDCB3A575DE42F79EDAAB662919AE6774B1E0B6D4DD3C700E27FC790846907B94F98B4B7DAE58539E6B0BC3158999A939494D66AC4C1C85AF42D1CCB65F5FC586DFD85941D3CCD690DAD9C45BACFF8DBC054D336F43C2E43E928EB5298BBA44F09675AC2963EA3D2519D77AD292D3DEE6B336DEB5BFA79CE24194529B3D863BE2F793423C884A869C3A3D5286D5EB5ED83B2BBFE808FB7742962B08FEFB8E14BBB55DB3A4B9A18BB0D8BC25890A122942738B19F2604BBD881959209741358F31674FC6B3B81DBFE99863EF86DEA72C4A1974190773BF16F0E24E4013FF2C2FBA2EF3F83ECA7EFD64882E809884C7E6EFE9CF29F1BD52EE6B4D4CC800C1BD0B11D1E563C9786477F95622DD85B42390505FE9143DE220F2012CB9A733F482D7910DCCEF335E22F76D15013481B40F445DEDE34B8296310A1281B16A0F9F60C35EF0FAE3FF01316E7D8BD8540000, N'6.1.0-30225')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c243cb89-5398-4349-8eae-cdf95df88ca7', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'737bfe72-c7ca-4f12-bf96-e2890e3af010', N'Scheduling')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ae5ebcc1-5322-4b51-bc3f-47dc235a97a2', N'737bfe72-c7ca-4f12-bf96-e2890e3af010')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2f5ec98-dc3d-42a6-adf5-8735e72e9aa2', N'737bfe72-c7ca-4f12-bf96-e2890e3af010')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b0d975e0-5d0b-40b0-8d79-05659bff1af2', N'c243cb89-5398-4349-8eae-cdf95df88ca7')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ae5ebcc1-5322-4b51-bc3f-47dc235a97a2', N'scheduling@university.com', 0, N'AGIgGWoJKqbo2o54+aB/dW9tkzj7VhSLoWFus29b5J8hkMWSwnbJ187n/ry93BD/Og==', N'ffa2669c-1dde-4268-a1c0-ab5eb9a1af15', NULL, 0, 0, NULL, 1, 0, N'scheduling@university.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b0d975e0-5d0b-40b0-8d79-05659bff1af2', N'smalley.danielle@gmail.com', 0, N'AJmvOXdyD2r8lwwXOAdzepF+P0wbUJceE0R4ZD4kmNomoZH2bVEb6aQNkpABDOVxIA==', N'70d5724d-ad29-4ded-adb2-b558d386d38d', NULL, 0, 0, NULL, 1, 0, N'smalley.danielle@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c2f5ec98-dc3d-42a6-adf5-8735e72e9aa2', N'scheduling2@test.com', 0, N'APZkc5v7bJCIy0UhsOcSi+oZOiDwSBhqXAEFCT5dEbX+AqwWe7CnBauEXpdlUNKSfw==', N'c876e47a-c26d-415c-9c81-c89ecfc1a7ce', NULL, 0, 0, NULL, 1, 0, N'scheduling2@test.com')
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

INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (2, N'Eleven', N'Ives', N'Telepathy', N'333 A St', N'Hawkins', N'IN', N'46216', N'111-11-1111', N'eleven@student.com', N'd01b271c-ff8b-4ef9-96df-4d772b41dd8d.png', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (6, N'Mike', N'Wheeler', N'D&D', N'444 B St', N'Hawkins', N'IN', N'46216', N'222-22-2222', N'mike@student.com', N'4efed569-64af-4b56-95fb-157b115fec36.JPG', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (7, N'Dustin', N'Wheeler', N'Electronics', N'555 C St', N'Hawkins', N'IN', N'46216', N'333-33-3333', N'dustin@student.com', N'b6001046-2a57-4617-9af4-522d3f17e4f7.jpg', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (8, N'Will', N'Byers', N'Wildnerness', N'111 D St', N'Hawkins', N'IN', N'46216', N'444-44-4444', N'will@student.com', N'a3fc94d7-9d87-4bd9-beef-d80523740357.png', 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (9, N'Lucas', N'Sinclair', N'Sociology', N'222 E St', N'Hawkins', N'IN', N'46216', N'555-55-5555', N'lucas@student.com', N'18370b28-2098-4300-bcc1-12d03b07d41e.JPG', 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (10, N'Max', N'Mayfield', N'Skateboarding', N'666 F St', N'Hawkins', N'IN', N'46216', N'666-66-6666', N'max@student.com', N'bbbaf392-61d0-4509-b8de-5f0babcbbe31.jpg', 4)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (11, N'Billy', N'Hargrove', N'Combat', N'777 G St', N'Hawkins', N'IN', N'46216', N'777-77-7777', N'billy@student.com', N'07e5679f-ee88-4f46-ab6e-d46045b75a49.jpg', 6)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (12, N'Nancy', N'Wheeler', N'Journalism', N'888 H St', N'Hawkins', N'IN', N'46216', N'888-88-8888', N'nancy@student.com', N'c4cf8c12-0d3d-4902-b10a-6124ea60cf23.png', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (14, N'Steve', N'Harrington', N'Baseball', N'999 I St', N'Hawkins', N'IN', N'46216', N'999-99-9999', N'steve@student.com', N'9caba482-fc31-4fd7-8dea-ed805f486208.jpg', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (18, N'Jim', N'Hopper', N'CriminalJustice', N'100 J St', N'Hawkins', N'IN', N'46216', N'000-00-0000', N'jim@student.com', N'e2ba61c2-fa4a-49e3-a375-67b59b20229b.png', 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (19, N'Joyce', N'Byers', N'ChainSmoking', N'445 K St', N'Hawkins', N'IN', N'46216', N'334-44-5555', N'joyce@student.com', N'7cfbabc2-27ef-48ea-bcb1-55af85d628c5.jpg', 4)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (20, N'Bob', N'Newby', N'Business', N'554 L St', N'Hawkins', N'IN', N'46216', N'555-44-6666', N'bob@student.com', N'ce3f329f-c0ba-49d6-8612-725e8d91ab8a.jpg', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (21, N'Larry', N'Kline', N'Law', N'667 M St', N'Hawkins', N'IN', N'46216', N'777-55-4444', N'larry@student.com', N'2dd0310e-2270-4cbf-ad51-a4dc4982bd98.png', 5)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (23, N'test', N'test', N'test', N'test', N'test', N'mo', N'65201', N'111-111-1111', N'trest@test.com', NULL, 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (24, N'test', N'test', N'test', N'test', N'test', N'mo', N'65201', N'555-555-5555', N'test@test.com', N'780c3b76-a13a-4c4f-8385-853c88ac0bdd.png', 6)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[StudentStatuses] ON 

INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (1, N'Prospect', N'	A student who has inquired about taking classes at the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (2, N'Current Student', N'A student who is actively participating in classes.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (3, N'Former Student- Withdrawn', N'A student who has left the institution on their own accord. ')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (4, N'Former Student- Dismissed', N'A student who has left the institution at our request.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (5, N'Alumni', N'A student who has finished their coursework and left the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (6, N'Booted', N'This is what happens when you don''t go to class. ')
SET IDENTITY_INSERT [dbo].[StudentStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
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
