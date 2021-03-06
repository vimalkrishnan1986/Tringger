USE [master]
GO
/****** Object:  Database [IndiaProjects]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE DATABASE [IndiaProjects]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db393947431', FILENAME = N'C:\Users\Administrator\IndiaProjects.mdf' , SIZE = 25216KB , MAXSIZE = 204800KB , FILEGROWTH = 25%)
 LOG ON 
( NAME = N'db393947431_log', FILENAME = N'C:\Users\Administrator\IndiaProjects_log.ldf' , SIZE = 30208KB , MAXSIZE = 2048GB , FILEGROWTH = 20%)
GO
ALTER DATABASE [IndiaProjects] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IndiaProjects].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IndiaProjects] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IndiaProjects] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IndiaProjects] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IndiaProjects] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IndiaProjects] SET ARITHABORT OFF 
GO
ALTER DATABASE [IndiaProjects] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IndiaProjects] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [IndiaProjects] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IndiaProjects] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IndiaProjects] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IndiaProjects] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IndiaProjects] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IndiaProjects] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IndiaProjects] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IndiaProjects] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IndiaProjects] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IndiaProjects] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IndiaProjects] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IndiaProjects] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IndiaProjects] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IndiaProjects] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IndiaProjects] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IndiaProjects] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IndiaProjects] SET  MULTI_USER 
GO
ALTER DATABASE [IndiaProjects] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IndiaProjects] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IndiaProjects] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IndiaProjects] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IndiaProjects] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IndiaProjects] SET QUERY_STORE = OFF
GO
USE [IndiaProjects]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IndiaProjects]
GO
/****** Object:  User [Test]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [Test] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  User [Taskthru]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [Taskthru] WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  User [taskthrough]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [taskthrough] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [scheduleruser]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [scheduleruser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [S16859889\schpn]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [S16859889\schpn] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [S16859889\IWAM_plesk(default)]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [S16859889\IWAM_plesk(default)] WITH DEFAULT_SCHEMA=[db_datawriter]
GO
/****** Object:  User [NT Service\MSSQL$SQLEXPRESS]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [NT Service\MSSQL$SQLEXPRESS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jibby]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [jibby] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DbUser]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [DbUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dbo393947431]    Script Date: 3/5/2019 8:05:22 PM ******/
CREATE USER [dbo393947431] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Taskthru]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Taskthru]
GO
ALTER ROLE [db_owner] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_datareader] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [S16859889\schpn]
GO
ALTER ROLE [db_datareader] ADD MEMBER [S16859889\IWAM_plesk(default)]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [S16859889\IWAM_plesk(default)]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo393947431]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbo393947431]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbo393947431]
GO
/****** Object:  UserDefinedFunction [dbo].[DatesBetween]    Script Date: 3/5/2019 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DatesBetween](@startDate date, @endDate date)
RETURNS @dates TABLE (
   DateValue date NOT NULL
) 
AS
BEGIN
   WHILE (@startDate <= @endDate) BEGIN
      INSERT INTO @dates VALUES (@startDate);
      SET @startDate = DATEADD(day, 1, @startDate);
   END;
   
   RETURN;
END;
GO
/****** Object:  Table [dbo].[Purpose_Code_Master]    Script Date: 3/5/2019 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purpose_Code_Master](
	[Purpose_Code_Id] [int] IDENTITY(1,1) NOT NULL,
	[Purpose_Name] [varchar](500) NOT NULL,
	[Purpose_Code] [varchar](500) NOT NULL,
	[Remarks] [varchar](500) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[TimeAllotted] [int] NULL,
	[LocationInterval] [int] NULL,
	[CompanyName] [int] NULL,
	[CompanyUnitID] [int] NULL,
 CONSTRAINT [PK__Purpose___65F8646922FF2F51] PRIMARY KEY CLUSTERED 
(
	[Purpose_Code_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Purpose___15A42C5628B808A7] UNIQUE NONCLUSTERED 
(
	[Purpose_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Purpose___15A42C56F96DC85B] UNIQUE NONCLUSTERED 
(
	[Purpose_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Purpose___BA8A550C25DB9BFC] UNIQUE NONCLUSTERED 
(
	[Purpose_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Purpose___BA8A550C5F3FD7B0] UNIQUE NONCLUSTERED 
(
	[Purpose_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Master]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Master](
	[Staff_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [int] NULL,
	[Date_of_Birth] [datetime] NULL,
	[Higher_Qualification] [varchar](100) NULL,
	[Department_Name] [int] NULL,
	[Team_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Salary] [numeric](18, 0) NULL,
	[Email_Id] [varchar](75) NULL,
	[Address] [varchar](1500) NULL,
	[Contact_No] [varchar](20) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Skills_Details] [varchar](1000) NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
	[Entered_Unit] [int] NULL,
	[Is_Admin] [bit] NULL,
	[Employee_Code] [nchar](10) NULL,
	[Employee_Status] [varchar](20) NULL,
	[Is_MasterAdmin] [bit] NULL,
	[Blood_Group] [varchar](10) NULL,
	[Family_Details] [varchar](1000) NULL,
	[ESI_Card_No] [varchar](30) NULL,
	[Insurance_Policy_No] [varchar](100) NULL,
	[PAN_No] [varchar](50) NULL,
	[DIN_No] [varchar](30) NULL,
	[Bank_Details] [varchar](500) NULL,
	[Pass_Port_No] [varchar](50) NULL,
	[Date_of_Issue] [datetime] NULL,
	[Date_of_Expiry] [datetime] NULL,
	[Date_of_Join] [datetime] NULL,
	[ECNR_Required_Or_Not] [bit] NULL,
	[Mobile_No] [varchar](20) NULL,
	[Residence_No] [varchar](20) NULL,
	[PF_Account_No] [varchar](30) NULL,
	[Passport_Details] [varchar](500) NULL,
	[Date_Of_Departure] [datetime] NULL,
	[Departure_Location] [varchar](500) NULL,
	[Level] [varchar](50) NULL,
	[Permanent_Address] [varchar](1000) NULL,
	[Next_of_Kin] [varchar](150) NULL,
	[Relation_Next_Kin] [varchar](150) NULL,
	[Adhaar_No] [nvarchar](50) NULL,
	[Skill_Id] [int] NULL,
	[Emp_Name] [varchar](100) NULL,
	[PicPath] [varchar](100) NULL,
	[Band] [int] NULL,
	[CampaignID] [int] NULL,
	[ClientID] [int] NULL,
	[VehicleId] [int] NULL,
	[Rate] [float] NULL,
	[LeadID] [int] NULL,
 CONSTRAINT [PK__Staff_Master__023D5A04] PRIMARY KEY CLUSTERED 
(
	[Staff_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Unit_Master]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Unit_Master](
	[Unit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NOT NULL,
	[Contact_Person] [int] NULL,
	[Address] [varchar](1000) NULL,
	[Phone_Number] [varchar](15) NULL,
	[Mobile_No] [varchar](15) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Company_Unit_Name] [varchar](100) NULL,
	[Entered_Unit] [int] NULL,
	[NoOfUser] [int] NULL,
 CONSTRAINT [PK__Company_Unit_Mas__300424B4] PRIMARY KEY CLUSTERED 
(
	[Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Master]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Master](
	[Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [int] NOT NULL,
	[Task_Name] [varchar](300) NULL,
	[Task_Description] [varchar](1000) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NOT NULL,
	[Resource] [int] NOT NULL,
	[Task_Status] [int] NULL,
	[Remarks] [text] NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
	[Department_Name] [int] NULL,
	[Team_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Task_RefId] [int] NULL,
	[Task_Configuration_Id] [int] NULL,
	[Process_Id] [int] NULL,
	[Parent_TaskId] [int] NULL,
	[Completed_Date] [datetime] NULL,
	[Sub_Task_Id] [int] NULL,
	[LeadId] [int] NULL,
	[Location] [varchar](500) NULL,
	[Task_Map_Id] [int] NULL,
	[Auto] [nchar](1) NULL,
	[Replan] [nchar](1) NULL,
	[EnquiryNo] [int] NULL,
 CONSTRAINT [PK__Task_Master__0F975522] PRIMARY KEY CLUSTERED 
(
	[Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Sheet_Status]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Sheet_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Id] [int] NOT NULL,
	[Color_Code] [varchar](10) NOT NULL,
	[Status_Name] [varchar](30) NOT NULL,
	[Light_Color_Code] [varchar](10) NULL,
 CONSTRAINT [PK__Time_She__5190094C7760F5D3] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Time_She__7D84CE068E807041] UNIQUE NONCLUSTERED 
(
	[Status_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Sheet_Master]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Sheet_Master](
	[Time_Sheet_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Date] [date] NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Purpose_Name] [int] NULL,
	[Start_Time] [time](7) NULL,
	[End_Time] [time](7) NULL,
	[Status] [int] NULL,
	[Remarks] [varchar](max) NULL,
	[Entered_By] [int] NOT NULL,
	[Modified_By] [int] NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Modified_Date] [datetime] NULL,
	[Entered_Unit] [int] NOT NULL,
	[Approve_Status] [varchar](50) NULL,
	[Approved_By] [int] NULL,
	[Approve_Date] [datetime] NULL,
	[Location] [varchar](500) NULL,
	[Is_Mobile] [bit] NULL,
	[Task_Id] [int] NULL,
	[Emails] [varchar](1000) NULL,
	[IncludeStats] [nchar](1) NULL,
	[End_Location] [varchar](500) NULL,
	[UniqueTrack] [nvarchar](20) NULL,
	[PlainNote] [nvarchar](500) NULL,
	[Replan] [nvarchar](1) NULL,
	[End_Date] [date] NULL,
	[PStart_Time] [time](7) NULL,
	[PEnd_Time] [time](7) NULL,
	[ExecEntry] [int] NULL,
	[PlainRemarks] [varchar](max) NULL,
	[Display] [int] NULL,
	[TripPlanOrder] [int] NULL,
	[Distance] [decimal](18, 0) NULL,
	[TripPlanID] [int] NULL,
	[Duration] [decimal](18, 0) NULL,
	[ETA] [time](7) NULL,
 CONSTRAINT [PK__Time_She__C1B8045277DFC722] PRIMARY KEY CLUSTERED 
(
	[Time_Sheet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Time_Sheet_Master]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_Time_Sheet_Master]

as

SELECT   dbo.Time_Sheet_Master.Time_Sheet_Id, dbo.Time_Sheet_Master.Task_Date, CAST(DAY(dbo.Time_Sheet_Master.Task_Date) AS VARCHAR) + '-' + SUBSTRING(DATENAME(MM, dbo.Time_Sheet_Master.Task_Date), 1, 3) + '-' + CAST(YEAR(dbo.Time_Sheet_Master.Task_Date) 
AS VARCHAR) AS Time_Sheet_Date, Staff_Master_Staff_Name.Staff_Name, dbo.Time_Sheet_Master.Staff_Name AS Staff_Id, ISNULL(Purpose_Code_Master_Purpose_Name.Purpose_Name, Task_Master.Task_Name) AS Purpose_Name, Purpose_Code_Master_Purpose_Name.Purpose_Code_Id, dbo.Time_Sheet_Master.Task_Id, dbo.Time_Sheet_Master.Start_Time, dbo.Time_Sheet_Master.End_Time, Time_Sheet_Status_Status.Status_Name AS Status, Time_Sheet_Status_Status.Color_Code, dbo.Time_Sheet_Master.Approve_Status, dbo.Time_Sheet_Master.Remarks,Staff_Master_Entered_By.Staff_Name AS Entered_By, Staff_Master_Modified_By.Staff_Name AS Modified_By, dbo.Time_Sheet_Master.Entered_Date, dbo.Time_Sheet_Master.Modified_Date, Company_Unit_Master_Entered_Unit.Company_Unit_Name AS Entered_Unit, Company_Unit_Master_Entered_Unit.Unit_Id, dbo.Time_Sheet_Master.Location, dbo.Time_Sheet_Master.End_Location, dbo.Time_Sheet_Master.Emails,dbo.Time_Sheet_Master.UniqueTrack,  dbo.Time_Sheet_Master.PlainNote as Activity, dbo.Time_Sheet_Master.End_Date, dbo.Time_Sheet_Master.PStart_Time,dbo.Time_Sheet_Master.PEnd_Time,dbo.Time_Sheet_Master.PlainRemarks, Time_Sheet_Master.Status as StatusID, Time_Sheet_Master.ETA, Time_Sheet_Master.Duration, Time_Sheet_Master.Distance,  Time_Sheet_Master.Display FROM dbo.Time_Sheet_Master LEFT OUTER JOIN dbo.Staff_Master AS Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id = dbo.Time_Sheet_Master.Staff_Name LEFT OUTER JOIN dbo.Purpose_Code_Master AS Purpose_Code_Master_Purpose_Name ON  Purpose_Code_Master_Purpose_Name.Purpose_Code_Id = dbo.Time_Sheet_Master.Purpose_Name LEFT OUTER JOIN dbo.Time_Sheet_Status AS Time_Sheet_Status_Status ON Time_Sheet_Status_Status.Status_Id = dbo.Time_Sheet_Master.Status LEFT OUTER JOIN dbo.Task_Master AS Task_Master ON Task_Master.Task_Id = dbo.Time_Sheet_Master.Task_Id LEFT OUTER JOIN dbo.Staff_Master AS Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id = dbo.Time_Sheet_Master.Entered_By LEFT OUTER JOIN dbo.Staff_Master AS Staff_Master_Modified_By ON Staff_Master_Modified_By.Staff_Id = dbo.Time_Sheet_Master.Modified_By LEFT OUTER JOIN dbo.Company_Unit_Master AS Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id = dbo.Time_Sheet_Master.Entered_Unit
GO
/****** Object:  View [dbo].[PurposeCode_TimeSheet]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[PurposeCode_TimeSheet]
			as
			select * from Vw_Time_Sheet_Master  where Purpose_Code_Id is not null and Task_Id is null
GO
/****** Object:  Table [dbo].[tblCampaignLead]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampaignLead](
	[Campaign_Lead_Id] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_Id] [int] NULL,
	[Lead_Id] [int] NULL,
	[Staff_Id] [int] NULL,
	[Action] [nvarchar](25) NULL,
	[Time] [datetime] NULL,
	[flag] [nchar](1) NULL,
	[Sub_Status] [int] NULL,
	[status] [nvarchar](25) NULL,
	[Mode_Id] [int] NULL,
	[CampModeTemp_Id] [int] NULL,
	[Rating] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[CurrentStaff] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_tblCampaignLead] PRIMARY KEY CLUSTERED 
(
	[Campaign_Lead_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFieldMoreStatusMaster]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFieldMoreStatusMaster](
	[FieldMore_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadStatusId] [int] NULL,
	[Status_No] [int] NULL,
	[Status_Details] [varchar](50) NULL,
	[Rating] [decimal](18, 2) NULL,
	[ActionTiming] [int] NULL,
	[ActivityStartTime] [varchar](50) NULL,
	[ActivityInterval] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Time] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Def] [int] NULL,
	[Department] [int] NULL,
	[NextStatus] [int] NULL,
 CONSTRAINT [PK_tblFieldMoreStatusMaster] PRIMARY KEY CLUSTERED 
(
	[FieldMore_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLeadMaster]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeadMaster](
	[Lead_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Mobile_No] [varchar](20) NULL,
	[Address] [varchar](500) NULL,
	[Lane_No] [varchar](500) NULL,
	[Locality] [varchar](80) NULL,
	[City] [varchar](100) NULL,
	[Pincode] [varchar](20) NULL,
	[State] [varchar](80) NULL,
	[Country] [varchar](100) NULL,
	[Created_On] [datetime] NULL,
	[Created_Type] [varchar](10) NULL,
	[Created_By] [int] NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [int] NULL,
	[CampaignID] [nvarchar](100) NULL,
	[CRM_Document] [varchar](500) NULL,
	[EMail] [varchar](200) NULL,
	[SMS] [varchar](500) NULL,
	[Age] [varchar](50) NULL,
	[Salary] [int] NULL,
	[Type] [int] NULL,
	[EnquiryNo] [int] NULL,
	[Organization] [varchar](200) NULL,
	[Designation] [varchar](100) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Discount] [int] NULL,
	[Handler] [nvarchar](50) NULL,
	[ApartmentNo] [nvarchar](50) NULL,
	[PostCode] [nvarchar](10) NULL,
	[House_No] [nvarchar](50) NULL,
	[StreetName] [nvarchar](200) NULL,
	[Followup_Details] [nvarchar](max) NULL,
	[ShortAddress] [nvarchar](500) NULL,
	[TempOrderInstructions] [nvarchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
 CONSTRAINT [PK_tblLeadMaster] PRIMARY KEY CLUSTERED 
(
	[Lead_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLeadStatusMaster]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeadStatusMaster](
	[Lead_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_No] [int] NULL,
	[Status_Details] [varchar](50) NULL,
	[Rating] [int] NULL,
	[ActionTiming] [int] NULL,
	[ActivityStartTime] [varchar](50) NULL,
	[ActivityInterval] [int] NULL,
 CONSTRAINT [PK_tblLeadStatusMaster] PRIMARY KEY CLUSTERED 
(
	[Lead_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CampaignToLeadFullView]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CampaignToLeadFullView] as
select t1.Lead_ID,  t1.status as 'MasterStatus', t6.Status_Details as 'MasterStatusName', t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no, t4.Address, t4.EMail, t4.EnquiryNo, t1.Campaign_Id, t1.Campaign_Lead_Id, t1.CreatedDate,t5.Staff_Id from tblCampaignLead t1 join tblLeadMaster t4 on t1.Lead_Id = t4.Lead_Id join Staff_Master t5 on t1.Staff_Id = t5.Staff_Id join tblLeadStatusMaster t6 on t1.status = t6.Status_No  join tblFieldMoreStatusMaster t7 on t6.Status_No = t7.LeadStatusId 
GO
/****** Object:  Table [dbo].[LeadValues]    Script Date: 3/5/2019 8:05:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadValues](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NULL,
	[LeadId] [int] NULL,
	[Task_Configuration_Id] [int] NULL,
	[Qty] [int] NULL,
	[Price] [int] NULL,
	[TotalPrice] [int] NULL,
	[Date] [datetime] NULL,
	[Added] [nchar](1) NULL,
	[CRMInvoice] [int] NULL,
	[Task_Id] [int] NULL,
	[Discounts] [int] NULL,
	[AddedOrder] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TotalLeadValues]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[TotalLeadValues] 

as 

select Task_Id, LeadId, Sum(TotalPrice) as "TotalValue" from LeadValues where Added ='n' group by Task_Id, LeadId
GO
/****** Object:  View [dbo].[CampaignToLeadExtendedView]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CampaignToLeadExtendedView] as 
select t1.Lead_Id, t2.Status_Details as 'MasterStats', t1.MasterStatus, t3.Status_Details as 'SubStats',t1.FieldSubStatus, t1.Name, t1.Staff_Name, t1.LastTime, t1.Mobile_No, t1.Address, t1.Email, t1.EnquiryNo, t1.Campaign_Id, t1.Campaign_Lead_Id, t1.CreatedDate, t3.Rating as 'FieldStatusRating', t2.Rating as 'MasterStatusRating',t1.Staff_Id, t4.TotalValue from CampaignToLeadFullView t1 join tblLeadStatusMaster t2 on t1.MasterStatus = t2.Status_No join tblFieldMoreStatusMaster t3 on t1.FieldSubStatus = t3.Status_No left outer join TotalLeadValues t4 on t1.Lead_Id = t4.LeadId where t3.LeadStatusId = t1.MasterStatus
GO
/****** Object:  View [dbo].[CompleteLeadMaster]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CompleteLeadMaster]
as
select distinct t1.Lead_Id, t1.EnquiryNo, t1.Name, t1.Mobile_No, t1.Address, t1.Email,  t1.PinCode, t1.City, t1.Created_On, t1.Type,  ISNULL(t2.FieldStatusRating + t2.MasterStatusRating,0) as  'StarRating' from tblLeadMaster t1 left outer join CampaignToLeadExtendedView t2 on t1.Lead_Id=t2.Lead_Id
GO
/****** Object:  Table [dbo].[Attendance_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance_Master](
	[Attendance_Id] [int] IDENTITY(1,1) NOT NULL,
	[Attendance_Date] [date] NULL,
	[Staff_Name] [int] NULL,
	[In_Time] [time](7) NOT NULL,
	[Out_Time] [time](7) NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[SignIn_Location] [varchar](500) NULL,
	[SignOut_Location] [varchar](500) NULL,
	[Is_MobileSignIn] [bit] NULL,
	[Is_MobileSignOut] [bit] NULL,
	[DeviceId] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Attendance_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location_Log_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Log_Master](
	[Location_Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longtitude] [nvarchar](50) NULL,
	[TimeStamp] [datetime] NULL,
	[Staff_Id] [int] NULL,
 CONSTRAINT [PK_Location_Log_Master] PRIMARY KEY CLUSTERED 
(
	[Location_Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UsersForMap]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[UsersForMap]   
as  
SELECT t1.*, t2.Emp_Name as 'Staff_Name', t2.PicPath, t2.Mobile_No, t2.Rate  FROM Location_Log_Master t1 join Staff_Master t2 on t1.Staff_Id=t2.Staff_Id join Attendance_Master t4 on t1.Staff_Id = t4.Staff_Name where  Cast(t4.Attendance_Date as date) = cast(GetDate() as date) and t4.In_Time is not null and t4.Out_Time is null 
GO
/****** Object:  View [dbo].[UsersForMapToday]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[UsersForMapToday]
as
select Staff_Id from UsersForMap where (Cast(TimeStamp as Date)= Cast(GetDate() as Date)) group by Staff_Id
GO
/****** Object:  View [dbo].[UsersForMapTopLocID]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[UsersForMapTopLocID]
as
Select MAX(t3.Location_Log_Id) as 'Location_Log_Id', t4.Staff_Id from UsersForMap t3 inner join UsersForMapToday t4 on t3.Staff_Id=t4.Staff_Id group by t4.Staff_Id

GO
/****** Object:  Table [dbo].[Project_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Master](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [varchar](150) NOT NULL,
	[Project_Short_Name] [varchar](30) NULL,
	[Client_Name] [int] NULL,
	[Start_Date] [datetime] NOT NULL,
	[End_Date] [datetime] NULL,
	[Statement_of_Work] [varchar](1500) NULL,
	[Project_Purpose] [varchar](1000) NULL,
	[Comments] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Is_Active] [bit] NULL,
	[Expected_Start_Date] [datetime] NULL,
	[Expected_End_Date] [datetime] NULL,
	[Date_Of_Order] [datetime] NULL,
	[Planned_ManHours] [int] NULL,
	[Work_Start_Date] [datetime] NULL,
	[Work_End_Date] [datetime] NULL,
	[CRMCampaign] [nchar](1) NULL,
	[CampaignCost] [decimal](18, 0) NULL,
	[CampaignMode] [nvarchar](50) NULL,
 CONSTRAINT [PK__Project_Master__0BC6C43E] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Project_Master__0CBAE877] UNIQUE NONCLUSTERED 
(
	[Project_Short_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Project_Master__0DAF0CB0] UNIQUE NONCLUSTERED 
(
	[Project_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Master](
	[Department_Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [varchar](75) NOT NULL,
	[Rolse_and_Response] [varchar](1500) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Is_Field] [int] NULL,
	[Closed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Status_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Status_Master](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Value] [varchar](50) NOT NULL,
	[Color_Code] [varchar](10) NULL,
	[Color_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Status_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_Master](
	[Designation_Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation_Name] [varchar](100) NULL,
	[Rolse_and_Response] [varchar](1500) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Incentive_Points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Designation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_Master](
	[Team_Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [int] NOT NULL,
	[Team_Name] [varchar](50) NOT NULL,
	[Rolse_and_Response] [varchar](1500) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Team_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Task_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Task_Master]
AS
SELECT
Task_Master.Task_Id As [Task_Id],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Project_Master_Project_Name.ProjectId AS [ProjectId],
Project_Master_Project_Name.Planned_ManHours AS [Planned_ManHours],
Task_Master.Task_Name As [Task_Name],
Task_Master.Task_Description As [Task_Description],
Task_Master.Start_Date As [Start_Date],
Task_Master.End_Date As [End_Date],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Team_Master_Team_Name.Team_Name AS [Team_Name],
Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],
Staff_Master_Resource.Staff_Name AS [Resource],
Task_Status_Master_Task_Status.Status_Value AS [Task_Status],
Task_Master.Entered_Date As [Entered_Date],
Task_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Project_Master_Project_Name.Is_Active AS [Is_Active],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit] ,
Task_Master.Task_Configuration_Id AS [Task_Configuration_Id],
Task_Status_Master_Task_Status.Status_Id AS [Status_Id]  ,
Task_Status_Master_Task_Status.Color_Code AS [Color_Code]
FROM Task_Master
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Task_Master.Project_Name
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Task_Master.Department_Name
LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Task_Master.Team_Name
LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Task_Master.Designation_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Resource ON Staff_Master_Resource.Staff_Id=Task_Master.Resource
LEFT OUTER JOIN Task_Status_Master As Task_Status_Master_Task_Status ON Task_Status_Master_Task_Status.Status_Id=Task_Master.Task_Status
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Task_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Task_Master.Entered_Unit


GO
/****** Object:  View [dbo].[VW_TimeSheetAndTaskMaster]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_TimeSheetAndTaskMaster]

AS

SELECT dbo.VW_Time_Sheet_Master.Time_Sheet_Id, dbo.VW_Time_Sheet_Master.Task_Date, dbo.VW_Time_Sheet_Master.Time_Sheet_Date, dbo.VW_Time_Sheet_Master.Staff_Name, dbo.VW_Time_Sheet_Master.Staff_Id,  dbo.VW_Time_Sheet_Master.Purpose_Code_Id, 
dbo.VW_Time_Sheet_Master.Task_Id, dbo.VW_Time_Sheet_Master.Start_Time, dbo.VW_Time_Sheet_Master.End_Time, dbo.VW_Time_Sheet_Master.Status, dbo.VW_Time_Sheet_Master.Color_Code, dbo.VW_Time_Sheet_Master.Approve_Status,dbo.VW_Time_Sheet_Master.Remarks, dbo.VW_Time_Sheet_Master.Entered_By, dbo.VW_Time_Sheet_Master.Modified_By,dbo.VW_Time_Sheet_Master.Entered_Date, dbo.VW_Time_Sheet_Master.Modified_Date, dbo.VW_Time_Sheet_Master.Entered_Unit,dbo.VW_Time_Sheet_Master.Unit_Id,dbo.VW_Time_Sheet_Master.Location, dbo.VW_Time_Sheet_Master.End_Location, dbo.VW_Time_Sheet_Master.Emails, dbo.VW_Task_Master.Project_Name, dbo.VW_Task_Master.Task_Name, dbo.VW_Task_Master.Start_Date AS Task_Start_Date, dbo.VW_Task_Master.End_Date AS Task_End_Date, dbo.VW_Task_Master.Task_Status, dbo.VW_Task_Master.Task_Description, dbo.VW_Time_Sheet_Master.UniqueTrack, dbo.VW_Time_Sheet_Master.Activity, dbo.VW_Task_Master.ProjectId, dbo.VW_Time_Sheet_Master.Purpose_Name, dbo.VW_Time_Sheet_Master.PlainRemarks FROM  dbo.VW_Time_Sheet_Master LEFT OUTER JOIN dbo.VW_Task_Master ON 
dbo.VW_Time_Sheet_Master.Task_Id = dbo.VW_Task_Master.Task_Id
GO
/****** Object:  Table [dbo].[CRMInvoices]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRMInvoices](
	[InvId] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NULL,
	[Lead_Id] [int] NULL,
	[BasePrice] [int] NULL,
	[AllTax] [int] NULL,
	[Installation] [int] NULL,
	[Transportation] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Added] [int] NULL,
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[Task_Id] [int] NULL,
	[Discount] [int] NULL,
	[Bal] [int] NULL,
	[Closed] [int] NULL,
	[ClosedDate] [date] NULL,
	[TotalValue]  AS (((([BasePrice]-[Discount])+[AllTax])+[Installation])+[Transportation])
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquiries]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquiries](
	[EnqId] [int] IDENTITY(1,1) NOT NULL,
	[EnqNo] [int] NULL,
	[LeadId] [int] NULL,
	[CampaignID] [int] NULL,
	[CreatedTime] [datetime] NULL,
	[EnteredBy] [int] NULL,
	[UnitId] [int] NULL,
	[status] [int] NULL,
	[Sub_Status] [int] NULL,
	[Time] [datetime] NULL,
	[Staff_Id] [int] NULL,
	[Rating] [decimal](18, 0) NULL,
	[Task_Id] [int] NULL,
	[CurrentStaff] [int] NULL,
	[flag] [nchar](1) NULL,
	[NextTime] [datetime] NULL,
	[Handler] [nchar](20) NULL,
	[DMode] [int] NULL,
	[DInstructions] [nvarchar](500) NULL,
	[CMode] [int] NULL,
	[BMode] [int] NULL,
	[DestAddress] [varchar](500) NULL,
	[DestPinCode] [nvarchar](10) NULL,
	[DestHouseNo] [nvarchar](50) NULL,
	[DestStreetName] [nchar](200) NULL,
	[DestShortAddress] [nvarchar](500) NULL,
	[DestLatitude] [float] NULL,
	[DestLongitude] [float] NULL,
	[DestCity] [nvarchar](50) NULL,
	[DestState] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CampaignToLeadFullView3]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CampaignToLeadFullView3] as



select top 1 t1.LeadId as 'Lead_Id',  t1.status as 'MasterStatus', t6.Status_Details as 'MasterStatusName', t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no, t4.Address, t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.EnqNo, t1.CreatedTime,t5.Staff_Id, t1.Task_Id, t1.CurrentStaff, t7.Rating as 'SubRating', t6.Rating as 'MasterRating', t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.Bal, t9.Time_Sheet_Id from Enquiries t1 inner join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id inner join tblLeadStatusMaster t6 on t1.status = t6.Status_No inner join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id inner join Task_Master t8 on t1.Task_Id = t8.Task_Id inner join Staff_Master t5 on t8.Resource = t5.Staff_Id inner join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id  where t9.Status !='Replanned' order by t9.Modified_Date desc
GO
/****** Object:  Table [dbo].[TimeSheetExpenses]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetExpenses](
	[ExpId] [int] IDENTITY(1,1) NOT NULL,
	[TimeSheetId] [int] NULL,
	[ExpHead] [nvarchar](100) NULL,
	[ExpenseAmt] [int] NULL,
	[EnteredTime] [datetime] NULL,
	[Approved] [int] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovalDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TimeSheetExpensesAndTask]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TimeSheetExpensesAndTask]
as 
Select SUM(ExpenseAmt) as 'Expense', t2.Task_Id, t1.TimeSheetId from TimeSheetExpenses t1 join Time_Sheet_Master t2 on t1.TimeSheetId=t2.Time_Sheet_Id group by t2.Task_Id, t1.TimeSheetId
GO
/****** Object:  Table [dbo].[Replans]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeSheetID] [int] NULL,
	[LastDate] [date] NULL,
	[LastTime] [nvarchar](50) NULL,
	[TaskId] [int] NULL,
	[TaskLastDate] [date] NULL,
	[TaskLastTime] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotInterestedLeads]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotInterestedLeads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lead_ID] [int] NULL,
	[Campaign_ID] [int] NULL,
	[Status_No] [int] NULL,
	[Status_Details] [nvarchar](20) NULL,
	[Staff_Id] [int] NULL,
	[Time] [datetime] NULL,
	[TaskId] [int] NULL,
	[TimeSheetID] [int] NULL,
	[EnquiryID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetTracking]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetTracking](
	[TTId] [int] IDENTITY(1,1) NOT NULL,
	[Time_Sheet_Id] [int] NULL,
	[Task_Id] [int] NULL,
	[TaskDate] [date] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[EndDate] [date] NULL,
	[Mins] [int] NULL,
	[Distance] [decimal](18, 0) NULL,
	[SLoc] [nvarchar](500) NULL,
	[ELoc] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CampaignToLeadFullView4]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CampaignToLeadFullView4] as 



select t1.Campaign_ID,t1.EnquiryID, t1.Lead_ID, t1.Staff_Id, t1.TaskId, t1.Time, t1.TimeSheetID, t2.Entered_By, t2.Staff_Name, t2.Start_Time, t2.End_Time, t2.Task_Date, t2.Remarks, t2.Location, t2.End_Location, t3.Sub_Status, t4.Status_Details, (Select Count(*) from Replans where TaskId=  t1.TaskId) as 'Replans', (Select Expense from TimeSheetExpensesAndTask where Task_Id=  t1.TaskId) as 'TotalExpenses', (select SUM(Mins) from TimeSheetTracking  where TimeSheetTracking.Task_Id = t1.TaskId) as 'TotalMins', (select SUM(Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.TaskId) as 'TotalDistance', t5.Salary,t2.Staff_Id as 'HandledbyID' from NotInterestedLeads t1 join VW_Time_Sheet_Master t2 on t1.TimeSheetID = t2.Time_Sheet_Id join Enquiries t3 on t1.EnquiryID=t3.EnqNo join tblFieldMoreStatusMaster t4 on t3.Sub_Status = t4.FieldMore_Status_Id join Staff_Master t5 on t1.Staff_Id = t5.Staff_Id
GO
/****** Object:  Table [dbo].[Resource_Allocation_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource_Allocation_Master](
	[Allocation_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Task_Name] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Allocation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TodayLeastJobs]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[TodayLeastJobs] as



 select Count (t1.Staff_Name) as 'Count', t1.Staff_Name, t3.Staff_Name as 'Name'  FROM rESOURCE_Allocation_Master t1 join Task_Master t2 on t1.Task_Name=t2.Task_Id join Staff_master t3 on t1.Staff_Name = t3.Staff_Id  where (Cast(t2.Start_Date as date)= cast ((select DATEADD(minute,330,GETUTCDATE())) as date))  group  by t1.Staff_Name, t3.Staff_Name
GO
/****** Object:  View [dbo].[TodayJobsAndAttendance]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TodayJobsAndAttendance]

as

select t4.Staff_Name, t2.Staff_Name as 'Name', ISNULL(t5.Count,0) as 'Count', t2.Department_Name from Attendance_Master t4 join Staff_Master t2 on t4.Staff_Name = t2.Staff_Id  left outer join TodayLeastJobs t5 on t2.Staff_Id=t5.Staff_Name where Cast(t4.Attendance_Date as date) = cast ((select DATEADD(minute,330,GETUTCDATE())) as date) and t4.In_Time is not null and t4.Out_Time is null
GO
/****** Object:  View [dbo].[TodayLeastJobsWithDepartment]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE View [dbo].[TodayLeastJobsWithDepartment] as 

 Select Min(Count) as 'Least', Staff_Name, Name, Department_Name from TodayJobsAndAttendance group by Staff_Name, Name, Department_Name
GO
/****** Object:  Table [dbo].[Company_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Master](
	[Company_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [varchar](150) NOT NULL,
	[Address] [varchar](1000) NULL,
	[Email_Id] [varchar](15) NULL,
	[Mobile_No] [varchar](15) NULL,
	[Phone_Number] [varchar](15) NULL,
	[Fax] [varchar](50) NULL,
	[Website_Name] [varchar](150) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK__Company_Master__2D27B809] PRIMARY KEY CLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Company_Master__2E1BDC42] UNIQUE NONCLUSTERED 
(
	[Company_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender_Master]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender_Master](
	[Gender_Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Value] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Gender_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Gender_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Active_Staff_Master_Details]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Active_Staff_Master_Details]  
  
  
  
  
  
  
  
AS  
  
  
  
  
  
  
  
SELECT  
  
  
  
  
  
  
  
Staff_Master.Staff_Id As [Staff_Id],  
  
  
  
  
  
  
  
Staff_Master.PF_Account_No As [PF_Account_No],  
  
  
  
  
  
  
  
Staff_Master.Passport_Details As [Passport_Details],  
  
  
  
  
  
  
  
Staff_Master.Staff_Name As [Staff_Name],  
  
  
  
  
  
  
  
Staff_Master.Employee_Code As [Employee_Code],  
  
  
  
  
  
Staff_Master.CampaignID As [SCampaignID],  
  
  
  
  
  
Staff_Master.ClientID As [SClientID],  
  
  
  
  
  
  
  
Staff_Master.Password As [Password],  
  
  
  
  
  
  
  
Gender_Master_Gender.Gender_Value AS [Gender],  
  
  
  
  
  
  
  
Staff_Master.Date_of_Birth As [Date_of_Birth],  
  
  
  
  
  
  
  
Staff_Master.Higher_Qualification As [Higher_Qualification],  
  
  
  
  
  
  
  
Department_Master_Department_Name.Department_Name AS [Department_Name],  
  
  
  
Department_Master_Department_Name.Is_Field AS [Is_Field],  
  
  
  
  
  
  
  
  
Team_Master_Team_Name.Team_Name AS [Team_Name],  
  
  
  
  
  
  
  
Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],  
  
  
  
  
  
  
  
Staff_Master.Salary As [Salary],  
  
  
  
  
  
  
  
Staff_Master.Email_Id As [Email_Id],  
  
  
  
  
  
  
  
Staff_Master.Address As [Address],  
  
  
  
  
  
  
  
Staff_Master.Contact_No As [Contact_No],  
  
  
  
  
  
  
  
Staff_Master_Entered_By.Staff_Name AS [Entered_By],  
  
  
  
  
  
  
  
Company_Master_Company_Name.Company_Name AS [Company_Name],  
  
  
  
  
  
  
  
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],  
  
  
  
  
  
  
  
Staff_Master.Entered_Date As [Entered_Date],  
  
  
  
  
  
  
  
Staff_Master.Skills_Details As [Skills_Details],  
  
  
  
  
  
  
  
Staff_Master.Is_Admin As [Is_Admin],  
  
  
  
  
  
  
  
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],  
  
  
  
  
  
  
  
Staff_Master.Blood_Group As [Blood_Group],  
  
  
  
  
  
  
  
Staff_Master.Family_Details As [Family_Details],  
  
  
  
  
  
  
  
Staff_Master.ESI_Card_No As [ESI_Card_No],  
  
  
  
  
  
  
  
Staff_Master.Insurance_Policy_No As [Insurance_Policy_No],  
  
  
  
  
  
  
  
Staff_Master.PAN_No As [PAN_No],  
  
  
  
  
  
  
  
Staff_Master.DIN_No As [DIN_No],  
  
  
  
  
  
  
  
Staff_Master.Bank_Details As [Bank_Details],  
  
  
  
  
  
  
  
Staff_Master.Pass_Port_No As [Pass_Port_No],  
  
  
  
  
  
  
  
Staff_Master.Date_of_Issue As [Date_of_Issue],  
  
  
  
  
  
  
  
Staff_Master.Date_of_Expiry As [Date_of_Expiry],  
  
  
  
  
  
  
  
Staff_Master.Date_of_Join As [Date_of_Join],  
  
  
  
  
  
  
  
Staff_Master.ECNR_Required_Or_Not As [ECNR_Required_Or_Not],  
  
  
  
  
  
  
  
Staff_Master.Mobile_No As [Mobile_No],  
  
  
  
  
  
  
  
Staff_Master.Residence_No As [Residence_No],  
  
  
  
  Staff_Master.Emp_Name As [Emp_Name],  
  
  
  
Staff_Master.PicPath As [PicPath]  
  
  
  
  
  
  
  
FROM Staff_Master  
  
  
  
  
  
  
  
LEFT OUTER JOIN Gender_Master As Gender_Master_Gender ON Gender_Master_Gender.Gender_Id=Staff_Master.Gender  
  
  
  
  
  
  
  
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Staff_Master.Department_Name  
  
  
  
  
  
  
  
LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Staff_Master.Team_Name  
  
  
  
  
  
  
  
LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Staff_Master.Designation_Name  
  
  
  
  
  
  
  
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Staff_Master.Entered_By  
  
  
  
  
  
  
  
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Staff_Master.Company_Name  
  
  
  
  
  
  
  
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Staff_Master.Company_Unit_Name  
  
  
  
  
  
  
  
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Staff_Master.Entered_Unit  
  
  
  
  
  
  
  
WHERE Staff_Master.Employee_Status='ACTIVE'  
GO
/****** Object:  Table [dbo].[DModes]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DModes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DMode] [int] NULL,
	[DModeName] [nchar](50) NULL,
	[Entered_By] [int] NULL,
	[Entered_Time] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Field] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadTypes]    Script Date: 3/5/2019 8:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NULL,
	[Description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUploadDocument]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUploadDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Purpose_Id] [int] NULL,
	[Task_Id] [int] NULL,
	[Used_In] [varchar](10) NULL,
	[Doc_Name] [nvarchar](500) NULL,
	[Uploaded_By] [int] NULL,
	[Uploaded_Date] [datetime] NULL,
	[Uploaded_Type] [nvarchar](50) NULL,
	[Status] [char](1) NULL,
	[Project_Id] [int] NULL,
	[UniqueTrack] [int] NULL,
	[Lead_Id] [int] NULL,
	[Location] [nvarchar](500) NULL,
	[PlainText] [ntext] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_tblUploadDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[TimeSheetViewAllDates]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TimeSheetViewAllDates]  
as  
SELECT Time_Sheet_Master.Time_Sheet_Id As [Time_Sheet_Id], Time_Sheet_Master.Task_Date As [Task_Date], Time_Sheet_Master.task_Id As [Task_Name], CAST(DAY(Time_Sheet_Master.Task_Date) AS VARCHAR) +'-'+ SUBSTRING(DATENAME(MM, Time_Sheet_Master.Task_Date), 1
, 3) +'-'+ CAST(YEAR(Time_Sheet_Master.Task_Date) AS VARCHAR) AS Time_Sheet_Date, Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],Staff_Master_Staff_Name.Emp_Name as [Emp_Name], Staff_Master_Staff_Name.Designation_Name AS [Designation_Name], Staff_Master_Staff_Name.Department_Name AS [Department_Name], Staff_Master_Staff_Name.Is_Field AS [Is_Field], Staff_Master_Staff_Name.Staff_Id As [Staff_Id], ISNULL(Purpose_Code_Master_Purpose_Name.Purpose_Name,Task_Master.Task_Name) AS [Purpose_Name], Purpose_Code_Master_Purpose_Name.Purpose_Code AS [Purpose_Code], Purpose_Code_Master_Purpose_Name.Purpose_Code_Id AS [Purpose_Code_Id], Time_Sheet_Master.Start_Time As [Start_Time], Time_Sheet_Master.End_Time As [End_Time], Time_Sheet_Status_Status.Status_Id AS [Status_Id], Time_Sheet_Status_Status.Status_Name AS [Status], Time_Sheet_Master.Remarks As [Remarks], Time_Sheet_Master.Location As [Location], Time_Sheet_Master.End_Location As [End_Location], Task_Master.Remarks As [TMRemarks], Staff_Master_Entered_By.Staff_Name AS [Entered_By], Staff_Master_Modified_By.Staff_Name AS [Modified_By], Time_Sheet_Master.Entered_Date As [Entered_Date], Time_Sheet_Master.Modified_Date As [Modified_Date], Time_Sheet_Status_Status.Color_Code AS [Color_Code], Time_Sheet_Status_Status.Status_Name AS [Status_Name], Time_Sheet_Master.Approve_Status As [Approve_Status], Time_Sheet_Master.Distance As [Distance], Time_Sheet_Master.Duration As [Duration], Time_Sheet_Master.ETA As [ETA], Time_Sheet_Master.TripPlanOrder As [TripPlanOrder], DateDiff(d,Time_Sheet_Master.Task_Date,ISNULL(Time_Sheet_Master.Entered_Date,Time_Sheet_Master.Entered_Date)) As [Day_Different], Time_Sheet_Master.Is_Mobile As [Is_Mobile], Time_Sheet_Master.Replan As [Replan], Time_Sheet_Master.PlainNote As [Activity], TblLeadMaster.Name As [LeadName], TblLeadMaster.ApartmentNo As [ApartmentNo], TblLeadMaster.Address As [Address], TblLeadMaster.Mobile_No As [LeadType], TblLeadMaster.ShortAddress As [ShortAddress], TblLeadMaster.Followup_Details As [PInstructions], TblLeadMaster.PostCode As [PostCode], TblLeadMaster.Latitude As [Latitude], TblLeadMaster.Longitude As [Longitude], Time_Sheet_Master.End_Date As [End_Date], Company_Unit_Master_Entered_Unit.Company_Unit_Name ,Time_Sheet_Master.PStart_Time As [PStart_Time], Time_Sheet_Master.PEnd_Time As [PEnd_Time], Time_Sheet_Master.ExecEntry As [ExecEntry], Time_Sheet_Master.Display As [Display], Time_Sheet_Master.UniqueTrack As [UniqueTrack], (select top 1 UniqueTrack from tblUploadDocument where UniqueTrack = Time_Sheet_Master.UniqueTrack) As [UniqueTrack2], (select top 1 Task_Id from tblUploadDocument where Task_Id = Time_Sheet_Master.task_Id) As [Task_Id2], (select top 1 Latitude+','+ Longtitude as LatLong from Location_Log_Master where Location_Log_Master.Staff_Id = Time_Sheet_Master.Staff_Name and TimeStamp !< DATEADD(minute,-30,GetDate()) order by Location_Log_Id desc) As [LatLong], Staff_Master_Staff_Name.PicPath AS [PicPath], Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit], Enquiries.EnqNo As [OrderNo], Enquiries.LeadId As [LeadId], Enquiries.CampaignID As [CampaignID], Enquiries.DMode As [DMode], Enquiries.CMode As [CMode], Enquiries.BMode As [BMode], Enquiries.status As [MasterStatus], Enquiries.DInstructions As [DInstructions], Enquiries.DestAddress As [DestAddress], Enquiries.DestLatitude As [DestLatitude], Enquiries.DestLongitude As [DestLongitude], Project_Master.Client_Name As [ClientName], Task_Master.Replan As [TaskReplan], DModes.Field As [DModeField], DModes.DModeName As [DModeName], Enquiries.Sub_Status As [SubStatus], tblFieldMoreStatusMaster.Status_Details FROM VW_Active_Staff_Master_Details As Staff_Master_Staff_Name LEFT OUTER JOIN Time_Sheet_Master ON Staff_Master_Staff_Name.Staff_Id=Time_Sheet_Master.Staff_Name  LEFT OUTER JOIN Purpose_Code_Master As Purpose_Code_Master_Purpose_Name ON Purpose_Code_Master_Purpose_Name.Purpose_Code_Id=Time_Sheet_Master.Purpose_Name LEFT OUTER JOIN Task_Master As Task_Master ON Task_Master.task_Id=Time_Sheet_Master.task_Id LEFT OUTER JOIN Time_Sheet_Status As Time_Sheet_Status_Status ON Time_Sheet_Status_Status.Status_Id=Time_Sheet_Master.Status LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Time_Sheet_Master.Entered_By LEFT OUTER JOIN Staff_Master As Staff_Master_Modified_By ON Staff_Master_Modified_By.Staff_Id=Time_Sheet_Master.Modified_By LEFT OUTER JOIN TblLeadMaster ON TblLeadMaster.Lead_Id = Task_Master.LeadId LEFT OUTER JOIN Enquiries ON Time_Sheet_Master.task_Id = Enquiries.task_Id LEFT OUTER JOIN tblFieldMoreStatusMaster ON Enquiries.Sub_Status=tblFieldMoreStatusMaster.FieldMore_Status_Id LEFT OUTER JOIN Project_Master ON Enquiries.CampaignID = Project_Master.ProjectId LEFT OUTER JOIN DModes ON Enquiries.DMode = DModes.DMode LEFT OUTER JOIN LeadTypes ON LeadTypes.ID = TblLeadMaster.Type LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Time_Sheet_Master.Entered_Unit
GO
/****** Object:  View [dbo].[TodayLeastJobsWithDepartmentLowest]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE View [dbo].[TodayLeastJobsWithDepartmentLowest] as 



Select b.* FROM 

(SELECT min(Least) AS 'Lowest' FROM TodayLeastJobsWithDepartment) a

JOIN 

(SELECT Least, Staff_Name, Department_Name  FROM TodayLeastJobsWithDepartment )  b

on a.Lowest = b.Least 
GO
/****** Object:  Table [dbo].[PincodeBandAllocate]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PincodeBandAllocate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PinId] [int] NULL,
	[Band] [int] NULL,
	[Entered_Unit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pincodes]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pincodes](
	[PinId] [int] IDENTITY(1,1) NOT NULL,
	[Pincode] [nvarchar](50) NULL,
	[Location] [varchar](500) NULL,
	[City_District] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[District] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tbl_Pincodes]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE view [dbo].[tbl_Pincodes] as     
select t1.PinId, t1.PinCode, t1.Location, t1.City_District, t1.State, t1.Country, t1.Latitude, t1.Longitude, t2.Band, t2.Entered_Unit from Pincodes t1 left outer join PincodeBandAllocate t2 on t1.PinID = t2.PinId
GO
/****** Object:  Table [dbo].[CModes]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CModes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CMode] [int] NULL,
	[CModeName] [nchar](50) NULL,
	[Entered_By] [int] NULL,
	[Entered_Time] [datetime] NULL,
	[Entered_Unit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldStatusExceptions]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldStatusExceptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldStatsID] [int] NULL,
	[ExID] [int] NULL,
	[NextStatus] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Unit] [int] NULL,
	[Entered_Time] [datetime] NULL,
	[DMode] [int] NULL,
	[CMode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CampaignToLeadFullView2]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CampaignToLeadFullView2] as   
  
select  t1.LeadId as 'Lead_Id',  t1.status as 'MasterStatus', t6.Status_Details as 'MasterStatusName', t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName',t7.ActionTiming,  t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no,t4.ApartmentNo, t4.Address, t4.ShortAddress, t4.Pincode, (Select Band from tbl_Pincodes where PinId = (Select PinId from Pincodes where Pincode=t4.Pincode) and Entered_Unit = t1.UnitId) as 'Band', t4.EMail, (cast (Task_date as varchar) +' '+ cast (Start_Time as varchar)) as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t9.Display, t1.Task_Id, t1.CurrentStaff, t7.Rating as 'SubRating', t6.Rating as 'MasterRating',  ISNULL(t6.Rating + t7.Rating,0) as  'StarRating', t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t1.DInstructions, t4.Followup_Details as 'PInstructions', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.BasePrice as 'TotalPrice', t2.Bal, t1.EnqNo, (Select SUM(ExpenseAmt) from TimeSheetExpenses where TimeSheetId=t9.Time_Sheet_Id) as 'TotalExpenses', (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack =t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t9.Time_Sheet_Id, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is null) as 'NoOfNotInterested', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is not null) as 'NoOfDealsOff',(select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins',(select Count (*) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'Tracks',(select SUM (Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalDistance', t12.Salary, t12.Department_Name, t12.Mobile_No as 'DriverNo', t1.DMode, t18.DModeName, t18.Field as 'DModeField', t9.Status as 'TimeSheetStatus', t4.House_No, t4.StreetName, t4.PostCode, t9.StatusID, t15.NextStatus as 'ExcepNextStatus', t1.CMode, t1.BMode, t17.CModeName, t8.Replan as 'Task_Replan', t19.Latitude as 'PinLat', t19.Longitude as 'PinLong', t4.Latitude, t4.Longitude, t1.UnitID, t9.ETA, t9.Duration, t9.Distance,t21.Emp_Name as 'Handler', t1.DestHouseNo,t1.DestStreetName, t1.DestCity, t1.DestState, t1.DestShortAddress, t1.DestAddress, t1.DestLatitude,t1.DestLongitude, t1.DestPinCode, t23.TotalValue as 'TotalUnbilledValue' from Enquiries t1 join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id  join tblLeadStatusMaster t6 on t1.status = t6.Status_No  join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id join Task_Master t8 on t1.Task_Id = t8.Task_Id  join Staff_Master t5 on t8.Resource = t5.Staff_Id join Company_Unit_Master t11 on t1.UnitId= t11.Unit_Id  join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id left outer join Staff_Master t21 on t1.Handler=t21.Staff_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id left outer join TotalLeadValues t23 on t1.Task_Id = t23.Task_Id left outer join FieldStatusExceptions t15 on t7.FieldMore_Status_Id = t15.FieldStatsID left outer join CModes t17 on t1.CMode = t17.CMode left outer join DModes t18 on t1.DMode= t18.DMode left outer join Pincodes t19 on t4.Pincode =t19.Pincode  where t9.Status !='Replanned' and t9.Time_Sheet_Id=(Select top 1 Time_Sheet_Id from VW_Time_Sheet_Master where Task_Id=t1.Task_Id  order by Time_Sheet_Id desc)  
GO
/****** Object:  View [dbo].[PlanTrip1]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PlanTrip1] as  
select  distinct ISNULL(ShortAddress,0) as ShortAddress, PostCode, Latitude, Longitude  from CampaignToLeadFullView2   
GO
/****** Object:  View [dbo].[Staff_Master_FullRootView]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Staff_Master_FullRootView]
as

select  T1. Staff_Id, T1.Staff_Name, T2.Department_Id, T2.Department_Name, T3.Team_Id, T3.Team_Name, T4.Designation_Id, T4.Designation_Name, T5.Unit_Id, T5.Company_Unit_Name, T6.Company_Id, T6.Company_Name from VW_Active_Staff_Master_Details T1 join Department_Master T2 on T1.Department_Name = T2.Department_Name left outer join Team_Master T3 on T1.Team_Name = T3.Team_Name join Designation_Master T4 on T1.Designation_Name = T4.Designation_Name join Company_Unit_Master T5 on T1.Company_Unit_Name = T5.Company_Unit_Name join Company_Master T6 on T1.Company_Name = T6.Company_Name
GO
/****** Object:  View [dbo].[PlanTrip2]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[PlanTrip2] as
select t1.ShortAddress, t2.House_No, t2.StreetName, t2.PostCode from PlanTrip1 t1 join CampaignToLeadFullView2 t2 on t1.PostCode=t2.PostCode 
GO
/****** Object:  View [dbo].[NotInteresteds]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[NotInteresteds] as 
select t1.Lead_ID, t1.Campaign_ID, t1.Staff_Id, t1.Time, t2.Staff_Name, t3.Project_Name from NotInterestedLeads t1 join Staff_Master t2 on t1.Staff_Id= t2.Staff_Id join Project_Master t3 on t1.Campaign_ID= t3.ProjectId where t1.TaskId is null

GO
/****** Object:  View [dbo].[NotInterestedsSummaryByLead]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[NotInterestedsSummaryByLead] as 
select count (Campaign_ID) as 'CampaignCount', Project_Name as 'CampaignName', Count (Staff_Id) as 'StaffCount', Staff_Name, Lead_ID  from NotInteresteds group by Project_Name, Staff_Name, Lead_ID 
GO
/****** Object:  View [dbo].[CampaignToLeadLeanView]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[CampaignToLeadLeanView] as  
select t7.LeadStatusId as 'MasterStatus', ISNULL(t6.Rating + t7.Rating,0) as 'StarRating', t1.LeadId as 'Lead_Id', t4.ApartmentNo, t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime',t4.Mobile_no, t4.Address,t4.Pincode, t20.Band, t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t1.Task_Id, t1.CurrentStaff, t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.BasePrice as 'TotalPrice', t2.Bal, t1.EnqNo, t9.Time_Sheet_Id, t9.Display, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins',(select Count (*) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'Tracks',(select SUM (Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalDistance', t15.Emp_Name as 'Handler', t1.DMode, t1.CMode, t1.BMode, t17.CModeName, t1.UnitId, (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t13.Project_Name as 'CampaignName', t12.Department_Name, t13.Client_Name as 'ClientID', t16.DModeName, t9.ETA, t9.Duration, t9.Distance, t1.DInstructions, t4.Followup_Details as 'PInstructions', t4.PostCode, t19.Latitude as 'PinLat', t19.Longitude as 'PinLong', t4.Latitude, t4.Longitude from Enquiries t1 join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id join tblLeadStatusMaster t6 on t1.status = t6.Status_No join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id join Task_Master t8 on t1.Task_Id = t8.Task_Id join Staff_Master t5 on t8.Resource = t5.Staff_Id join Company_Unit_Master t11 on t1.UnitId = t11.Unit_Id join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id join Staff_Master t15 on t1.Handler=t15.Staff_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id left outer join Project_Master t13 on t4.CampaignID=t13.ProjectId left outer join DModes t16 on t1.DMode=t16.DMode left outer join CModes t17 on t1.CMode =t17.CMode left outer join Pincodes t19 on t4.Pincode =t19.Pincode left outer join PincodeBandAllocate t20 on t19.PinId= t20.PinId  where t9.Status !='Replanned' and t9.Time_Sheet_Id=(Select top 1 Time_Sheet_Id from VW_Time_Sheet_Master where Task_Id=t1.Task_Id order by Time_Sheet_Id desc) 
GO
/****** Object:  View [dbo].[CampaignToLeadFullView5]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE View [dbo].[CampaignToLeadFullView5]

as

select  t1.LeadId as 'Lead_Id',  t1.status as 'MasterStatus', t6.Status_Details as 'MasterStatusName', t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no, t4.Address, t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t1.Task_Id, t1.CurrentStaff, t7.Rating as 'SubRating', t6.Rating as 'MasterRating', t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.Bal, t1.EnqNo, t10.TotalPrice, (Select SUM(ExpenseAmt) from TimeSheetExpenses where TimeSheetId=t9.Time_Sheet_Id) as 'TotalExpenses', (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t9.Time_Sheet_Id, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master  where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is null) as 'NoOfNotInterested', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is not null) as 'NoOfDealsOff',(select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins',t12.Salary, (select SUM(Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalDistance'  from Enquiries t1 join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id  join tblLeadStatusMaster t6 on t1.status = t6.Status_No  join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id join Task_Master t8 on t1.Task_Id = t8.Task_Id  join Staff_Master t5 on t8.Resource = t5.Staff_Id join Company_Unit_Master t11 on t1.UnitId = t11.Unit_Id  join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id left outer join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id Left Outer join LeadValues t10 on t1.Task_Id = t10.Task_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id

GO
/****** Object:  View [dbo].[Camp2And4Summary]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Camp2And4Summary]

as

Select Max(t1.TotalValue) as 'TotalValue', SUM(t1.TotalExpenses) as 'TotalExpenses', SUM(t2.TotalExpenses) as 'NonTotExpenses', SUM(t1.TotalMins) as 'TotalMins', SUM(t2.TotalMins) as 'NonTotMins', t1.Lead_Id, Count(distinct t1.HandledbyID) as 'StaffCount', COUNT(distinct t2.HandledbyID) AS 'NonStaffCount', SUM(t1.TotalDistance) as 'ValidDistance', SUM(t2.TotalDistance) as 'NonDistance' from CampaignToLeadFullView5 t1 left outer join CampaignToLeadFullView4 t2 on t1.Lead_Id = t2.Lead_ID group by t1.Lead_Id, t2.Staff_Id
GO
/****** Object:  View [dbo].[TimeSheetTrackingAndCost]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[TimeSheetTrackingAndCost] as

select t1.TaskDate, t1.StartTime, t1.EndDate, t1.EndTime, t1.mins, t1.Task_Id, t2.Staff_Name as 'StaffID', t3.Staff_Name, t3.Salary, t1.Distance from TimeSheetTracking t1 join VW_Time_Sheet_Master t2 on t1.Time_Sheet_Id=t2.Time_Sheet_Id join Staff_Master t3 on t2.Staff_Id=t3.Staff_Id
GO
/****** Object:  View [dbo].[CampaignToLeadLeanViewForSearchAll]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CampaignToLeadLeanViewForSearchAll] as
select t7.LeadStatusId as 'MasterStatus',  ISNULL(t6.Rating + t7.Rating,0) as  'StarRating',  t1.LeadId as 'Lead_Id', t4.ApartmentNo, t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime',t4.Mobile_no, t4.Address,t4.Pincode, (Select Band from tbl_Pincodes where PinId = (Select PinId from Pincodes where Pincode=t4.Pincode)) as 'Band', t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t1.Task_Id, t1.CurrentStaff, t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.BasePrice as 'TotalPrice', t2.Bal, t1.EnqNo, t9.Time_Sheet_Id, t9.Display, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins',(select Count (*) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'Tracks',(select SUM (Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalDistance', t15.Emp_Name as 'Handler', t1.DMode, t1.CMode, t1.BMode, t17.CModeName, t1.UnitId, (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t13.Project_Name as 'CampaignName', t12.Department_Name, t13.Client_Name as 'ClientID', t16.DModeName, t9.ETA, t9.Duration, t9.Distance, t1.DInstructions, t4.Followup_Details as 'PInstructions', t4.PostCode, t19.Latitude as 'PinLat', t19.Longitude as 'PinLong', t4.Latitude, t4.Longitude from tblLeadMaster t4 left outer join Enquiries t1 on t4.Lead_Id= t1.LeadId left outer join tblLeadStatusMaster t6 on t1.status = t6.Status_No  left outer join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id left outer join Task_Master t8 on t1.Task_Id = t8.Task_Id  left outer join  Staff_Master t5 on t8.Resource = t5.Staff_Id left outer join Company_Unit_Master t11 on t1.UnitId = t11.Unit_Id  left outer join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id left outer join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id left outer join Staff_Master t15 on t1.Handler=t15.Staff_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id left outer join Project_Master t13 on t4.CampaignID=t13.ProjectId left outer join DModes t16 on t1.DMode=t16.DMode left outer join CModes t17 on t1.CMode =t17.CMode left outer join Pincodes t19 on t4.Pincode =t19.Pincode  where t9.Status !='Replanned' and t9.Time_Sheet_Id=(Select top 1 Time_Sheet_Id from VW_Time_Sheet_Master where Task_Id=t1.Task_Id order by Time_Sheet_Id desc)
GO
/****** Object:  View [dbo].[CampaignToLeadFullView8]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CampaignToLeadFullView8] as 

select  t1.LeadId as 'Lead_Id',  t1.status as 'MasterStatus', t6.Status_Details as 'MasterStatusName', t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no, t4.Address, t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t1.Task_Id, t1.CurrentStaff, t7.Rating as 'SubRating', t6.Rating as 'MasterRating', t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.Bal, t1.EnqNo, (Select SUM(ExpenseAmt) from TimeSheetExpenses where TimeSheetId=t9.Time_Sheet_Id) as 'TotalExpenses', (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t9.Time_Sheet_Id, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is null) as 'NoOfNotInterested', (Select count (*) from NotInterestedLeads where Lead_Id=t4.Lead_Id and TaskId is not null) as 'NoOfDealsOff',(select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins', t12.Salary from Enquiries t1 join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id  join tblLeadStatusMaster t6 on t1.status = t6.Status_No  join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id join Task_Master t8 on t1.Task_Id = t8.Task_Id  join Staff_Master t5 on t8.Resource = t5.Staff_Id join Company_Unit_Master t11 on t1.UnitId = t11.Unit_Id  join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id where t9.Status !='Replanned' and t9.Time_Sheet_Id=(Select top 1 Time_Sheet_Id from VW_Time_Sheet_Master where Task_Id=t1.Task_Id order by Time_Sheet_Id desc)
GO
/****** Object:  Table [dbo].[Project_Task_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Task_Master](
	[Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [int] NOT NULL,
	[Task_Name] [varchar](300) NOT NULL,
	[Task_Description] [varchar](1000) NULL,
	[Start_Date] [datetime] NOT NULL,
	[End_Date] [datetime] NOT NULL,
	[Task_Status] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
	[Department_Name] [int] NULL,
	[Team_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Task_Configuration_Id] [int] NULL,
	[Process_Id] [int] NULL,
	[Parent_TaskId] [int] NULL,
	[Task_Order] [int] NULL,
	[Task_Version] [varchar](20) NULL,
	[Completed_Date] [datetime] NULL,
	[Sub_Task_Id] [int] NULL,
	[Planned_Start_Date] [datetime] NULL,
	[Planned_End_Date] [datetime] NULL,
	[MailStats] [varchar](1) NULL,
	[UniqueId] [varchar](50) NULL,
	[Task_Map_Id] [int] NULL,
	[Location] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process_Master](
	[Process_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Unit_Name] [int] NULL,
	[Company_Name] [int] NOT NULL,
	[Process_Name] [varchar](100) NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NOT NULL,
	[Description] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NOT NULL,
	[Email_Configuration] [varchar](1000) NOT NULL,
	[No_Of_Hours] [int] NULL,
	[No_Of_Minutes] [int] NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Order_Number] [int] NULL,
	[Skill_Id] [varchar](1000) NULL,
	[Department_Id] [int] NULL,
	[Project_Specific] [nvarchar](10) NULL,
 CONSTRAINT [PK__Process___35F35AA452442E1F] PRIMARY KEY CLUSTERED 
(
	[Process_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_PROJECT_TASK_MASTER_LIMIT_PROCESS]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PROJECT_TASK_MASTER_LIMIT_PROCESS]
AS
SELECT PROJECT_TASK_MASTER.* FROM PROJECT_TASK_MASTER,PROCESS_MASTER 
WHERE  PROJECT_TASK_MASTER.PROCESS_ID = PROCESS_MASTER.PROCESS_ID 
AND PROCESS_MASTER.ORDER_NUMBER<=22
GO
/****** Object:  View [dbo].[VW_Project_Process_Duration_Graph]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Project_Process_Duration_Graph]    
AS    
SELECT Project_Master.Project_Name,    
Project_Master.ProjectId,    
Project_Master.Is_Active,    
Project_Master.Entered_Unit,  
Project_Master.Start_Date As Init_SDate,
Project_Master.End_Date As Init_EDate,
MIN (Project_Task_Master.Start_Date) As Start_Date,    
MAX(Project_Task_Master.End_Date)  As End_Date,    
DATEDIFF(DD,MIN(Project_Task_Master.Start_Date),MAX(Project_Task_Master.End_Date)) +1 AS Duration,    
Project_Master.Expected_Start_Date As Plan_Start_Date,    
Project_Master.Expected_End_Date As Plan_End_Date,    
DATEDIFF(DD,Project_Master.Start_Date,Project_Master.End_Date) +1 AS Plan_Duration,    
MIN (Task_Master.Start_Date) As Expect_Start_Date,    
MAX(Task_Master.End_Date)  As Expect_End_Date     
FROM Project_Master    
LEFT OUTER JOIN TASK_MASTER as Task_Master ON Task_Master.Project_Name= Project_Master.ProjectId 
LEFT OUTER JOIN VW_PROJECT_TASK_MASTER_LIMIT_PROCESS AS Project_Task_Master ON Project_Task_Master.Project_Name= Project_Master.ProjectId 
AND  Project_Task_Master.Start_Date IS NOT NULL AND Project_Task_Master.End_Date IS NOT NULL  
WHERE  Project_Master.Expected_Start_Date IS NOT NULL AND Project_Master.Expected_End_Date IS NOT NULL    
GROUP  BY Project_Master.Project_Name,    
Project_Master.ProjectId,    
Project_Master.Is_Active,    
Project_Master.Entered_Unit,    
Project_Master.Expected_Start_Date,    
Project_Master.Expected_End_Date ,
Project_Master.Start_Date,
Project_Master.End_Date

GO
/****** Object:  View [dbo].[CampaignToLeadExtendedView2]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CampaignToLeadExtendedView2] as   
  
select t1.Lead_Id, t1.MasterStatusName as 'MasterStats', t1.MasterStatus, t1.FieldStatusName as 'SubStats',t1.FieldSubStatus, t1.Name, t1.Staff_Name, t1.LastTime, t1.Mobile_No, t1.Address, t1.Email, t1.NextTime, t1.Campaign_Id, t1.CreatedTime as 'CreatedDate', t1.SubRating as 'FieldStatusRating', t1.MasterRating as 'MasterStatusRating',t1.HandledbyID as 'Staff_Id', t4.TotalValue, t1.Task_Id, t1.EnqNo, t1.Company_Unit_Name, t1.TotalUnbilledValue from CampaignToLeadFullView2 t1 left outer join TotalLeadValues t4 on t1.Task_Id = t4.Task_Id  
GO
/****** Object:  View [dbo].[VW_TimeSheetAndTaskMasterCRM]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_TimeSheetAndTaskMasterCRM]

AS

SELECT dbo.VW_Time_Sheet_Master.Time_Sheet_Id, dbo.VW_Time_Sheet_Master.Task_Date, dbo.VW_Time_Sheet_Master.Time_Sheet_Date, dbo.VW_Time_Sheet_Master.Staff_Name, dbo.VW_Time_Sheet_Master.Staff_Id,  dbo.VW_Time_Sheet_Master.Purpose_Code_Id,dbo.VW_Time_Sheet_Master.Task_Id, dbo.VW_Time_Sheet_Master.Start_Time, dbo.VW_Time_Sheet_Master.End_Time, dbo.VW_Time_Sheet_Master.Status, dbo.VW_Time_Sheet_Master.Color_Code, dbo.VW_Time_Sheet_Master.Approve_Status,dbo.VW_Time_Sheet_Master.Remarks, dbo.VW_Time_Sheet_Master.Entered_By, dbo.VW_Time_Sheet_Master.Modified_By,dbo.VW_Time_Sheet_Master.Entered_Date, dbo.VW_Time_Sheet_Master.Modified_Date, dbo.VW_Time_Sheet_Master .End_Date, dbo.VW_Time_Sheet_Master.PStart_Time, dbo.VW_Time_Sheet_Master.PEnd_Time, dbo.VW_Time_Sheet_Master.Entered_Unit,dbo.VW_Time_Sheet_Master.Unit_Id,dbo.VW_Time_Sheet_Master.Location, dbo.VW_Time_Sheet_Master.End_Location, dbo.VW_Time_Sheet_Master.Emails, dbo.VW_Task_Master.Project_Name, dbo.VW_Task_Master.Task_Name, dbo.VW_Task_Master.Start_Date AS Task_Start_Date, dbo.VW_Task_Master.End_Date AS Task_End_Date, dbo.VW_Task_Master.Task_Status, dbo.VW_Task_Master.Remarks as TMRemarks, dbo.VW_Task_Master.Task_Description, dbo.VW_Time_Sheet_Master.UniqueTrack, dbo.VW_Time_Sheet_Master.Activity,  dbo.VW_Time_Sheet_Master.PlainRemarks, dbo.VW_Task_Master.ProjectId, dbo.VW_Time_Sheet_Master.Purpose_Name, CampaignToLeadExtendedView2.Name, CampaignToLeadExtendedView2.Mobile_No, CampaignToLeadExtendedView2.Address, CampaignToLeadExtendedView2.MasterStats, CampaignToLeadExtendedView2.SubStats, CampaignToLeadExtendedView2.EnqNo, CampaignToLeadExtendedView2.FieldStatusRating + CampaignToLeadExtendedView2.MasterStatusRating as 'Rating', CampaignToLeadExtendedView2.TotalValue, (select SUM(ExpenseAmt) from TimeSheetExpenses where TimeSheetId= VW_Time_Sheet_Master.Time_Sheet_Id) as 'TotalExpenses',(select SUM(TotalPrice) from LeadValues where Task_Id =dbo.VW_Task_Master.Task_Id) as 'ClosedDealValue', (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = VW_Time_Sheet_Master.UniqueTrack or tblUploadDocument.Task_Id=VW_Time_Sheet_Master.Task_Id) as 'NoOfDocs'   FROM  dbo.VW_Time_Sheet_Master LEFT OUTER JOIN dbo.VW_Task_Master ON dbo.VW_Time_Sheet_Master.Task_Id = dbo.VW_Task_Master.Task_Id LEFT OUTER JOIN CampaignToLeadExtendedView2 ON dbo.VW_Time_Sheet_Master.Task_Id = CampaignToLeadExtendedView2.Task_Id Left Outer Join tblUploadDocument on tblUploadDocument.UniqueTrack= VW_Time_Sheet_Master.UniqueTrack or tblUploadDocument.Task_Id = VW_Time_Sheet_Master.Task_Id
GO
/****** Object:  View [dbo].[CRMInvoiceAndLead]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[CRMInvoiceAndLead]
as
select T1.InvoiceNo, T3.Staff_Name, T1.Staff_Name as 'Staff_Id', T3.Company_Unit_Name, T2.Name, T2.Mobile_No, T2.EMail, T1.BasePrice, T1.AllTax,T1.Installation, T1.Transportation, T1.Entered_Date, T1.Added, T1.Task_Id, T1.Bal, T1.Discount, T1.TotalValue, T1.InvId from CRMInvoices T1 join Staff_Master T3 on T1.Staff_Name = T3.Staff_Id join tblLeadMaster T2 on T1.Lead_Id = T2.Lead_Id
GO
/****** Object:  Table [dbo].[InvFollowUp]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvFollowUp](
	[IFId] [int] IDENTITY(1,1) NOT NULL,
	[InvId] [int] NULL,
	[StaffId] [int] NULL,
	[Paid] [int] NULL,
	[NextDate] [datetime] NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[RecieptNo] [int] NULL,
	[PayMode] [nchar](10) NULL,
	[RefNo] [nvarchar](20) NULL,
	[InvRoot] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InvFollowUpFull]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[InvFollowUpFull]
as
select T1.IFId, T2.Name, T2.InvoiceNo, T3.Staff_Name as 'CollectedBy', T1.StaffId, T1.Paid, T1.NextDate, T4.Staff_Name as 'EnteredBy', T1.Entered_Date, T1.RecieptNo, T2.Bal, T2.TotalValue, T2.BasePrice, T2.Discount, T2.AllTax, T2.Installation, T2.Transportation, t4.Company_Unit_Name, T1.PayMode, T1.RefNo, T2.Task_Id, T1.InvRoot  from InvFollowUp T1 left outer join CRMInvoiceAndLead T2 on T1.InvRoot = T2.InvId join Staff_Master T3 on T1.StaffId = T3.Staff_Id join Staff_Master T4 on T1.Entered_By = T4.Staff_Id 
GO
/****** Object:  View [dbo].[CollectionsSummary]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CollectionsSummary]

as

Select Distinct(CollectedBy), Max(Bal) as 'Max Bal', Count(x.InvoiceNo) as 'Count', SUM(Bal) as 'Balance', SUM(Paid) as 'Collected', MIN(NextDate) as 'Earliest', MAX(NextDate) as 'Latest', StaffId from InvFollowupFull inner join (select Max(IFId) as 'IfId', InvoiceNo from InvFollowupFull  Group by InvoiceNo ) x ON x.IFId = InvFollowupFull.IFId where Bal !< 1 group by CollectedBy, StaffId
GO
/****** Object:  View [dbo].[CampaignToLeadExtView]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create view [dbo].[CampaignToLeadExtView] as


select t1.Lead_ID,  t3.Status_Details as 'MasterStatus', t6.Status_Details as 'FieldSubStatus', t4.Name, t5.Staff_Name,t1.Time as 'LastTime', t4.Mobile_no, t4.Address, t1.Campaign_Id, t1.Campaign_Lead_Id, t4.Type   



from tblCampaignLead t1 join tblLeadMaster t4 on t1.Lead_Id = t4.Lead_Id join Staff_Master t5 on t1.Staff_Id = t5.Staff_Id join tblLeadStatusMaster t3 on t1.status = t3.Status_No join  tblFieldMoreStatusMaster t6 on t1.Sub_Status = t6.Status_No
GO
/****** Object:  Table [dbo].[CancelledOrders]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelledOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CancelledOrdersView]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CancelledOrdersView] as 

select T1.TaskID, T1.Entered_By, T3.Staff_Name as 'EnteredByName', T1.Entered_Time, T2.EnqNo, T2.LeadId, T7.Name as 'LeadName', T2.Sub_Status, T8.Status_Details as 'Sub_Status_Name', T2.Staff_Id,T4.Staff_Name as 'Current_Staff_Name',  T2.Handler, T5.Emp_Name as 'HandlerName', T2.CreatedTime, T2.Time as 'Last_Time', T2.DMode, T6.DModeName, T2.UnitId, T7.Address, T7.Mobile_No, T2.DInstructions, T7.Followup_Details as 'PInstructions', T2.CampaignID, t7.PostCode, t7.ApartmentNo, t2.CMode, t9.CModeName from CancelledOrders T1 join Enquiries T2 on T1.TaskID = T2.Task_Id join Staff_Master T3 on T1.Entered_By = T3.Staff_Id join Staff_Master T4 on T2.Staff_Id = T4.Staff_Id join Staff_Master T5 on T2.Handler = T5.Staff_Id join DModes T6 on T2.DMode = T6.DMode join tblLeadMaster T7 on T2.LeadId = T7.Lead_Id join TblFieldMoreStatusMaster T8 on T2.Sub_Status = T8.FieldMore_Status_Id left outer join CModes t9 on t2.CMode = t9.CMode
GO
/****** Object:  Table [dbo].[Task_Configuration]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Configuration](
	[Task_Configuration_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Name] [varchar](500) NULL,
	[Task_Instruction] [varchar](2000) NULL,
	[CategoryId] [int] NULL,
	[UnitId] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Price] [int] NULL,
	[Entered_Unit] [int] NULL,
	[ISSTANDARD] [bit] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[TotalDimention] [float] NULL,
	[Pic] [varchar](150) NULL,
	[CostPrice] [int] NULL,
 CONSTRAINT [PK_Task_Configuration] PRIMARY KEY CLUSTERED 
(
	[Task_Configuration_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskCategory]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskCategory](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Unit_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CRMTasksOnly]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CRMTasksOnly]
as

select Task_Configuration_Id, Task_Name from Task_Configuration where CategoryId =(Select RowId from TaskCategory where CategoryName='CRM Related')
GO
/****** Object:  View [dbo].[DealsCalledOffTotalTime]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE view [dbo].[DealsCalledOffTotalTime] as
 select SUM(Mins)as 'TotalNonMins', t1.Task_Id  from TimeSheetTracking t1 join NotInterestedLeads t2 on t1.Task_Id=t2.TaskId group by t1.Task_Id
GO
/****** Object:  Table [dbo].[BiometricTypes]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiometricTypes](
	[DeviceID] [nvarchar](50) NULL,
	[Type] [nchar](1) NULL,
	[Location] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccessInfo]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccessInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Id] [int] NULL,
	[Accesstime] [nvarchar](50) NULL,
	[DeviceId] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Flag] [nchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DeviceAccessInfo]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[DeviceAccessInfo]
as

select T1.Id, T1.Staff_Id, T1. AccessTime, T1.DeviceId, T1.Date, T1.Flag, T2.Type, T2.Location from tblAccessInfo T1 join BiometricTypes T2 on T1.DeviceId = T2.DeviceID
GO
/****** Object:  View [dbo].[FinalProcessDepartment]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[FinalProcessDepartment]    
as    
select * from tblFieldMoreStatusMaster where LeadStatusId=3 and Rating=2.00 and Department !=0 
GO
/****** Object:  View [dbo].[InitialProcessDepartment]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[InitialProcessDepartment]

as

select * from tblFieldMoreStatusMaster where LeadStatusId=2 and Rating=0.00 and NextStatus != 0 and Department !=0
GO
/****** Object:  Table [dbo].[tbl_Leads_FollowUp]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Leads_FollowUp](
	[LeadFollowup_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Id] [int] NULL,
	[Task_Date] [datetime] NULL,
	[Status] [int] NULL,
	[Remarks] [text] NULL,
	[Staff_Name] [varchar](100) NULL,
	[Sub_Status] [int] NULL,
 CONSTRAINT [PK_tbl_Leads_FollowUp] PRIMARY KEY CLUSTERED 
(
	[LeadFollowup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LeadsFollowupAndTasks]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[LeadsFollowupAndTasks]
as
select t1.LeadFollowup_Id, t1.Task_Id, t1.Task_Date, t1.Status, t1.Staff_Name, t1.Sub_Status, t2.Project_Name as 'Campaign_ID', t2.Start_Date as 'TaskStartDate', t2.End_Date as 'TaskEndDate', t2.Remarks as 'TaskRemarks', t2.Entered_By as 'TaskEnteredBy', t2.Entered_Date as 'TaskEnteredDate', t2.LeadID as 'LeadId' from tbl_Leads_FollowUp t1 join Task_Master t2 on t1.Task_Id = t2.Task_Id where t2.LeadId is not null or t2.LeadId !=''
GO
/****** Object:  Table [dbo].[Pending_Task_Mapping]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pending_Task_Mapping](
	[Pending_Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Identity] [int] NULL,
	[Task_Type] [varchar](30) NULL,
	[Staff_Name] [int] NULL,
	[Time] [smalldatetime] NULL,
	[Unique_Track] [int] NULL,
 CONSTRAINT [PK__Pending___5A5330341A34DF26] PRIMARY KEY CLUSTERED 
(
	[Pending_Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PendingTasksAndActivities]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PendingTasksAndActivities]
as
SELECT Pending_Task_Id,Task_Master.Task_Name, (select Staff_Name from Staff_Master where Staff_Id= Pending_Task_Mapping.Staff_Name) as 'StaffName', Pending_Task_Mapping.Time FROM Pending_Task_Mapping INNER JOIN Task_Master ON Task_Master.Task_Id = Pending_Task_Mapping.Task_Identity  WHERE Pending_Task_Mapping.Task_Type = 'T' UNION  SELECT Pending_Task_Id,Purpose_Code_Master.Purpose_Name, (select Staff_Name from Staff_Master where Staff_Id= Pending_Task_Mapping.Staff_Name) as 'StaffName', Pending_Task_Mapping.Time  FROM Pending_Task_Mapping INNER JOIN Purpose_Code_Master ON Purpose_Code_Master.Purpose_Code_Id = Pending_Task_Mapping.Task_Identity  WHERE Pending_Task_Mapping.Task_Type = 'P'
GO
/****** Object:  Table [dbo].[Project_Process_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Process_Master](
	[Project_Process_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
	[Project_Name] [int] NULL,
	[Process_Name] [int] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_By] [int] NULL,
	[Email_Configuration] [varchar](1000) NOT NULL,
	[No_Of_Hours] [int] NULL,
	[No_Of_Minutes] [int] NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Skill_Id] [varchar](1000) NULL,
	[Department_Id] [int] NULL,
	[Project_Specific] [varchar](10) NULL,
	[Product_Name] [int] NULL,
 CONSTRAINT [PK__Project___FC99AB695BCD9859] PRIMARY KEY CLUSTERED 
(
	[Project_Process_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_Task_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Task_Master](
	[Process_Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NOT NULL,
	[Company_Unit_Name] [int] NULL,
	[Process_Name] [int] NULL,
	[Task_Name] [varchar](200) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NULL,
	[Email_Configuration] [varchar](1000) NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Parent_SubTaskId] [int] NULL,
	[Project_Name] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Process_Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_Resource_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Resource_Master](
	[Resource_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NULL,
	[Task_Name] [int] NULL,
	[Project_Name] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Resource_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Process_Task_Details]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Process_Task_Details]        
AS        
SELECT F.Project_Name+'['+ F.Project_Short_Name +']' As Project_Name,
F.ProjectId,
D.PROCESS_NAME,
A.PROCESS_ID,A.TASK_ID,A.START_DATE AS ACTUAL_PLAN_START,      
A.END_DATE AS ACTUAL_PLAN_END, PLANNED_START_DATE, PLANNED_END_DATE,       
DATEDIFF(DD,A.START_DATE,A.END_DATE)+1 AS ACTUAL_DAYS,      
COUNT(DISTINCT C.STAFF_NAME ) AS RESOURCE_COUNT,        
ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS) AS NO_OF_DAYS,        
ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0)) AS NO_OF_STAFFS, Completed_Date ,    
CASE  WHEN (DATEDIFF(DD,A.START_DATE,A.END_DATE)+1)<=(ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS))      
      AND      
      COUNT(DISTINCT C.STAFF_NAME )<= ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0))      
      AND      
 CAST(A.COMPLETED_DATE AS DATE) BETWEEN A.START_DATE AND A.END_DATE AND A.COMPLETED_DATE  IS NOT NULL THEN      
   'completed'      
   WHEN A.TASK_STATUS=9  AND (A.COMPLETED_DATE IS NULL) AND  A.End_Date >= CAST(GETDATE() AS DATE)THEN      
   'inprogress'       
  WHEN A.TASK_STATUS=2  AND (A.COMPLETED_DATE IS NULL) AND A.End_Date >= CAST(GETDATE() AS DATE) THEN      
   'planned'       
  WHEN   (A.COMPLETED_DATE IS NULL  AND CAST(GETDATE() AS DATE)< A.START_DATE ) THEN    
   B.STATUS_VALUE   
  WHEN   (A.COMPLETED_DATE IS NOT NULL ) THEN  
  'completedwarning'       
  WHEN   (A.COMPLETED_DATE IS NULL  AND CAST(GETDATE() AS DATE)< A.START_DATE ) THEN  
   B.STATUS_VALUE  
  ELSE      
   'warning'      
  END AS PROCESS_STATUS  
FROM 
Project_Master F 
INNER JOIN PROJECT_TASK_MASTER A ON F.PROJECTID = A.PROJECT_NAME   
INNER JOIN TASK_STATUS_MASTER B ON A.TASK_STATUS =B.STATUS_ID      
LEFT OUTER JOIN PROJECT_RESOURCE_MASTER C ON C.TASK_NAME = A.TASK_ID        
INNER JOIN PROCESS_MASTER D ON D.PROCESS_ID = A.PROCESS_ID           
LEFT OUTER JOIN SUB_TASK_MASTER G ON G.PROCESS_TASK_ID=A.SUB_TASK_ID           
LEFT OUTER JOIN PROJECT_PROCESS_MASTER E ON E.PROCESS_NAME=D.PROCESS_ID AND E.PROJECT_NAME = A.PROJECT_NAME     
GROUP BY F.Project_Name, ProjectId,A.PROCESS_ID,A.START_DATE,A.END_DATE, A.TASK_ID,C.STAFF_NAME  ,A.COMPLETED_DATE,  A.TASK_STATUS,       
ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS),    PLANNED_START_DATE, PLANNED_END_DATE,    
ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0)),D.PROCESS_NAME , B.STATUS_VALUE,Project_Short_Name   


GO
/****** Object:  View [dbo].[TimeSheetExpensesSummary]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[TimeSheetExpensesSummary]

as

Select Distinct(x.[Time_Sheet_Id]),Min(ExpenseAmt) as 'Min Amt', Max(ExpenseAmt) as 'Max Amt', Count(ExpId) as 'Count', SUM(ExpenseAmt) as 'Total', (Select SUM(ExpenseAmt) from TimeSheetExpenses where Approved=1) as 'Approved', MIN(EnteredTime) as 'Earliest', MAX(EnteredTime) as 'Latest',x.StaffId  from TimeSheetExpenses T1 inner join (select Time_Sheet_Id, Staff_Name as 'StaffId'  from Time_Sheet_Master T2  Group by Staff_Name, Time_Sheet_Id ) x ON x.[Time_Sheet_Id] =T1.[TimeSheetId] where ExpenseAmt !< 1 group by StaffId, Time_Sheet_Id
GO
/****** Object:  Table [dbo].[Action_Master]    Script Date: 3/5/2019 8:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Master](
	[Action_Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation_Name] [int] NOT NULL,
	[Action_Name] [varchar](100) NOT NULL,
	[Action_Short_Name] [varchar](30) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Action_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Action_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Action_Master]
AS
SELECT
Action_Master.Action_Id As [Action_Id],
Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],
Action_Master.Action_Name As [Action_Name],
Action_Master.Action_Short_Name As [Action_Short_Name],
Action_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Action_Master.Entered_Date As [Entered_Date]
FROM Action_Master
LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Action_Master.Designation_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Action_Master.Entered_By

GO
/****** Object:  View [dbo].[VW_ACtive_STAFF_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_ACtive_STAFF_Master]



AS



SELECT t1.*, t2.Is_Field FROM STAFF_MASTER t1 left outer join Department_Master t2 on t1.Department_Name=t2.Department_Id WHERE Employee_Status ='Active'
GO
/****** Object:  View [dbo].[CampaignToLeadLeanViewWithOutBand]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[CampaignToLeadLeanViewWithOutBand] as
select t7.LeadStatusId as 'MasterStatus', ISNULL(t6.Rating + t7.Rating,0) as 'StarRating', t1.LeadId as 'Lead_Id', t4.ApartmentNo, t1.Sub_Status as 'FieldSubStatus', t7.Status_Details as 'FieldStatusName', t4.Name, t5.Staff_Name,t1.Time as 'LastTime',t4.Mobile_no, t4.Address,t4.Pincode, t4.EMail, t8.Start_Date as 'NextTime', t1.CampaignID as 'Campaign_Id', t1.CreatedTime,t9.Staff_Id, t1.Task_Id, t1.CurrentStaff, t5.Staff_Name as 'Assignedby', t9.Staff_Name as 'Handledby', t9.Remarks as 'ActivityLog', t9.Staff_Id as 'HandledbyID', t2.InvoiceNo, t2.TotalValue, t2.BasePrice as 'TotalPrice', t2.Bal, t1.EnqNo, t9.Time_Sheet_Id, t9.Display, t2.InvId, t11.Company_Unit_Name,(Select Count(*) from Replans where Replans.TaskId = (Select Task_Id from Task_Master where Task_Master.Task_Id=t1.Task_Id)) as 'NoOfReschedules', t4.Discount as 'BlanketDiscount', (select SUM(Discounts) from LeadValues where LeadValues.LeadId=t1.LeadId) as 'TotalDiscounts', t2.Discount as 'StaffDiscount', (select SUM(Mins) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalMins',(select Count (*) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'Tracks',(select SUM (Distance) from TimeSheetTracking where TimeSheetTracking.Task_Id = t1.Task_Id) as 'TotalDistance', t15.Emp_Name as 'Handler', t1.DMode, t1.CMode, t1.BMode, t17.CModeName, t1.UnitId, (Select Count(*) from tblUploadDocument where tblUploadDocument.UniqueTrack = t9.UniqueTrack or tblUploadDocument.Task_Id=t9.Task_Id) as 'NoOfDocs', t13.Project_Name as 'CampaignName', t12.Department_Name, t13.Client_Name as 'ClientID', t16.DModeName, t9.ETA, t9.Duration, t9.Distance, t1.DInstructions, t4.Followup_Details as 'PInstructions', t4.PostCode, t19.Latitude as 'PinLat', t19.Longitude as 'PinLong', t4.Latitude, t4.Longitude from Enquiries t1 join tblLeadMaster t4 on t1.LeadId = t4.Lead_Id join tblLeadStatusMaster t6 on t1.status = t6.Status_No join tblFieldMoreStatusMaster t7 on t1.status = t7.LeadStatusId and t1.Sub_Status = t7.FieldMore_Status_Id join Task_Master t8 on t1.Task_Id = t8.Task_Id join Staff_Master t5 on t8.Resource = t5.Staff_Id join Company_Unit_Master t11 on t1.UnitId = t11.Unit_Id join VW_Time_Sheet_Master t9 on t1.Task_Id = t9.Task_Id join Staff_Master t12 on t9.Staff_Id= t12.Staff_Id join Staff_Master t15 on t1.Handler=t15.Staff_Id left outer join CRMINvoices t2 on t1.Task_Id = t2.Task_Id left outer join Project_Master t13 on t4.CampaignID=t13.ProjectId left outer join DModes t16 on t1.DMode=t16.DMode left outer join CModes t17 on t1.CMode =t17.CMode left outer join Pincodes t19 on t4.Pincode =t19.Pincode  where t9.Status !='Replanned' and t9.Time_Sheet_Id=(Select top 1 Time_Sheet_Id from VW_Time_Sheet_Master where Task_Id=t1.Task_Id order by Time_Sheet_Id desc) 
GO
/****** Object:  Table [dbo].[Admin_Happy_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Happy_Master](
	[Happy_Id] [int] IDENTITY(1,1) NOT NULL,
	[Happy_Date] [datetime] NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Happy_Status] [int] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Happy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Happy_Status_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Happy_Status_Master](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Name] [varchar](50) NOT NULL,
	[Color_Code] [varchar](10) NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Score] [decimal](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Status_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Admin_Happy_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Admin_Happy_Master]
AS

SELECT
Admin_Happy_Master.Happy_Id As [Happy_Id],
Admin_Happy_Master.Happy_Date As [Happy_Date],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Staff_Master_Staff_Name.Staff_Id As [Staff_Id],
Happy_Status_Master_Happy_Status.Status_Name AS [Happy_Status],
Admin_Happy_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],
Admin_Happy_Master.Entered_Date As [Entered_Date],
Happy_Status_Master_Happy_Status.Color_Code As [Color_Code],
Happy_Status_Master_Happy_Status.Score As [Score],
Admin_Happy_Master.Entered_By AS  [Entered_Staff_Id],
Admin_Happy_Master.Entered_Unit AS [Unit_Id],
Staff_Master_Entered_By .Is_Admin As [Is_Admin]
FROM Admin_Happy_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Admin_Happy_Master.Staff_Name
LEFT OUTER JOIN Happy_Status_Master As Happy_Status_Master_Happy_Status ON Happy_Status_Master_Happy_Status.Status_Id=Admin_Happy_Master.Happy_Status
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Admin_Happy_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Admin_Happy_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[AdvancesMaster]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvancesMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NULL,
	[Staff_Name] [int] NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
	[Department_Name] [int] NULL,
	[Team_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Entered_Unit] [int] NULL,
	[Entered_By] [int] NULL,
	[Remarks] [nvarchar](1000) NULL,
	[Instalments] [int] NULL,
	[InstalmentAmt] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Approved_By] [int] NULL,
	[ApprovalStats] [varchar](50) NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovalUnit] [int] NULL,
	[Approval_Remarks] [nvarchar](max) NULL,
	[DisbursalStats] [nchar](1) NULL,
	[DisbursedBy] [int] NULL,
	[DisbursalUnit] [int] NULL,
	[VoucherID] [int] NULL,
	[DisbursalDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_AdvancesMaster]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AdvancesMaster]
AS

SELECT

AdvancesMaster.ID As [ID],
Company_Master_Company_Name.Company_Name AS [Company_Name],
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Team_Master_Team_Name.Team_Name AS [Team_Name],

Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],


Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
AdvancesMaster.Amount AS [Advance_Amt],
AdvancesMaster.Instalments As [Instalments],

AdvancesMaster.InstalmentAmt As [Instalment_Amt],


AdvancesMaster.Remarks As [Remarks],

AdvancesMaster.Approval_Remarks As [Approval_Remarks],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

AdvancesMaster.Entered_Date As [Entered_Date],

AdvancesMaster.Entered_Unit As EnteredUnit_Id ,

AdvancesMaster.Staff_Name As Staff_Id,


AdvancesMaster.ApprovalStats As Approval_Status,

AdvancesMaster.Approved_By As ApprovedBy,
AdvancesMaster.ApprovalDate As ApprovedDate,

AdvancesMaster.Company_Name as Company_Id,

AdvancesMaster.Company_Unit_Name as Unit_Id,

AdvancesMaster.Department_Name as Department_Id,

AdvancesMaster.Team_Name as Team_Id,

AdvancesMaster.Designation_Name as Designation_Id,

AdvancesMaster.Staff_Name as AdvancesStaffID,
Staff_Master_Approved_By.Staff_Name AS [Approved_By_Staff]


FROM AdvancesMaster

LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=AdvancesMaster.Company_Name

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=AdvancesMaster.Company_Unit_Name
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=AdvancesMaster.Department_Name

LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=AdvancesMaster.Team_Name

LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=AdvancesMaster.Designation_Name

LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=AdvancesMaster.Staff_Name


LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=AdvancesMaster.Entered_Unit
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=AdvancesMaster.Entered_By
LEFT OUTER JOIN Staff_Master As Staff_Master_Approved_By ON Staff_Master_Approved_By.Staff_Id=AdvancesMaster.Approved_By
GO
/****** Object:  Table [dbo].[Attendance_Configuration]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance_Configuration](
	[Configuration_Id] [int] IDENTITY(1,1) NOT NULL,
	[Office_Start_Time] [time](7) NOT NULL,
	[Office_End_Time] [time](7) NOT NULL,
	[Late_Coming] [time](7) NOT NULL,
	[Early_leaving] [time](7) NOT NULL,
	[No_of_Leave] [decimal](5, 2) NOT NULL,
	[No_of_late] [tinyint] NOT NULL,
	[Loss_of_Pay] [decimal](5, 2) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Company_Unit_Name] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Attendance_Configuration]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Attendance_Configuration]
AS
SELECT
Attendance_Configuration.Configuration_Id As [Configuration_Id],
Attendance_Configuration.Office_Start_Time As [Office_Start_Time],
Attendance_Configuration.Office_End_Time As [Office_End_Time],
Attendance_Configuration.Late_Coming As [Late_Coming],
Attendance_Configuration.Early_leaving As [Early_leaving],
Attendance_Configuration.No_of_Leave As [No_of_Leave],
Attendance_Configuration.No_of_late As [No_of_late],
Attendance_Configuration.Loss_of_Pay As [Loss_of_Pay],
Attendance_Configuration.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Attendance_Configuration.Entered_Date As [Entered_Date],
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name]
FROM Attendance_Configuration
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Attendance_Configuration.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Attendance_Configuration.Company_Unit_Name


GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Master](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Category_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Category_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Category_Master]
AS
SELECT
Category_Master.Category_Id As [Category_Id],
Category_Master.Category_Name As [Category_Name],
Category_Master.Description As [Description],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Category_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Category_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Category_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Category_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Check_List_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check_List_Master](
	[Check_List_Id] [int] IDENTITY(1,1) NOT NULL,
	[Check_List_Name] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Check_List_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Check_List_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Check_List_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Check_List_Master]
AS
SELECT
Check_List_Master.Check_List_Id As [Check_List_Id],
Check_List_Master.Check_List_Name As [Check_List_Name],
Check_List_Master.Description As [Description],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Check_List_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Check_List_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Check_List_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Check_List_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Check_List_Responsibilities]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check_List_Responsibilities](
	[Responsible_Id] [int] IDENTITY(1,1) NOT NULL,
	[Responsible] [int] NOT NULL,
	[Project_Name] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Responsible_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Check_List_Responsibilities]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Check_List_Responsibilities]
AS
SELECT
Check_List_Responsibilities.Responsible_Id As [Responsible_Id],
Staff_Master_Responsible.Staff_Name AS [Responsible],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Check_List_Responsibilities.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Check_List_Responsibilities.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Check_List_Responsibilities
LEFT OUTER JOIN Staff_Master As Staff_Master_Responsible ON Staff_Master_Responsible.Staff_Id=Check_List_Responsibilities.Responsible
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Check_List_Responsibilities.Project_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Check_List_Responsibilities.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Check_List_Responsibilities.Entered_Unit

GO
/****** Object:  Table [dbo].[Client_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Master](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[Client_Name] [varchar](100) NOT NULL,
	[Client_Short_Name] [varchar](100) NULL,
	[Company_Name] [varchar](100) NULL,
	[Address] [varchar](1000) NULL,
	[Email_Id] [varchar](150) NOT NULL,
	[Phone_Number] [varchar](15) NULL,
	[Mobile_No] [varchar](15) NULL,
	[Website_Name] [varchar](150) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
	[Date_of_Order] [datetime] NULL,
	[Cell_No] [varchar](50) NULL,
	[Password] [nvarchar](20) NULL,
	[City] [nchar](50) NULL,
	[State] [nchar](50) NULL,
	[PinCode] [nchar](10) NULL,
	[Country] [nchar](50) NULL,
	[PostCode] [nchar](10) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[House_No] [nvarchar](50) NULL,
	[StreetName] [nvarchar](200) NULL,
	[ShortAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK__Client_M__75A5D8F84E88ABD4] PRIMARY KEY CLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Client_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Client_Master]

AS

SELECT

Client_Master.Client_Id As [Client_Id],

Client_Master.Client_Name As [Client_Name],

Client_Master.Client_Short_Name As [Client_Short_Name],

Client_Master.Company_Name As [Company_Name],

Client_Master.Address As [Address],

Client_Master.Email_Id As [Email_Id],

Client_Master.Phone_Number As [Phone_Number],

Client_Master.Mobile_No As [Mobile_No],

Client_Master.Date_of_Order As [Date_of_Order],

Client_Master.Website_Name As [Website_Name],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Client_Master.Entered_Date As [Entered_Date],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Client_Master.Entered_Unit As [Unit_Id],

Client_Master.Cell_No, Client_Master.Password

FROM Client_Master

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Client_Master.Entered_By

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Client_Master.Entered_Unit
GO
/****** Object:  Table [dbo].[Color_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color_Master](
	[Color_Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorCode] [varchar](10) NOT NULL,
	[Color_Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Color_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Color_Master]
AS
SELECT
Color_Master.Color_Id As [Color_Id],
Color_Master.ColorCode As [ColorCode],
Color_Master.Color_Name As [Color_Name]
FROM Color_Master

GO
/****** Object:  View [dbo].[VW_Company_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Company_Master]
AS
SELECT
Company_Master.Company_Id As [Company_Id],
Company_Master.Company_Name As [Company_Name],
Company_Master.Address As [Address],
Company_Master.Email_Id As [Email_Id],
Company_Master.Mobile_No As [Mobile_No],
Company_Master.Phone_Number As [Phone_Number],
Company_Master.Fax As [Fax],
Company_Master.Website_Name As [Website_Name],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Company_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Company_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Company_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Company_Master.Entered_Unit

GO
/****** Object:  View [dbo].[VW_Company_Unit_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW[dbo].[VW_Company_Unit_Master]

AS

SELECT

Company_Unit_Master.Unit_Id As [Unit_Id],

Company_Master_Company_Name.Company_Name AS [Company_Name],

Staff_Master_Contact_Person.Staff_Name AS [Contact_Person],

Company_Unit_Master.Address As [Address],

Company_Unit_Master.Company_Unit_Name As [Company_Unit_Name],

Company_Unit_Master.Phone_Number As [Phone_Number],

Company_Unit_Master.Mobile_No As [Mobile_No],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Company_Unit_Master.Entered_Date As [Entered_Date],
Company_Unit_Master.NoOfUser As [NoOfUser],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]

FROM Company_Unit_Master

LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Company_Unit_Master.Company_Name

LEFT OUTER JOIN Staff_Master As Staff_Master_Contact_Person ON Staff_Master_Contact_Person.Staff_Id=Company_Unit_Master.Contact_Person

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Company_Unit_Master.Entered_By

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Company_Unit_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Component_Entry]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component_Entry](
	[Component_Id] [int] IDENTITY(1,1) NOT NULL,
	[Component_Name] [varchar](150) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_Unit_Id] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Component_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Component_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Component_Entry]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Component_Entry]
AS
SELECT
Component_Entry.Component_Id As [Component_Id],
Component_Entry.Component_Name As [Component_Name],
Component_Entry.Remarks As [Remarks],
Company_Unit_Master_Entered_Unit_Id.Company_Unit_Name AS [Entered_Unit_Id],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Component_Entry.Entered_Date As [Entered_Date]
FROM Component_Entry
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit_Id ON Company_Unit_Master_Entered_Unit_Id.Unit_Id=Component_Entry.Entered_Unit_Id
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Component_Entry.Entered_By

GO
/****** Object:  View [dbo].[VW_Department_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Department_Master]

AS

SELECT

Department_Master.Department_Id As [Department_Id],

Department_Master.Department_Name As [Department_Name],

Department_Master.Rolse_and_Response As [Rolse_and_Response],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Department_Master.Entered_Date As [Entered_Date],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Department_Master.Closed As [Closed],

Department_Master.Is_Field As [Is_Field]

FROM Department_Master

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Department_Master.Entered_By

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Department_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Department_Responsibility]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Responsibility](
	[Reponsible_Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [int] NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reponsible_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Department_Responsibility]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VW_Department_Responsibility]
AS
SELECT
Department_Responsibility.Reponsible_Id As [Reponsible_Id],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Department_Responsibility.Entered_Date As [Entered_Date],
Department_Responsibility.Is_Active As [Is_Active]
FROM Department_Responsibility
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Department_Responsibility.Department_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Department_Responsibility.Staff_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Department_Responsibility.Entered_By
GO
/****** Object:  View [dbo].[VW_Designation_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Designation_Master]
AS
SELECT
Designation_Master.Designation_Id As [Designation_Id],
Designation_Master.Designation_Name As [Designation_Name],
Designation_Master.Rolse_and_Response As [Rolse_and_Response],
Designation_Master.Entered_Date As [Entered_Date],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Designation_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Designation_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Designation_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[SubCategory_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory_Master](
	[SubCategory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [int] NOT NULL,
	[Sub_Category_Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Sub_Category_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Master](
	[Document_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [int] NOT NULL,
	[Sub_Category_Name] [int] NULL,
	[Project_Name] [int] NULL,
	[Client_Name] [int] NULL,
	[Document_Name] [varchar](200) NOT NULL,
	[Document_Type] [int] NOT NULL,
	[File_Name] [varchar](200) NOT NULL,
	[Key_word] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Type_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Type_Master](
	[Document_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Document_Type] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Document_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Document_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Document_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Document_Master]
AS
SELECT
Document_Master.Document_Id As [Document_Id],
Category_Master_Category_Name.Category_Name AS [Category_Name],
SubCategory_Master_Sub_Category_Name.Sub_Category_Name AS [Sub_Category_Name],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Client_Master_Client_Name.Client_Name AS [Client_Name],
Document_Master.Document_Name As [Document_Name],
Document_Type_Master_Document_Type.Document_Type AS [Document_Type],
Document_Master.File_Name As [File_Name],
Document_Master.Key_word As [Key_word],
Document_Master.Description As [Description],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Document_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Document_Master
LEFT OUTER JOIN Category_Master As Category_Master_Category_Name ON Category_Master_Category_Name.Category_Id=Document_Master.Category_Name
LEFT OUTER JOIN SubCategory_Master As SubCategory_Master_Sub_Category_Name ON SubCategory_Master_Sub_Category_Name.SubCategory_Id=Document_Master.Sub_Category_Name
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Document_Master.Project_Name
LEFT OUTER JOIN Client_Master As Client_Master_Client_Name ON Client_Master_Client_Name.Client_Id=Document_Master.Client_Name
LEFT OUTER JOIN Document_Type_Master As Document_Type_Master_Document_Type ON Document_Type_Master_Document_Type.Document_Type_Id=Document_Master.Document_Type
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Document_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Document_Master.Entered_Unit

GO
/****** Object:  View [dbo].[VW_Document_Type_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Document_Type_Master]
AS
SELECT
Document_Type_Master.Document_Type_Id As [Document_Type_Id],
Document_Type_Master.Document_Type As [Document_Type]
FROM Document_Type_Master

GO
/****** Object:  Table [dbo].[Happy_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Happy_Master](
	[Happy_Id] [int] IDENTITY(1,1) NOT NULL,
	[Happy_Date] [datetime] NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Happy_Status] [int] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Happy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Happy_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Happy_Master]
AS
SELECT
Happy_Master.Happy_Id As [Happy_Id],
Happy_Master.Happy_Date As [Happy_Date],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Staff_Master_Staff_Name.Staff_Id As [Staff_Id],
Happy_Status_Master_Happy_Status.Status_Name AS [Happy_Status],
Happy_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],
Happy_Master.Entered_Date As [Entered_Date],
Happy_Status_Master_Happy_Status.Color_Code As [Color_Code],
Happy_Status_Master_Happy_Status.Score As [Score],
Happy_Master.Entered_By AS  [Entered_Staff_Id]
FROM Happy_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Happy_Master.Staff_Name
LEFT OUTER JOIN Happy_Status_Master As Happy_Status_Master_Happy_Status ON Happy_Status_Master_Happy_Status.Status_Id=Happy_Master.Happy_Status
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Happy_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Happy_Master.Entered_Unit


GO
/****** Object:  View [dbo].[VW_Happy_Status_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Happy_Status_Master]
AS
SELECT
Happy_Status_Master.Status_Id As [Status_Id],
Happy_Status_Master.Status_Name As [Status_Name],
Color_Master_Color_Code.Color_Name AS [Color_Code],
Happy_Status_Master.Entered_Date As [Entered_Date],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Happy_Status_Master.Score AS [Score]
FROM Happy_Status_Master
LEFT OUTER JOIN Color_Master As Color_Master_Color_Code ON Color_Master_Color_Code.ColorCode=Happy_Status_Master.Color_Code
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Happy_Status_Master.Entered_By


GO
/****** Object:  Table [dbo].[Holiday_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday_Master](
	[Holiday_Id] [int] IDENTITY(1,1) NOT NULL,
	[Holiday_For] [varchar](250) NOT NULL,
	[Holiday_From] [datetime] NOT NULL,
	[Holiday_To] [datetime] NOT NULL,
	[Holiday_Details] [varchar](1000) NULL,
	[Remarks] [varchar](500) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Holiday_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Holiday_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[VW_Holiday_Master]
AS
SELECT
Holiday_Master.Holiday_Id As [Holiday_Id],
Company_Master_Company_Name.Company_Name AS [Company_Name],
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],
Holiday_Master.Holiday_For As [Holiday_For],
Holiday_Master.Holiday_From As [Holiday_From],
Holiday_Master.Holiday_To As [Holiday_To],
Holiday_Master.Holiday_Details As [Holiday_Details],
Holiday_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Holiday_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Holiday_Master
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Holiday_Master.Company_Name
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Holiday_Master.Company_Unit_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Holiday_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Holiday_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Leave_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave_Master](
	[Leave_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NOT NULL,
	[Leave_From] [datetime] NOT NULL,
	[Leave_To] [datetime] NOT NULL,
	[Total_Leave] [decimal](5, 2) NOT NULL,
	[Reason_for_leave] [varchar](1000) NOT NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Department_Name] [int] NULL,
	[Team_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
	[Approve_Status] [varchar](30) NULL,
	[Approve_By] [int] NULL,
	[LeaveType] [varchar](10) NULL,
	[Approved_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Leave_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Leave_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Leave_Master]

AS

SELECT

Leave_Master.Leave_Id As [Leave_Id],

Company_Master_Company_Name.Company_Name AS [Company_Name],

Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],

Department_Master_Department_Name.Department_Name AS [Department_Name],

Team_Master_Team_Name.Team_Name AS [Team_Name],

Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],

Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],

Leave_Master.Leave_From As [Leave_From],

Leave_Master.Leave_To As [Leave_To],

Leave_Master.Total_Leave As [Total_Leave],

Leave_Master.Reason_for_leave As [Reason_for_leave],

Leave_Master.Remarks As [Remarks],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Leave_Master.Entered_Date As [Entered_Date],

Leave_Master.Entered_Unit As Unit_Id ,

Leave_Master.Staff_Name As Staff_Id,

Leave_Master.Approve_Status As ApprovalStatus,

Leave_Master.Approve_By As ApprovedBy,

Leave_Master.Approved_Date As ApprovedDate

FROM Leave_Master

LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Leave_Master.Company_Name

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Leave_Master.Company_Unit_Name

LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Leave_Master.Department_Name

LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Leave_Master.Team_Name

LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Leave_Master.Designation_Name

LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Leave_Master.Staff_Name

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Leave_Master.Entered_Unit

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Leave_Master.Entered_By

GO
/****** Object:  Table [dbo].[Sub_Module]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Module](
	[SubModule_Id] [int] IDENTITY(1,1) NOT NULL,
	[Module_Name] [int] NOT NULL,
	[Sub_Module_Name] [varchar](100) NOT NULL,
	[File_Name] [varchar](500) NOT NULL,
	[Is_Active] [bit] NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK__Sub_Module__1BFD2C07] PRIMARY KEY CLUSTERED 
(
	[SubModule_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Sub_Module__1CF15040] UNIQUE NONCLUSTERED 
(
	[Sub_Module_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module_Access_Rights]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module_Access_Rights](
	[Access_Id] [int] IDENTITY(1,1) NOT NULL,
	[Module_Name] [int] NULL,
	[Sub_Module_Name] [int] NOT NULL,
	[Department_Name] [int] NULL,
	[Designation_Name] [int] NULL,
	[Staff_Id] [int] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Is_Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Access_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module_Master]    Script Date: 3/5/2019 8:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module_Master](
	[Module_Id] [int] IDENTITY(1,1) NOT NULL,
	[Module_Name] [varchar](75) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Module_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Module_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Module_Access_Rights]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Module_Access_Rights]
AS
SELECT
Module_Access_Rights.Access_Id As [Access_Id],
Module_Master_Module_Name.Module_Name AS [Module_Name],
Sub_Module_Sub_Module_Name.Sub_Module_Name AS [Sub_Module_Name],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],
Staff_Master_Staff_Id.Staff_Name AS [Staff_Id],
Module_Access_Rights.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Module_Access_Rights.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Module_Access_Rights
LEFT OUTER JOIN Module_Master As Module_Master_Module_Name ON Module_Master_Module_Name.Module_Id=Module_Access_Rights.Module_Name
LEFT OUTER JOIN Sub_Module As Sub_Module_Sub_Module_Name ON Sub_Module_Sub_Module_Name.SubModule_Id=Module_Access_Rights.Sub_Module_Name
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Module_Access_Rights.Department_Name
LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Module_Access_Rights.Designation_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Id ON Staff_Master_Staff_Id.Staff_Id=Module_Access_Rights.Staff_Id
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Module_Access_Rights.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Module_Access_Rights.Entered_Unit

GO
/****** Object:  View [dbo].[VW_Module_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Module_Master]
AS
SELECT
Module_Master.Module_Id As [Module_Id],
Module_Master.Module_Name As [Module_Name],
Module_Master.Is_Active As [Is_Active],
Module_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Module_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Module_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Module_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Module_Master.Entered_Unit

GO
/****** Object:  Table [dbo].[Pay_Settings_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pay_Settings_Master](
	[KeyField] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NOT NULL,
	[Company_Unit_Name] [int] NOT NULL,
	[PF_Basic_Limit] [float] NOT NULL,
	[PF_Percentage] [float] NOT NULL,
	[PF_Max_Amount] [float] NOT NULL,
	[ESI_Percentage] [float] NOT NULL,
	[ESI_Basic_Limit] [float] NOT NULL,
	[PT_Basic_Limit] [float] NOT NULL,
	[PT_Amount] [float] NOT NULL,
	[Description] [varchar](1000) NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[KeyField] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Pay_Settings_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE VIEW [dbo].[VW_Pay_Settings_Master] 
AS 
	SELECT 
		Pay_Settings_Master.KeyField As [KeyField],
		Company_Master_Company_Name.Company_Name AS [Company_Name],
		Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],
		Pay_Settings_Master.PF_Basic_Limit As [PF_Basic_Limit],
		Pay_Settings_Master.PF_Percentage As [PF_Percentage],
		Pay_Settings_Master.PF_Max_Amount As [PF_Max_Amount],
		Pay_Settings_Master.ESI_Percentage As [ESI_Percentage],
		Pay_Settings_Master.ESI_Basic_Limit As [ESI_Basic_Limit],
		Pay_Settings_Master.PT_Basic_Limit As [PT_Basic_Limit],
		Pay_Settings_Master.PT_Amount As [PT_Amount],
		Pay_Settings_Master.Description As [Description],
		Pay_Settings_Master.cdate As [cdate],
		Pay_Settings_Master.mdate As [mdate]
	 FROM Pay_Settings_Master
	LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Pay_Settings_Master.Company_Name
	LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Pay_Settings_Master.Company_Unit_Name
GO
/****** Object:  View [dbo].[VW_Process_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Process_Master]          
AS          
SELECT          
Process_Master.Process_Id As [Process_Id],         
Process_Master.Company_Unit_Name AS Unit_Id ,    
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],          
Company_Master_Company_Name.Company_Name AS [Company_Name],          
Process_Master.Process_Name As [Process_Name],          
Process_Master.Difficulty As [Difficulty],          
Process_Master.Points As [Points],         
No_Of_Days As [No_Of_Days],         
No_Of_Staffs As [No_Of_Staffs],         
Process_Master.Description As [Description],          
Staff_Master_Entered_By.Staff_Name AS [Entered_By],          
Process_Master.Entered_Date As [Entered_Date],          
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]     ,  
 Process_Master.Order_Number As Order_number    
FROM Process_Master          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Process_Master.Company_Unit_Name          
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Process_Master.Company_Name          
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Process_Master.Entered_By          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Process_Master.Entered_Unit 
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Master](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Unit_Name] [int] NULL,
	[Company_Name] [int] NOT NULL,
	[Product_Name] [varchar](100) NULL,
	[Process_Name] [int] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NULL,
	[Description] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NOT NULL,
	[Email_Configuration] [varchar](100) NULL,
	[No_Of_Hours] [int] NULL,
	[No_Of_Minutes] [int] NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Order_Number] [int] NULL,
	[Skill_Id] [varchar](1000) NULL,
	[Department_Id] [int] NULL,
	[Project_Specific] [varchar](10) NULL,
 CONSTRAINT [PK__Product___35F35AA452442E1F] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Product_Master]          

AS          

SELECT          

Product_Master.Product_Id As [Product_Id],         

Product_Master.Company_Unit_Name As Unit_Id ,    

Task_Configuration_Task_Configuration_Id.Task_Configuration_Id As [Task_Configuration_Id], 

 Process_Master_Process_Name.Process_Id As [Process_Id] ,  

Company_Unit_Master_Company_Unit_Name.Company_Unit_Name As [Company_Unit_Name],          

Company_Master_Company_Name.Company_Name As [Company_Name],          

Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name], 

 Process_Master_Process_Name.Process_Name As [Process_Name] ,         

Product_Master.Difficulty As [Difficulty],          

Product_Master.Points As [Points],    

Product_Master.No_Of_Hours As [No_Of_Hours],

Product_Master.No_Of_Minutes As [No_Of_Minutes],     

Product_Master.No_Of_Days As [No_Of_Days],         

Product_Master.No_Of_Staffs As [No_Of_Staffs],         

Product_Master.Description As [Description],          

Staff_Master_Entered_By.Staff_Name AS [Entered_By],          

Product_Master.Entered_Date As [Entered_Date],          

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]     ,  

 Product_Master.Order_Number As Order_number,

 Task_Configuration_Task_Configuration_Id.CategoryId As [Category_Id]     

FROM Product_Master          

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Product_Master.Company_Unit_Name          

LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Product_Master.Company_Name          

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Product_Master.Entered_By          

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Product_Master.Entered_Unit 

LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Product_Master.Product_Name

LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Product_Master.Process_Name    








GO
/****** Object:  View [dbo].[VW_StaffAndLeadMaster]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE VIEW [dbo].[VW_StaffAndLeadMaster]      
AS      
      
SELECT t1.*, t2.ApartmentNo, t2.ShortAddress, t2.City, t2.Latitude, t2.Longitude FROM STAFF_MASTER t1 left outer join tblLeadMaster t2 on t1.LeadID=t2.Lead_Id WHERE Employee_Status ='Active' 
GO
/****** Object:  View [dbo].[VW_Product_Master_2015-05-27]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Product_Master_2015-05-27]          
AS          
SELECT          
Product_Master.Product_Id As [Product_Id],         
Product_Master.Company_Unit_Name As Unit_Id ,    
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name As [Company_Unit_Name],          
Company_Master_Company_Name.Company_Name As [Company_Name],          
Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name],          
Product_Master.Difficulty As [Difficulty],          
Product_Master.Points As [Points],         
No_Of_Days As [No_Of_Days],         
No_Of_Staffs As [No_Of_Staffs],         
Product_Master.Description As [Description],          
Staff_Master_Entered_By.Staff_Name AS [Entered_By],          
Product_Master.Entered_Date As [Entered_Date],          
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]     ,  
 Product_Master.Order_Number As Order_number    
FROM Product_Master          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Product_Master.Company_Unit_Name          
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Product_Master.Company_Name          
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Product_Master.Entered_By          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Product_Master.Entered_Unit 
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Product_Master.Product_Name


GO
/****** Object:  View [dbo].[VW_Product_Master_2015-06-22]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Product_Master_2015-06-22]          
AS          
SELECT          
Product_Master.Product_Id As [Product_Id],         
Product_Master.Company_Unit_Name As Unit_Id ,    
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name As [Company_Unit_Name],          
Company_Master_Company_Name.Company_Name As [Company_Name],          
Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name], 
 Process_Master_Process_Name.Process_Name As [Process_Name] ,         
Product_Master.Difficulty As [Difficulty],          
Product_Master.Points As [Points],         
Product_Master.No_Of_Days As [No_Of_Days],         
Product_Master.No_Of_Staffs As [No_Of_Staffs],         
Product_Master.Description As [Description],          
Staff_Master_Entered_By.Staff_Name AS [Entered_By],          
Product_Master.Entered_Date As [Entered_Date],          
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]     ,  
 Product_Master.Order_Number As Order_number    
FROM Product_Master          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Product_Master.Company_Unit_Name          
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Product_Master.Company_Name          
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Product_Master.Entered_By          
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Product_Master.Entered_Unit 
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Product_Master.Product_Name
LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Product_Master.Process_Name    


GO
/****** Object:  Table [dbo].[Product_Process_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Process_Master](
	[Product_Process_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL,
	[Project_Name] [int] NULL,
	[Product_Name] [int] NULL,
	[Process_Name] [int] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_By] [int] NULL,
	[Email_Configuration] [varchar](1000) NOT NULL,
	[No_Of_Hours] [int] NULL,
	[No_Of_Minutes] [int] NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
 CONSTRAINT [PK_Product_Process_Master] PRIMARY KEY CLUSTERED 
(
	[Product_Process_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Product_Process_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Product_Process_Master]    
AS    
SELECT    
Product_Process_Master.Product_Process_Id As [Product_Process_Id],    
Company_Master_Company_Name.Company_Name AS [Company_Name],    
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],
Project_Master_Project_Name.Project_Name AS [Project_Name],    
Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name],   
Process_Master_Process_Name.Process_Name AS [Process_Name],    
Product_Process_Master.Difficulty As [Difficulty],    
Product_Process_Master.Points As [Points],    
Product_Process_Master.No_Of_Days As [No_Of_Days],  
Product_Process_Master.No_Of_Staffs As [No_Of_Staffs],
Product_Process_Master.Remarks As [Remarks],    
Product_Process_Master.Entered_Date As [Entered_Date],    
Staff_Master_Entered_By.Staff_Name AS [Entered_By]    
FROM Product_Process_Master    
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Product_Process_Master.Company_Name    
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Product_Process_Master.Company_Unit_Name    
LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Product_Process_Master.Process_Name    
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Product_Process_Master.Entered_By 
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Product_Process_Master.Product_Name
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Product_Process_Master.Project_Name    

GO
/****** Object:  View [dbo].[VW_Project_Duration_Graph]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Project_Duration_Graph]
AS
SELECT Project_Master.Project_Name,
Project_Master.ProjectId,
Project_Master.Is_Active,
Project_Master.Entered_Unit,
MIN (Task_Master.Start_Date) As Start_Date,
MAX(Task_Master.End_Date)  As End_Date,
DATEDIFF(DD,MIN(Task_Master.Start_Date),MAX(Task_Master.End_Date)) +1 AS Duration,
Project_Master.Start_Date As Plan_Start_Date,
Project_Master.End_Date As Plan_End_Date,
DATEDIFF(DD,Project_Master.Start_Date,Project_Master.End_Date) +1 AS Plan_Duration,
Project_Master.Expected_Start_Date As Expect_Start_Date,
Project_Master.Expected_End_Date As Expect_End_Date
FROM Project_Master
LEFT OUTER JOIN Task_Master ON Task_Master.Project_Name= Project_Master.ProjectId
WHERE Task_Master.Start_Date IS NOT NULL AND Task_Master.End_Date IS NOT NULL
AND Project_Master.Start_Date IS NOT NULL AND Project_Master.End_Date IS NOT NULL
AND Project_Master.Expected_Start_Date IS NOT NULL AND Project_Master.Expected_End_Date IS NOT NULL
GROUP  BY Project_Master.Project_Name,
Project_Master.ProjectId,
Project_Master.Is_Active,
Project_Master.Entered_Unit,
Project_Master.Start_Date,
Project_Master.End_Date ,
Project_Master.Expected_Start_Date ,
Project_Master.Expected_End_Date

GO
/****** Object:  View [dbo].[VW_Project_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Project_Master]

AS

SELECT

Project_Master.ProjectId As [ProjectId],

Project_Master.Project_Name As [Project_Name],

Project_Master.Project_Short_Name As [Project_Short_Name],

Client_Master_Client_Name.Client_Id AS Client_Id,

Client_Master_Client_Name.Client_Name AS [Client_Name],

Project_Master.Start_Date As [Start_Date],

Project_Master.End_Date As [End_Date],

Project_Master.Expected_Start_Date As [Expected_Start_Date],

Project_Master.Expected_End_Date AS [Expected_End_Date],

Project_Master.Is_Active As [Is_Active],

Project_Master.Statement_of_Work As [Statement_of_Work],

Project_Master.Project_Purpose As [Project_Purpose],

Project_Master.Comments As [Comments],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Project_Master.Entered_Date As [Entered_Date],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Project_Master.Entered_Unit As [Unit_Id]

FROM Project_Master

LEFT OUTER JOIN Client_Master As Client_Master_Client_Name ON Client_Master_Client_Name.Client_Id=Project_Master.Client_Name

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Project_Master.Entered_By

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Project_Master.Entered_Unit

GO
/****** Object:  View [dbo].[VW_Project_Process_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE VIEW [dbo].[VW_Project_Process_Master]      
AS      
SELECT      
Project_Process_Master.Project_Process_Id As [Project_Process_Id],      
Company_Master_Company_Name.Company_Name AS [Company_Name],      
Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],      
Project_Master_Project_Name.Project_Name AS [Project_Name],      
Process_Master_Process_Name.Process_Name AS [Process_Name],      
Project_Process_Master.Difficulty As [Difficulty],      
Project_Process_Master.Points As [Points],      
Project_Process_Master.No_Of_Days As [No_Of_Days],    
Project_Process_Master.No_Of_Staffs As [No_Of_Staffs],  
Project_Process_Master.Remarks As [Remarks],      
Project_Process_Master.Entered_Date As [Entered_Date],  
Project_Process_Master.Company_Name As CompanyName,
Project_Process_Master.Company_Unit_Name As CompanyUnitID,   
Project_Process_Master.Project_Name As Project_Id,      
Staff_Master_Entered_By.Staff_Name AS [Entered_By]      
FROM Project_Process_Master      
LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Project_Process_Master.Company_Name      
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Project_Process_Master.Company_Unit_Name      
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Project_Process_Master.Project_Name      
LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Project_Process_Master.Process_Name      
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Project_Process_Master.Entered_By   

GO
/****** Object:  View [dbo].[VW_Purpose_Code_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Purpose_Code_Master]  
  
AS  
  
SELECT  
  
Purpose_Code_Master.Purpose_Code_Id As [Purpose_Code_Id],  
  
Purpose_Code_Master.Purpose_Name As [Purpose_Name],  
  
Purpose_Code_Master.Purpose_Code As [Purpose_Code],  
  
Purpose_Code_Master.Remarks As [Remarks],  
  
Staff_Master_Entered_By.Staff_Name AS [Entered_By],  
  
Purpose_Code_Master.Entered_Date As [Entered_Date], 

Purpose_Code_Master.CompanyUnitID As [UnitId],   
  
Purpose_Code_Master.TimeAllotted As TimeAllotted  
  
FROM Purpose_Code_Master  
  
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Purpose_Code_Master.Entered_By  
GO
/****** Object:  Table [dbo].[Purpose_Mapping]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purpose_Mapping](
	[Mapping_Id] [int] IDENTITY(1,1) NOT NULL,
	[Purpose_Code_Name] [int] NOT NULL,
	[Department_Name] [int] NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mapping_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Purpose_Mapping]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Purpose_Mapping]
AS
SELECT
Purpose_Mapping.Mapping_Id As [Mapping_Id],
Purpose_Code_Master_Purpose_Code_Name.Purpose_Name AS [Purpose_Code_Name],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Purpose_Mapping.Entered_Date As [Entered_Date]
FROM Purpose_Mapping
LEFT OUTER JOIN Purpose_Code_Master As Purpose_Code_Master_Purpose_Code_Name ON Purpose_Code_Master_Purpose_Code_Name.Purpose_Code_Id=Purpose_Mapping.Purpose_Code_Name
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Purpose_Mapping.Department_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Purpose_Mapping.Entered_By

GO
/****** Object:  Table [dbo].[Reporting_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reporting_Master](
	[Hierarchy_Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [int] NOT NULL,
	[Responsible_Staff] [int] NOT NULL,
	[Reporting_Staff] [int] NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Hierarchy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Reporting_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VW_Reporting_Master]
AS
SELECT
Reporting_Master.Hierarchy_Id As [Hierarchy_Id],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Staff_Master_Responsible_Staff.Staff_Name AS [Responsible_Staff],
Staff_Master_Reporting_Staff.Staff_Name AS [Reporting_Staff],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Reporting_Master.Entered_Date As [Entered_Date]
FROM Reporting_Master
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Reporting_Master.Department_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Responsible_Staff ON Staff_Master_Responsible_Staff.Staff_Id=Reporting_Master.Responsible_Staff
LEFT OUTER JOIN Staff_Master As Staff_Master_Reporting_Staff ON Staff_Master_Reporting_Staff.Staff_Id=Reporting_Master.Reporting_Staff
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Reporting_Master.Entered_By
GO
/****** Object:  View [dbo].[VW_Resource_Allocation_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Resource_Allocation_Master]
AS
SELECT
Resource_Allocation_Master.Allocation_Id As [Allocation_Id],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Task_Master_Task_Name.Task_Name AS [Task_Name],
Task_Master_Task_Name.Task_Id AS [Task_Id]
FROM Resource_Allocation_Master
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Resource_Allocation_Master.Staff_Name
LEFT OUTER JOIN Task_Master As Task_Master_Task_Name ON Task_Master_Task_Name.Task_Id=Resource_Allocation_Master.Task_Name

GO
/****** Object:  View [dbo].[VW_Resource_Count]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Resource_Count]
 As
 SELECT COUNT(*) As Resource_Count, Task_Name FROM Project_Resource_Master
 GROUP BY Task_Name
GO
/****** Object:  Table [dbo].[Resource_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource_Master](
	[Resource_Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [int] NOT NULL,
	[Staff_Name] [int] NULL,
	[Is_Active] [bit] NOT NULL,
	[Roles] [varchar](1000) NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Resource_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Resource_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Resource_Master]
AS
SELECT
Resource_Master.Resource_Id As [Resource_Id],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Resource_Master.Is_Active As [Is_Active],
Resource_Master.Roles As [Roles],
Resource_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Resource_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],
Resource_Master.Project_Name As [Project_Id]
FROM Resource_Master
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Resource_Master.Project_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Resource_Master.Staff_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Resource_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Resource_Master.Entered_Unit
GO
/****** Object:  View [dbo].[VW_Staff_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Staff_Master]







AS







SELECT







Staff_Master.Staff_Id As [Staff_Id],







Staff_Master.PF_Account_No As [PF_Account_No],







Staff_Master.Passport_Details As [Passport_Details],







Staff_Master.Staff_Name As [Staff_Name],







Staff_Master.Employee_Code As [Employee_Code],







Staff_Master.Password As [Password],







Gender_Master_Gender.Gender_Value AS [Gender],







Staff_Master.Date_of_Birth As [Date_of_Birth],







Staff_Master.Higher_Qualification As [Higher_Qualification],

Staff_Master.Department_Name As [StaffDepartmentId],







Department_Master_Department_Name.Department_Name AS [Department_Name],







Team_Master_Team_Name.Team_Name AS [Team_Name],







Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],







Staff_Master.Level,







Staff_Master.Salary As [Salary],







Staff_Master.Email_Id As [Email_Id],







Staff_Master.Address As [Present_Address],







Staff_Master.Permanent_Address As [Permanent_Address],







Staff_Master.Contact_No As [Contact_No],







Staff_Master_Entered_By.Staff_Name AS [Entered_By],







Company_Master_Company_Name.Company_Name AS [Company_Name],











Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],







Staff_Master.Entered_Date As [Entered_Date],







Staff_Master.Skills_Details As [Skills_Details],







Staff_Master.Is_Admin As [Is_Admin],







Staff_Master.Entered_Unit AS [Entered_Unit],







Staff_Master.Blood_Group As [Blood_Group],







Staff_Master.Family_Details As [Family_Details],







Staff_Master.ESI_Card_No As [ESI_Card_No],







Staff_Master.Insurance_Policy_No As [Insurance_Policy_No],







Staff_Master.PAN_No As [PAN_No],







Staff_Master.Adhaar_No As [Adhaar_No],







Staff_Master.DIN_No As [DIN_No],







Staff_Master.Bank_Details As [Bank_Details],







Staff_Master.Pass_Port_No As [Pass_Port_No],







Staff_Master.Date_of_Issue As [Date_of_Issue],







Staff_Master.Date_of_Expiry As [Date_of_Expiry],







Staff_Master.Date_of_Join As [Date_of_Join],







Staff_Master.ECNR_Required_Or_Not As [ECNR_Required_Or_Not],







Staff_Master.Mobile_No As [Mobile_No],







Staff_Master.Next_of_Kin As [Next_of_Kin],







Staff_Master.Relation_Next_Kin As [Relation_Next_Kin],







Staff_Master.Residence_No As [Residence_No],







Staff_Master.Employee_Status As [Employee_Status] ,







Staff_Master.Date_Of_Departure As [Date_Of_Departure],







Staff_Master.Departure_Location As [Reason_Of_Departure],







Staff_Master.Company_Unit_Name as [Unit_Id],





Staff_Master.Emp_Name as [EmployeeName]





FROM Staff_Master







LEFT OUTER JOIN Gender_Master As Gender_Master_Gender ON Gender_Master_Gender.Gender_Id=Staff_Master.Gender







LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Staff_Master.Department_Name







LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Staff_Master.Team_Name







LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Staff_Master.Designation_Name







LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Staff_Master.Entered_By







LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Staff_Master.Company_Name







LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Staff_Master.Company_Unit_Name







LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Staff_Master.Entered_Unit










GO
/****** Object:  View [dbo].[VW_Staff_Master1]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Staff_Master1]

AS

SELECT

Staff_Master.Staff_Id As [Staff_Id],

Staff_Master.PF_Account_No As [PF_Account_No],

Staff_Master.Passport_Details As [Passport_Details],

Staff_Master.Staff_Name As [Staff_Name],

Staff_Master.Employee_Code As [Employee_Code],

Staff_Master.Password As [Password],

Gender_Master_Gender.Gender_Value AS [Gender],

Staff_Master.Date_of_Birth As [Date_of_Birth],

Staff_Master.Higher_Qualification As [Higher_Qualification],

Department_Master_Department_Name.Department_Name AS [Department_Name],

Team_Master_Team_Name.Team_Name AS [Team_Name],

Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],

Staff_Master.Level,

Staff_Master.Salary As [Salary],

Staff_Master.Email_Id As [Email_Id],

Staff_Master.Address As [Present_Address],

Staff_Master.Permanent_Address As [Permanent_Address],

Staff_Master.Contact_No As [Contact_No],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Company_Master_Company_Name.Company_Name AS [Company_Name],

Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],

Staff_Master.Entered_Date As [Entered_Date],

Staff_Master.Skills_Details As [Skills_Details],

Staff_Master.Is_Admin As [Is_Admin],

Staff_Master.Entered_Unit AS [Entered_Unit],

Staff_Master.Blood_Group As [Blood_Group],

Staff_Master.Family_Details As [Family_Details],

Staff_Master.ESI_Card_No As [ESI_Card_No],

Staff_Master.Insurance_Policy_No As [Insurance_Policy_No],

Staff_Master.PAN_No As [PAN_No],

Staff_Master.Adhaar_No As [Adhaar_No],

Staff_Master.DIN_No As [DIN_No],

Staff_Master.Bank_Details As [Bank_Details],

Staff_Master.Pass_Port_No As [Pass_Port_No],

Staff_Master.Date_of_Issue As [Date_of_Issue],

Staff_Master.Date_of_Expiry As [Date_of_Expiry],

Staff_Master.Date_of_Join As [Date_of_Join],

Staff_Master.ECNR_Required_Or_Not As [ECNR_Required_Or_Not],

Staff_Master.Mobile_No As [Mobile_No],

Staff_Master.Next_of_Kin As [Next_of_Kin],

Staff_Master.Relation_Next_Kin As [Relation_Next_Kin],

Staff_Master.Residence_No As [Residence_No],

Staff_Master.Employee_Status As [Employee_Status] ,

Staff_Master.Date_Of_Departure As [Date_Of_Departure],

Staff_Master.Departure_Location As [Reason_Of_Departure]

FROM Staff_Master

LEFT OUTER JOIN Gender_Master As Gender_Master_Gender ON Gender_Master_Gender.Gender_Id=Staff_Master.Gender

LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Staff_Master.Department_Name

LEFT OUTER JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Staff_Master.Team_Name

LEFT OUTER JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Staff_Master.Designation_Name

LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Staff_Master.Entered_By

LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Staff_Master.Company_Name

LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Staff_Master.Company_Unit_Name

--LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Staff_Master.Entered_Unit

GO
/****** Object:  View [dbo].[UsersForMapTodayCustomers]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UsersForMapTodayCustomers]  
as  
select Staff_Id from UsersForMap where (Cast(TimeStamp as Date)= Cast(GetDate() as Date)) 
GO
/****** Object:  View [dbo].[VW_Staff_MasterLite]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Staff_MasterLite]

AS

SELECT

Staff_Master.Staff_Id As [Staff_Id],

Staff_Master.PF_Account_No As [PF_Account_No],

Staff_Master.Passport_Details As [Passport_Details],

Staff_Master.Staff_Name As [Staff_Name],

Staff_Master.Employee_Code As [Employee_Code],

Staff_Master.Password As [Password],

Gender_Master_Gender.Gender_Value AS [Gender],

Staff_Master.Date_of_Birth As [Date_of_Birth],

Staff_Master.Higher_Qualification As [Higher_Qualification],

Department_Master_Department_Name.Department_Name AS [Department_Name],

Team_Master_Team_Name.Team_Name AS [Team_Name],

Designation_Master_Designation_Name.Designation_Name AS [Designation_Name],

Staff_Master.Level,

Staff_Master.Salary As [Salary],

Staff_Master.Email_Id As [Email_Id],

Staff_Master.Address As [Present_Address],

Staff_Master.Permanent_Address As [Permanent_Address],

Staff_Master.Contact_No As [Contact_No],

Staff_Master_Entered_By.Staff_Name AS [Entered_By],

Company_Master_Company_Name.Company_Name AS [Company_Name],

Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],

Staff_Master.Entered_Date As [Entered_Date],

Staff_Master.Skills_Details As [Skills_Details],

Staff_Master.Is_Admin As [Is_Admin],

Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],

Staff_Master.Blood_Group As [Blood_Group],

Staff_Master.Family_Details As [Family_Details],

Staff_Master.ESI_Card_No As [ESI_Card_No],

Staff_Master.Insurance_Policy_No As [Insurance_Policy_No],

Staff_Master.PAN_No As [PAN_No],

Staff_Master.Adhaar_No As [Adhaar_No],

Staff_Master.DIN_No As [DIN_No],

Staff_Master.Bank_Details As [Bank_Details],

Staff_Master.Pass_Port_No As [Pass_Port_No],

Staff_Master.Date_of_Issue As [Date_of_Issue],

Staff_Master.Date_of_Expiry As [Date_of_Expiry],

Staff_Master.Date_of_Join As [Date_of_Join],

Staff_Master.ECNR_Required_Or_Not As [ECNR_Required_Or_Not],

Staff_Master.Mobile_No As [Mobile_No],

Staff_Master.Next_of_Kin As [Next_of_Kin],

Staff_Master.Relation_Next_Kin As [Relation_Next_Kin],

Staff_Master.Residence_No As [Residence_No],

Staff_Master.Employee_Status As [Employee_Status] ,

Staff_Master.Date_Of_Departure As [Date_Of_Departure],

Staff_Master.Departure_Location As [Reason_Of_Departure]

FROM Staff_Master

JOIN Gender_Master As Gender_Master_Gender ON Gender_Master_Gender.Gender_Id=Staff_Master.Gender

JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Staff_Master.Department_Name

JOIN Team_Master As Team_Master_Team_Name ON Team_Master_Team_Name.Team_Id=Staff_Master.Team_Name

JOIN Designation_Master As Designation_Master_Designation_Name ON Designation_Master_Designation_Name.Designation_Id=Staff_Master.Designation_Name

JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Staff_Master.Entered_By

JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Staff_Master.Company_Name
JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Staff_Master.Company_Unit_Name

JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Staff_Master.Entered_Unit





GO
/****** Object:  View [dbo].[UsersFreeForMapTodayCustomers]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UsersFreeForMapTodayCustomers]  
as  
select Staff_Id from UsersForMapTodayCustomers where  Staff_Id not in  (Select Staff_Name from Time_Sheet_Master where Cast(Task_Date as Date)= Cast(getdate() as Date) and Status = 2) group by Staff_Id  
GO
/****** Object:  Table [dbo].[StockCategory]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Entered_Unit] [int] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
 CONSTRAINT [PK_StockCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SupplierRequest]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SupplierRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[EneteredBy] [int] NULL,
	[EneteredDate] [date] NULL,
	[Request_Status] [varchar](20) NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[Remarks] [varchar](200) NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_Tbl_SupplierRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_StockRequest]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_StockRequest]
AS
select Tbl_SupplierRequest.Id, 
'Req-'+StockCategory.CategoryName +'-' +CAST (Tbl_SupplierRequest.Id AS VARCHAR) AS StockRequest,   
StockCategory.CategoryName, Tbl_SupplierRequest.EneteredBy, Tbl_SupplierRequest.EneteredDate,
Tbl_SupplierRequest.Request_Status, Tbl_SupplierRequest.ApprovedBy, Tbl_SupplierRequest.ApprovedDate
 from Tbl_SupplierRequest
INNER JOIN StockCategory ON  StockCategory.Id=  Tbl_SupplierRequest.CategoryId




GO
/****** Object:  View [dbo].[FreeUsersForMapTopLocID]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[FreeUsersForMapTopLocID]  
as  
Select MAX(t3.Location_Log_Id) as 'Location_Log_Id', t4.Staff_Id from UsersForMap t3 inner join [UsersFreeForMapTodayCustomers] t4 on t3.Staff_Id=t4.Staff_Id group by t4.Staff_Id 
GO
/****** Object:  View [dbo].[VW_Sub_Module]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_Sub_Module]
AS
SELECT
Sub_Module.SubModule_Id As [SubModule_Id],
Module_Master.Module_Name AS [Module_Name],
Sub_Module.Sub_Module_Name As [Sub_Module_Name],
Sub_Module.File_Name As [File_Name],
Sub_Module.Is_Active As [Is_Active],
Sub_Module.Remarks As [Remarks],
Staff_Master.Staff_Name AS [Entered_By],
Sub_Module.Entered_Date As [Entered_Date]
FROM Sub_Module
LEFT OUTER JOIN Module_Master ON Module_Master.Module_Id=Sub_Module.Module_Name
LEFT OUTER JOIN Staff_Master ON Staff_Master.Staff_Id=Sub_Module.Entered_By

GO
/****** Object:  Table [dbo].[Sub_Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Product_Master](
	[Product_Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NOT NULL,
	[Company_Unit_Name] [int] NULL,
	[Product_Name] [int] NULL,
	[Process_Name] [int] NULL,
	[Task_Name] [varchar](200) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NULL,
	[Email_Configuration] [varchar](1000) NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Parent_SubTaskId] [int] NULL,
	[Project_Name] [int] NULL,
 CONSTRAINT [PK__Sub_Prod__B0D6BC572E19B5B3] PRIMARY KEY CLUSTERED 
(
	[Product_Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Sub_Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Sub_Product_Master]  
    AS     
    SELECT    Sub_Product_Master.Product_Task_Id As [Product_Task_Id],     
    Company_Master_Company_Name.Company_Name AS [Company_Name],    
     Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],     
Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name], 
	 Process_Master_Process_Name.Process_Name As [Process_Name] ,
     Sub_Product_Master.Task_Name As [Task_Name],     
     Sub_Product_Master.Remarks As [Remarks],    
     Staff_Master_Entered_By.Staff_Name AS [Entered_By],   
     Sub_Product_Master.Entered_Date As [Entered_Date],  
	 Sub_Product_Master.Difficulty,  
	 Sub_Product_Master.Points ,  
	 Sub_Product_Master.Email_Configuration,  
	 Sub_Product_Master.No_Of_Days,  
	 Sub_Product_Master.No_Of_Staffs ,  
	 Product_Master_Product_Name.Product_Id ,
	 Sub_Product_Master.Project_Name As ProjectId, 
	 Sub_Product_Master.Parent_SubTaskId
     FROM Sub_Product_Master    
     LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Sub_Product_Master.Company_Name    
     LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Sub_Product_Master.Company_Unit_Name    
     LEFT OUTER JOIN Product_Master As Product_Master_Product_Name ON Product_Master_Product_Name.Product_Id=Sub_Product_Master.Product_Name    
     LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Sub_Product_Master.Entered_By
    LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Sub_Product_Master.Project_Name 
 LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Sub_Product_Master.Process_Name    
 LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Sub_Product_Master.Product_Name

GO
/****** Object:  View [dbo].[VW_Sub_Product_Master_2015-05-27]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Sub_Product_Master_2015-05-27]  
    AS     
    SELECT    Sub_Product_Master.Product_Task_Id As [Product_Task_Id],     
    Company_Master_Company_Name.Company_Name AS [Company_Name],    
     Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],     
     Product_Master_Product_Name.Product_Name AS [Product_Name],  
    Project_Master_Project_Name.Project_Name As [Project_Name] ,
     Sub_Product_Master.Task_Name As [Task_Name],     
     Sub_Product_Master.Remarks As [Remarks],    
     Staff_Master_Entered_By.Staff_Name AS [Entered_By],   
     Sub_Product_Master.Entered_Date As [Entered_Date],  
	 Sub_Product_Master.Difficulty,  
	 Sub_Product_Master.Points ,  
	 Sub_Product_Master.Email_Configuration,  
	 Sub_Product_Master.No_Of_Days,  
	 Sub_Product_Master.No_Of_Staffs ,  
	 Product_Master_Product_Name.Product_Id ,
	 Sub_Product_Master.Project_Name As ProjectId, 
	 Sub_Product_Master.Parent_SubTaskId
     FROM Sub_Product_Master    
     LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Sub_Product_Master.Company_Name    
     LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Sub_Product_Master.Company_Unit_Name    
     LEFT OUTER JOIN Product_Master As Product_Master_Product_Name ON Product_Master_Product_Name.Product_Id=Sub_Product_Master.Product_Name    
     LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Sub_Product_Master.Entered_By
    LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Sub_Product_Master.Project_Name 
 


GO
/****** Object:  Table [dbo].[Sub_Project_Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Project_Product_Master](
	[Product_Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [int] NOT NULL,
	[Company_Unit_Name] [int] NULL,
	[Project_Name] [int] NULL,
	[Product_Name] [int] NULL,
	[Process_Name] [int] NULL,
	[Task_Name] [varchar](200) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Difficulty] [decimal](7, 2) NULL,
	[Points] [decimal](7, 2) NULL,
	[Email_Configuration] [varchar](1000) NULL,
	[No_Of_Days] [decimal](7, 2) NULL,
	[No_Of_Staffs] [int] NULL,
	[Parent_SubTaskId] [int] NULL,
 CONSTRAINT [PK_Sub_Project_Product_Master] PRIMARY KEY CLUSTERED 
(
	[Product_Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Sub_Project_Product_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Sub_Project_Product_Master]  
    AS     
    SELECT    Sub_Project_Product_Master.Product_Task_Id As [Product_Task_Id],     
    Company_Master_Company_Name.Company_Name AS [Company_Name],    
     Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name], 
	 Project_Master_Project_Name.Project_Name AS [Project_Name],    
	Task_Configuration_Task_Configuration_Id.Task_Name As [Product_Name], 
	 Process_Master_Process_Name.Process_Name As [Process_Name] ,
     Sub_Project_Product_Master.Task_Name As [Task_Name],     
     Sub_Project_Product_Master.Remarks As [Remarks],    
     Staff_Master_Entered_By.Staff_Name AS [Entered_By],   
     Sub_Project_Product_Master.Entered_Date As [Entered_Date],  
	 Sub_Project_Product_Master.Difficulty,  
	 Sub_Project_Product_Master.Points ,  
	 Sub_Project_Product_Master.Email_Configuration,  
	 Sub_Project_Product_Master.No_Of_Days,  
	 Sub_Project_Product_Master.No_Of_Staffs ,  
	 Product_Master_Product_Name.Product_Id ,
	 Sub_Project_Product_Master.Project_Name As ProjectId, 
	 Sub_Project_Product_Master.Parent_SubTaskId
     FROM Sub_Project_Product_Master    
     LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Sub_Project_Product_Master.Company_Name    
     LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Sub_Project_Product_Master.Company_Unit_Name    
     LEFT OUTER JOIN Product_Master As Product_Master_Product_Name ON Product_Master_Product_Name.Product_Id=Sub_Project_Product_Master.Product_Name    
     LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Sub_Project_Product_Master.Entered_By
    LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Sub_Project_Product_Master.Project_Name 
 LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Sub_Project_Product_Master.Process_Name    
 LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id = Sub_Project_Product_Master.Product_Name
 


GO
/****** Object:  Table [dbo].[Sub_Task_Entry]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Task_Entry](
	[Sub_Task_Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [int] NOT NULL,
	[Task_Name] [int] NOT NULL,
	[Sub_Task_Name] [varchar](150) NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sub_Task_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Sub_Task_Entry]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Sub_Task_Entry]
AS
SELECT
Sub_Task_Entry.Sub_Task_Id As [Sub_Task_Id],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Task_Configuration_Task_Name.Task_Name AS [Task_Name],
Sub_Task_Entry.Sub_Task_Name As [Sub_Task_Name],
Sub_Task_Entry.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Sub_Task_Entry.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Unit_Id AS [Entered_Unit]
FROM Sub_Task_Entry
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Sub_Task_Entry.Project_Name
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Name ON Task_Configuration_Task_Name.Task_Configuration_Id=Sub_Task_Entry.Task_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Sub_Task_Entry.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Sub_Task_Entry.Entered_Unit

GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Tonnage] [float] NOT NULL,
	[Pic] [varchar](100) NOT NULL,
	[Entered_By] [int] NOT NULL,
	[Entered_Date] [datetime] NOT NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vehicletypeswithstaff]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[vehicletypeswithstaff]
 as
 select t1.Staff_Id, t1.vehicleid, t2.Name as VehicleName, t2.Pic as VehiclePic, t2.tonnage from Staff_Master t1 join vehicletypes t2 on t1.vehicleId = t2.Id
GO
/****** Object:  View [dbo].[VW_Sub_Task_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Sub_Task_Master]  

    AS     

    SELECT    Sub_Task_Master.Process_Task_Id As [Process_Task_Id],     

    Company_Master_Company_Name.Company_Name AS [Company_Name],    

     Company_Unit_Master_Company_Unit_Name.Company_Unit_Name AS [Company_Unit_Name],     
	  Company_Unit_Master_Company_Unit_Name.Unit_Id AS [Company_Unit_Id],     

     Process_Master_Process_Name.Process_Name AS [Process_Name],  

    Project_Master_Project_Name.Project_Name As [Project_Name] ,

     Sub_Task_Master.Task_Name As [Task_Name],     

     Sub_Task_Master.Remarks As [Remarks],    

     Staff_Master_Entered_By.Staff_Name AS [Entered_By],   

     Sub_Task_Master.Entered_Date As [Entered_Date],  

	 Sub_Task_Master.Difficulty,  

	 Sub_Task_Master.Points ,  

	 Sub_Task_Master.Email_Configuration,  

	 Sub_Task_Master.No_Of_Days,  

	 Sub_Task_Master.No_Of_Staffs ,  

	 Process_Master_Process_Name.Process_Id ,

	 Sub_Task_Master.Project_Name As ProjectId, 

	 Sub_Task_Master.Parent_SubTaskId

     FROM Sub_Task_Master    

     LEFT OUTER JOIN Company_Master As Company_Master_Company_Name ON Company_Master_Company_Name.Company_Id=Sub_Task_Master.Company_Name    

     LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Company_Unit_Name ON Company_Unit_Master_Company_Unit_Name.Unit_Id=Sub_Task_Master.Company_Unit_Name    

     LEFT OUTER JOIN Process_Master As Process_Master_Process_Name ON Process_Master_Process_Name.Process_Id=Sub_Task_Master.Process_Name    

     LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Sub_Task_Master.Entered_By

    LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Sub_Task_Master.Project_Name 

GO
/****** Object:  View [dbo].[VW_SubCategory_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW[dbo].[VW_SubCategory_Master]
AS
SELECT
SubCategory_Master.SubCategory_Id As [SubCategory_Id],
Category_Master_Category_Name.Category_Name AS [Category_Name],
SubCategory_Master.Sub_Category_Name As [Sub_Category_Name],
SubCategory_Master.Description As [Description],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
SubCategory_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM SubCategory_Master
LEFT OUTER JOIN Category_Master As Category_Master_Category_Name ON Category_Master_Category_Name.Category_Id=SubCategory_Master.Category_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=SubCategory_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=SubCategory_Master.Entered_Unit

GO
/****** Object:  View [dbo].[VW_Task_Configuration]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Task_Configuration]
AS
SELECT
Task_Configuration.Task_Configuration_Id As [Task_Configuration_Id],
Task_Configuration.Task_Name As [Task_Name],
Task_Configuration.Task_Instruction As [Task_Instruction],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Task_Configuration.Entered_Date As [Entered_Date]
FROM Task_Configuration
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Task_Configuration.Entered_By

GO
/****** Object:  Table [dbo].[Task_Engineering_Status]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Engineering_Status](
	[Status_Value] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[Color_Code] [varchar](10) NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_Unit] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_By] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Task_Engineering_Status]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Task_Engineering_Status]
AS
SELECT
Task_Engineering_Status.Status_Value As [Status_Value],
Task_Engineering_Status.Status As [Status],
Color_Master_Color_Code.Color_Name AS [Color_Code],
Task_Engineering_Status.Remarks As [Remarks],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit],
Task_Engineering_Status.Entered_Date As [Entered_Date],
Staff_Master_Entered_By.Staff_Name AS [Entered_By]
FROM Task_Engineering_Status
LEFT OUTER JOIN Color_Master As Color_Master_Color_Code ON Color_Master_Color_Code.ColorCode=Task_Engineering_Status.Color_Code
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Task_Engineering_Status.Entered_Unit
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Task_Engineering_Status.Entered_By
GO
/****** Object:  Table [dbo].[Task_Mapping]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Mapping](
	[Task_Map_Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [int] NOT NULL,
	[Task_Configuration_Id] [int] NOT NULL,
	[Task_Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Task_Mapping]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[VW_Task_Mapping]
AS
SELECT
Task_Mapping.Task_Map_Id As [Task_Configuration_Id],
Project_Master_Project_Name.ProjectId AS [ProjectId],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Task_Configuration_Task_Configuration_Id.Task_Name AS [Task_Name],
Task_Configuration_Task_Configuration_Id.Task_Configuration_Id AS [Task_Map_Id],
Project_Master_Project_Name.Project_Short_Name+'->'+Task_Configuration_Task_Configuration_Id.Task_Name+ ' (' + 
CAST(dbo.Task_Mapping.Task_Map_Id AS VARCHAR(50))+ ') '  AS Project_Task_Name
FROM Task_Mapping
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON 
Project_Master_Project_Name.ProjectId=Task_Mapping.Project_Name
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON 
Task_Configuration_Task_Configuration_Id.Task_Configuration_Id=Task_Mapping.Task_Configuration_Id
GO
/****** Object:  View [dbo].[VW_Task_Mapping_2015-05-11]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Task_Mapping_2015-05-11]
AS
SELECT
Task_Mapping.Task_Map_Id As [Task_Map_Id],
Project_Master_Project_Name.ProjectId AS [ProjectId],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Task_Configuration_Task_Configuration_Id.Task_Name AS [Task_Name],
Task_Configuration_Task_Configuration_Id.Task_Configuration_Id AS [Task_Configuration_Id],
Project_Master_Project_Name.Project_Short_Name+'->'+Task_Configuration_Task_Configuration_Id.Task_Name AS Project_Task_Name
FROM Task_Mapping
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Task_Mapping.Project_Name
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id=Task_Mapping.Task_Configuration_Id
GO
/****** Object:  View [dbo].[VW_Task_Mapping_2015-06-09]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[VW_Task_Mapping_2015-06-09]
AS
SELECT
Task_Mapping.Task_Map_Id As [Task_Map_Id],
Project_Master_Project_Name.ProjectId AS [ProjectId],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Task_Configuration_Task_Configuration_Id.Task_Name AS [Task_Name],
Task_Configuration_Task_Configuration_Id.Task_Configuration_Id AS [Task_Configuration_Id],
Project_Master_Project_Name.Project_Short_Name+'->'+Task_Configuration_Task_Configuration_Id.Task_Name+ ' (' + CAST(dbo.Task_Mapping.Task_Map_Id AS VARCHAR(50))+ ') '  AS Project_Task_Name
FROM Task_Mapping
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Task_Mapping.Project_Name
LEFT OUTER JOIN Task_Configuration As Task_Configuration_Task_Configuration_Id ON Task_Configuration_Task_Configuration_Id.Task_Configuration_Id=Task_Mapping.Task_Configuration_Id


GO
/****** Object:  View [dbo].[VW_TASK_MASTER_LIMIT_PROCESS]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_TASK_MASTER_LIMIT_PROCESS]
AS
SELECT TASK_MASTER.* FROM TASK_MASTER,PROCESS_MASTER 
WHERE  TASK_MASTER.PROCESS_ID = PROCESS_MASTER.PROCESS_ID 
AND PROCESS_MASTER.ORDER_NUMBER<=22
GO
/****** Object:  Table [dbo].[Task_Process_Entry]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Process_Entry](
	[Progress_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Date] [date] NOT NULL,
	[Project_Name] [int] NULL,
	[Task_Name] [int] NULL,
	[Sub_Task_Name] [int] NULL,
	[Component_Name] [int] NULL,
	[Start_Time] [datetime] NOT NULL,
	[End_Time] [datetime] NULL,
	[Staff_Name] [int] NULL,
	[Task_Status] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Progress_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Task_Process_Entry]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Task_Process_Entry]
AS
SELECT
Task_Process_Entry.Progress_Id As [Progress_Id],
Task_Process_Entry.Task_Date As [Task_Date],
Project_Master_Project_Name.Project_Name AS [Project_Name],
Task_Master_Task_Name.Task_Name AS [Task_Name],
Sub_Task_Entry_Sub_Task_Name.Sub_Task_Name AS [Sub_Task_Name],
Component_Master_Component_Name.Component_Name AS [Component_Name],
Task_Process_Entry.Start_Time As [Start_Time],
Task_Process_Entry.End_Time As [End_Time],
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Task_Engineering_Status_Task_Status.Status AS [Task_Status],
Task_Process_Entry.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Task_Process_Entry.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Task_Process_Entry
LEFT OUTER JOIN Project_Master As Project_Master_Project_Name ON Project_Master_Project_Name.ProjectId=Task_Process_Entry.Project_Name
LEFT OUTER JOIN Task_Master As Task_Master_Task_Name ON Task_Master_Task_Name.Task_Id=Task_Process_Entry.Task_Name
LEFT OUTER JOIN Sub_Task_Entry As Sub_Task_Entry_Sub_Task_Name ON Sub_Task_Entry_Sub_Task_Name.Sub_Task_Id=Task_Process_Entry.Sub_Task_Name
LEFT OUTER JOIN Component_Entry As Component_Master_Component_Name ON Component_Master_Component_Name.Component_Id=Task_Process_Entry.Component_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Staff_Name ON Staff_Master_Staff_Name.Staff_Id=Task_Process_Entry.Staff_Name
LEFT OUTER JOIN Task_Engineering_Status As Task_Engineering_Status_Task_Status ON Task_Engineering_Status_Task_Status.Status_Value=Task_Process_Entry.Task_Status
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Task_Process_Entry.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Task_Process_Entry.Entered_Unit
GO
/****** Object:  View [dbo].[VW_Task_Status_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[VW_Task_Status_Master]
AS
SELECT
Task_Status_Master.Status_Id As [Status_Id],
Task_Status_Master.Status_Value As [Status_Value],
Color_Master_Color_Code.Color_Name AS [Color_Code]
FROM Task_Status_Master
LEFT OUTER JOIN Color_Master As Color_Master_Color_Code ON Color_Master_Color_Code.colorCode=Task_Status_Master.Color_Code

GO
/****** Object:  View [dbo].[VW_Team_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Team_Master]
AS
SELECT
Team_Master.Team_Id As [Team_Id],
Department_Master_Department_Name.Department_Name AS [Department_Name],
Team_Master.Team_Name As [Team_Name],
Team_Master.Rolse_and_Response As [Rolse_and_Response],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Team_Master.Entered_Date As [Entered_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Team_Master
LEFT OUTER JOIN Department_Master As Department_Master_Department_Name ON Department_Master_Department_Name.Department_Id=Team_Master.Department_Name
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Team_Master.Entered_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Team_Master.Entered_Unit

GO
/****** Object:  View [dbo].[vw_Testing]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Testing]
as
select
CAST(cast(Task_Date as varchar) +''+ cast(Start_Time as varchar) as dateTime) as dtm,
* from Time_Sheet_Master

GO
/****** Object:  View [dbo].[VW_Time_Sheet_Staff_Master]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_Time_Sheet_Staff_Master]
AS
SELECT
Time_Sheet_Master.Time_Sheet_Id As [Time_Sheet_Id],
Time_Sheet_Master.Task_Date As [Task_Date],
CAST(DAY(Time_Sheet_Master.Task_Date) AS VARCHAR) +'-'+
SUBSTRING(DATENAME(MM,Time_Sheet_Master.Task_Date),1,3) +'-'+
CAST(YEAR(Time_Sheet_Master.Task_Date) AS VARCHAR) AS Time_Sheet_Date,
Staff_Master_Staff_Name.Staff_Name AS [Staff_Name],
Time_Sheet_Master.Staff_Name  As [Staff_Id],
Purpose_Code_Master_Purpose_Name.Purpose_Name AS [Purpose_Name],
Time_Sheet_Master.Start_Time As [Start_Time],
Time_Sheet_Master.End_Time As [End_Time],
Time_Sheet_Status_Status.Status_Name AS [Status],
Time_Sheet_Master.Remarks As [Remarks],
Staff_Master_Entered_By.Staff_Name AS [Entered_By],
Staff_Master_Modified_By.Staff_Name AS [Modified_By],
Time_Sheet_Master.Entered_Date As [Entered_Date],
Time_Sheet_Master.Modified_Date As [Modified_Date],
Company_Unit_Master_Entered_Unit.Company_Unit_Name AS [Entered_Unit]
FROM Staff_Master As Staff_Master_Staff_Name
LEFT OUTER JOIN  Time_Sheet_Master ON Staff_Master_Staff_Name.Staff_Id=Time_Sheet_Master.Staff_Name
LEFT OUTER JOIN Purpose_Code_Master As Purpose_Code_Master_Purpose_Name ON Purpose_Code_Master_Purpose_Name.Purpose_Code_Id=Time_Sheet_Master.Purpose_Name
LEFT OUTER JOIN Time_Sheet_Status As Time_Sheet_Status_Status ON Time_Sheet_Status_Status.Status_Id=Time_Sheet_Master.Status
LEFT OUTER JOIN Staff_Master As Staff_Master_Entered_By ON Staff_Master_Entered_By.Staff_Id=Time_Sheet_Master.Entered_By
LEFT OUTER JOIN Staff_Master As Staff_Master_Modified_By ON Staff_Master_Modified_By.Staff_Id=Time_Sheet_Master.Modified_By
LEFT OUTER JOIN Company_Unit_Master As Company_Unit_Master_Entered_Unit ON Company_Unit_Master_Entered_Unit.Unit_Id=Time_Sheet_Master.Entered_Unit


GO
/****** Object:  View [dbo].[onlyTaskTimeSheet]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[onlyTaskTimeSheet]
as

select * from Time_Sheet_Master where Task_Id != null or Task_Id != ''
GO
/****** Object:  View [dbo].[VW_Time_Sheet_Status]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_Time_Sheet_Status]
AS
SELECT
Time_Sheet_Status.Status_Id As [Status_Id],
Color_Master_Color_Code.Color_Name AS [Color_Code],
Time_Sheet_Status.Status_Name As [Status_Name]
FROM Time_Sheet_Status
LEFT OUTER JOIN Color_Master As Color_Master_Color_Code ON Color_Master_Color_Code.ColorCode=Time_Sheet_Status.Color_Code
GO
/****** Object:  View [dbo].[OnlyFreeStaffToday]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[OnlyFreeStaffToday]
as
select distinct t4.Staff_Name, t5.Department_Name from Attendance_Master t4  join Staff_Master t5 on t4.Staff_Name= t5.Staff_Id where  Cast(t4.Attendance_Date as date) = cast(GetDate() as date) and t4.In_Time is not null and t4.Out_Time is null 
GO
/****** Object:  View [dbo].[SelectedUsersForMapTopLocID]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[SelectedUsersForMapTopLocID]    
as    
Select MAX(t3.Location_Log_Id) as 'Location_Log_Id', t3.Staff_Id from UsersForMap t3  group by t3.Staff_Id 
GO
/****** Object:  Table [dbo].[Actual_Resource_Working]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actual_Resource_Working](
	[Resource_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NULL,
	[ProgressId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdditionalOperatives]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalOperatives](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OperativeName] [nchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Password] [nchar](20) NULL,
	[ClientID] [int] NULL,
	[CampaignID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BandRegionsAllocate]    Script Date: 3/5/2019 8:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BandRegionsAllocate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BandId] [int] NULL,
	[State] [varchar](100) NULL,
	[City_District] [varchar](100) NULL,
	[District] [varchar](100) NULL,
	[Entered_By] [int] NULL,
	[Entered_Unit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campaign_Cost]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaign_Cost](
	[Campaign_Id] [int] NOT NULL,
	[Inventory] [varchar](150) NULL,
	[Cost] [decimal](18, 0) NULL,
	[Approved_By] [int] NULL,
	[Received_By] [int] NULL,
	[Voucher_No] [int] NULL,
 CONSTRAINT [PK_campaign_Cost] PRIMARY KEY CLUSTERED 
(
	[Campaign_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Modes]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Modes](
	[Mode_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mode_Name] [varchar](250) NULL,
	[AutomatedAction] [varchar](50) NULL,
 CONSTRAINT [PK_Campaign_Modes] PRIMARY KEY CLUSTERED 
(
	[Mode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campaignModes_Templates]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaignModes_Templates](
	[CampModeTemp_Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NULL,
	[CampaignMode] [varchar](250) NULL,
	[Template] [varchar](max) NULL,
	[Documents] [varchar](500) NULL,
	[ActionStats] [nchar](1) NULL,
	[CreatedDate] [datetime] NULL,
	[Count] [int] NULL,
	[TemplateName] [varchar](100) NULL,
 CONSTRAINT [PK_campaignModes_Templates] PRIMARY KEY CLUSTERED 
(
	[CampModeTemp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Band] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayList]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayList](
	[MonthDay] [varchar](20) NULL,
	[FullDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerDistributors]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerDistributors](
	[Lead_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](120) NULL,
	[Mobile_No] [nvarchar](50) NULL,
	[Address] [varchar](300) NULL,
	[City] [varchar](60) NULL,
	[State] [varchar](60) NULL,
	[PinCode] [numeric](18, 0) NULL,
	[Country] [varchar](60) NULL,
	[Contact1] [varchar](60) NULL,
	[Contact1_No] [numeric](18, 0) NULL,
	[Contact2] [varchar](60) NULL,
	[Contact2_No] [numeric](18, 0) NULL,
	[Contact3] [varchar](60) NULL,
	[Contact3_No] [numeric](18, 0) NULL,
	[LandlineNo] [numeric](18, 0) NULL,
	[TinNo] [varchar](30) NULL,
	[Followup_Details] [nvarchar](max) NULL,
	[EmailId] [nvarchar](40) NULL,
	[TransportMode] [int] NULL,
	[Entered_Date] [smalldatetime] NULL,
	[Entered_Staff] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Campaign]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Campaign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CampModeTemp_Id] [int] NULL,
	[LeadID] [int] NULL,
	[Stats] [nchar](1) NULL,
	[Date_Time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Payslip_Master]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Payslip_Master](
	[Staff_Name] [int] NOT NULL,
	[Emp_Pay_Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [float] NOT NULL,
	[Month] [float] NOT NULL,
	[Working_Day] [float] NULL,
	[Attendance_Day] [float] NULL,
	[Basic] [float] NOT NULL,
	[HRA] [float] NULL,
	[Conveyance] [float] NULL,
	[Medical] [float] NULL,
	[CCA] [float] NULL,
	[Advance] [float] NULL,
	[PF] [float] NULL,
	[ESI] [float] NULL,
	[PT] [float] NULL,
	[TDS] [float] NULL,
	[Arrears] [float] NULL,
	[Traval] [float] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[Pay_State] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_Pay_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Store_MasterHistory]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Store_MasterHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_StoreId] [int] NULL,
	[Staff_Id] [int] NULL,
	[StockId] [int] NULL,
	[Total_Quantity] [decimal](7, 2) NULL,
	[Unit] [varchar](10) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpoAttendees]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpoAttendees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExpoID] [int] NULL,
	[LeadName] [varchar](50) NULL,
	[Mobile_No] [numeric](18, 0) NULL,
	[EmailID] [varchar](50) NULL,
	[InterestedIn] [int] NULL,
	[Followup_Details] [nvarchar](max) NULL,
	[Entered_Date] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exports]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exports](
	[Lead_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](120) NULL,
	[Mobile_No] [numeric](30, 0) NULL,
	[Address] [varchar](300) NULL,
	[City] [varchar](60) NULL,
	[State] [varchar](60) NULL,
	[PinCode] [numeric](18, 0) NULL,
	[Country] [varchar](60) NULL,
	[Contact1] [varchar](60) NULL,
	[Contact1_No] [numeric](18, 0) NULL,
	[Contact2] [varchar](60) NULL,
	[Contact2_No] [numeric](18, 0) NULL,
	[Contact3] [varchar](60) NULL,
	[Contact3_No] [numeric](18, 0) NULL,
	[LandlineNo] [numeric](18, 0) NULL,
	[TinNo] [varchar](30) NULL,
	[TransportMode] [int] NULL,
	[Followup_Details] [nvarchar](max) NULL,
	[EmailId] [nvarchar](30) NULL,
	[Entered_Date] [smalldatetime] NULL,
	[Entered_Staff] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expos]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expos](
	[ID] [int] NULL,
	[ExpoName] [varchar](100) NULL,
	[Venue] [varchar](150) NULL,
	[ExpoDate] [date] NULL,
	[NoOfAttendees] [int] NULL,
	[InCharge] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadsAccess]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadsAccess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Staff] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalBand]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalBand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Band] [int] NULL,
	[BandName] [nchar](50) NULL,
	[Entered_Unit] [int] NULL,
	[Entered_By] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationLogBackUp]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationLogBackUp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocLogStart] [int] NULL,
	[LocLogEnd] [int] NULL,
	[UnitId] [int] NULL,
	[BkDate] [datetime] NULL,
	[BkStaffId] [int] NULL,
	[LocLogStartDate] [datetime] NULL,
	[LocLogEndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyLocations]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyLocations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [int] NULL,
	[Lat] [nvarchar](50) NULL,
	[Long] [nvarchar](50) NULL,
	[HouseNo] [nvarchar](10) NULL,
	[StreetName] [nvarchar](200) NULL,
	[PostCode] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[EnteredDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payslip_Master]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payslip_Master](
	[Pay_HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[Pay_Id] [int] NULL,
	[Staff_Name] [int] NOT NULL,
	[Basic] [float] NOT NULL,
	[HRA] [float] NOT NULL,
	[Conveyance] [float] NOT NULL,
	[Medical] [float] NOT NULL,
	[CCA] [float] NOT NULL,
	[Traval] [float] NOT NULL,
	[CDATE] [datetime] NULL,
	[MDATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pay_HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payslip_Master_History]    Script Date: 3/5/2019 8:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payslip_Master_History](
	[Pay_HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[Pay_Id] [int] NULL,
	[Staff_Name] [int] NOT NULL,
	[Basic] [float] NULL,
	[HRA] [float] NULL,
	[Conveyance] [float] NULL,
	[Medical] [float] NULL,
	[CCA] [float] NULL,
	[Traval] [float] NULL,
	[CDATE] [datetime] NULL,
	[MDATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pay_HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUps]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUps](
	[PickUpId] [int] IDENTITY(1,1) NOT NULL,
	[Task_Id] [int] NULL,
	[Task_Date] [date] NULL,
	[Status] [int] NULL,
	[Staff_Name] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCodeToDriver]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCodeToDriver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [nchar](10) NULL,
	[FirstStaff_Id] [int] NULL,
	[SecStaff_Id] [int] NULL,
	[Entered_Unit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process_Points]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process_Points](
	[Points_Id] [int] IDENTITY(1,1) NOT NULL,
	[Process_Id] [int] NULL,
	[Project_Engineers] [decimal](7, 2) NULL,
	[Work_Engineers] [decimal](7, 2) NULL,
	[Design_Engineers] [decimal](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Points_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process_Status_Mapping]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process_Status_Mapping](
	[ProcessMapId] [int] IDENTITY(1,1) NOT NULL,
	[ProcessStatusId] [int] NULL,
	[ProcessId] [int] NULL,
	[SubProcessId] [int] NULL,
	[NextProcessId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Status] [char](2) NULL,
	[UnitId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process_Status_Master]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process_Status_Master](
	[ProcessStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ProcessStatus] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Status] [char](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Query]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Query](
	[Holiday_Id] [int] NOT NULL,
	[Holiday_For] [varchar](250) NOT NULL,
	[Holiday_From] [datetime2](3) NOT NULL,
	[Holiday_To] [datetime2](3) NOT NULL,
	[Holiday_Details] [varchar](1000) NULL,
	[Remarks] [varchar](500) NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime2](3) NOT NULL,
	[Entered_Unit] [int] NOT NULL,
	[Company_Name] [int] NULL,
	[Company_Unit_Name] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Band] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockAmount]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAmount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [varchar](15) NULL,
	[SupplierId] [int] NULL,
	[Tax] [float] NULL,
	[OtherTax] [float] NULL,
	[TotalAmount] [float] NULL,
	[Remarks] [varchar](150) NULL,
	[BillStatus] [varchar](100) NULL,
	[Cash] [float] NULL,
	[CardNo] [varchar](100) NULL,
	[CardAmount] [float] NULL,
	[CouponNo] [varchar](100) NULL,
	[CouponAmount] [float] NULL,
	[BalanceAmount] [float] NULL,
	[ChequeNo] [varchar](20) NULL,
	[BankName] [varchar](100) NULL,
	[ChequeAmount] [float] NULL,
	[ChequeDate] [date] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[Payment] [int] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_StockAmount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockSupplier]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NULL,
	[StockId] [int] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_StockSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Master]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NULL,
	[Total_Quantity] [decimal](7, 2) NULL,
	[Unit] [varchar](10) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[Status] [bit] NULL,
	[actual_qty] [decimal](7, 2) NULL,
	[actual_unit] [varchar](10) NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_MasterHistory]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_MasterHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NULL,
	[StockId] [int] NULL,
	[Total_Quantity] [decimal](7, 2) NULL,
	[Unit] [varchar](10) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuppliersMaster]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuppliersMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NULL,
	[SupplierId] [int] NULL,
	[EnteredDate] [date] NULL,
	[EnteredBy] [int] NULL,
	[Quantity] [decimal](7, 2) NULL,
	[Unit] [varchar](50) NULL,
	[RequestId] [int] NULL,
	[Received_Status] [varchar](20) NULL,
	[delivery_id] [int] NULL,
	[STORE_STATUS] [bit] NULL,
	[Store_EnteredBy] [int] NULL,
	[Store_EnteredDate] [datetime] NULL,
	[Actual_qty] [decimal](7, 2) NULL,
	[Actual_Unit] [varchar](10) NULL,
	[Amount] [float] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_SuppliersMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Targets]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Targets](
	[TargetID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Amt] [int] NULL,
	[Days] [int] NULL,
	[EnteredOn] [date] NULL,
	[Entered_By] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[Staff_Name] [int] NULL,
	[Effective_From] [date] NULL,
	[Active] [int] NULL,
	[IncentiveAmt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskUnit]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskUnit](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [varchar](50) NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AccountSummary]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AccountSummary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[OpeningBal] [decimal](10, 2) NULL,
	[RecievedCash] [decimal](10, 2) NULL,
	[ClosingBal] [decimal](10, 2) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[SalesCash] [decimal](10, 2) NULL,
	[Remarks] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_AccountSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PettyCash]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PettyCash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Particulars] [varchar](max) NULL,
	[BillNo] [varchar](50) NULL,
	[Amount] [decimal](10, 2) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[RelId] [int] NULL,
	[VoucherNo] [varchar](50) NULL,
	[Remarks] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_PettyCash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_stockdelivery]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stockdelivery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Request_Id] [int] NULL,
	[Supply_By] [varchar](100) NULL,
	[ConductNo] [varchar](30) NULL,
	[Received_By] [int] NULL,
	[Entered_By] [int] NULL,
	[Entered_Date] [datetime] NULL,
	[BillNo] [int] NULL,
	[Entered_Unit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_StockMaster]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_StockMaster](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[StockName] [varchar](150) NULL,
	[Cat_Id] [int] NULL,
	[CurrentSupplier] [int] NULL,
	[Is_Liquid] [bit] NULL,
	[Entered_Unit] [int] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[Price] [float] NULL,
	[Unit] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_StockMaster] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Suppliers]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[EmailId] [varchar](100) NULL,
	[Address] [varchar](500) NULL,
	[City] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[EnteredDate] [datetime] NULL,
	[Postalcode] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[EnteredBy] [int] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_Tbl_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAppsRegistration]    Script Date: 3/5/2019 8:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppsRegistration](
	[Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Device_Id] [varchar](500) NULL,
	[Staff_Id] [int] NULL,
	[Created_On] [datetime] NULL,
	[Status] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProcessSkill]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProcessSkill](
	[Process_Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_ID] [nvarchar](200) NULL,
	[Process_ID] [int] NULL,
	[Created_On] [datetime] NULL,
	[Created_Type] [varchar](10) NULL,
	[Created_By] [int] NULL,
 CONSTRAINT [PK_tblProcessSkill] PRIMARY KEY CLUSTERED 
(
	[Process_Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectProcessSkill]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectProcessSkill](
	[Project_Process_Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_ID] [nvarchar](200) NULL,
	[Project_Process_ID] [int] NULL,
	[Created_On] [datetime] NULL,
	[Created_Type] [varchar](10) NULL,
	[Created_By] [int] NULL,
 CONSTRAINT [PK_tblProjectProcessSkill] PRIMARY KEY CLUSTERED 
(
	[Project_Process_Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPush_Notification_Log]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPush_Notification_Log](
	[Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Created_On] [datetime] NULL,
	[Time_Sheet_Id] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotation]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](250) NULL,
	[CompanyName] [varchar](250) NULL,
	[Address] [varchar](500) NULL,
	[EmailID] [varchar](150) NULL,
	[PhoneNo] [varchar](50) NULL,
	[TotalInHouseCmpCost] [float] NULL,
	[TotalOutsourceCmpCost] [float] NULL,
	[TotalAddCostofCmp] [float] NULL,
	[TotalCmpCost] [float] NULL,
	[TotalAddCostofTask] [float] NULL,
	[TotalAddCostofLabour] [float] NULL,
	[TotalOnlyLabour] [float] NULL,
	[TotalLabourCost] [float] NULL,
	[TotalCostOfTask] [float] NULL,
	[TotalCostOFTaskPerSQFt] [float] NULL,
	[PerCompCost] [float] NULL,
	[PerLabourCost] [float] NULL,
	[TotalQouteRate] [float] NULL,
	[TotalQuoteRatePerSqFt] [float] NULL,
	[MaeketRateofTask] [float] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
 CONSTRAINT [PK_tblQuotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotationCustomTask]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotationCustomTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotationID] [int] NULL,
	[TaskName] [varchar](250) NULL,
	[PriceperUnit] [float] NULL,
	[Quantity] [float] NULL,
	[TotalPrice] [float] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[TotalInHouseCmpCost] [float] NULL,
	[TotalOutsourceCmpCost] [float] NULL,
	[TotalAddCostofCmp] [float] NULL,
	[TotalCmpCost] [float] NULL,
	[TotalAddCostofTask] [float] NULL,
	[TotalAddCostofLabour] [float] NULL,
	[TotalOnlyLabour] [float] NULL,
	[TotalLabourCost] [float] NULL,
	[TotalCostOfTask] [float] NULL,
	[TotalCostOFTaskPerSQFt] [float] NULL,
	[PerCompCost] [float] NULL,
	[PerLabourCost] [float] NULL,
	[TotalQouteRate] [float] NULL,
	[TotalQuoteRatePerSqFt] [float] NULL,
	[MaeketRateofTask] [float] NULL,
	[AmtPerManHour] [float] NULL,
	[NoOfManhours] [float] NULL,
	[TotalManHourAmt] [float] NULL,
 CONSTRAINT [PK_tblQuotationCustomTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotations]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuatationNo] [int] NULL,
	[ClientId] [int] NULL,
	[TaskId] [int] NULL,
	[NoOfManhour] [int] NULL,
	[AmountOfManhour] [decimal](10, 2) NULL,
	[EnterdBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
 CONSTRAINT [PK_tblQuotations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotationTask]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotationTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotationID] [int] NULL,
	[TaskId] [int] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[TotalDimension] [float] NULL,
	[AmtPerManHour] [float] NULL,
	[NoOfManhours] [float] NULL,
	[TotalManHourAmt] [float] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
	[TotalInHouseCmpCost] [float] NULL,
	[TotalOutsourceCmpCost] [float] NULL,
	[TotalAddCostofCmp] [float] NULL,
	[TotalCmpCost] [float] NULL,
	[TotalAddCostofTask] [float] NULL,
	[TotalAddCostofLabour] [float] NULL,
	[TotalOnlyLabour] [float] NULL,
	[TotalLabourCost] [float] NULL,
	[TotalCostOfTask] [float] NULL,
	[TotalCostOFTaskPerSQFt] [float] NULL,
	[PerCompCost] [float] NULL,
	[PerLabourCost] [float] NULL,
	[TotalQouteRate] [float] NULL,
	[TotalQuoteRatePerSqFt] [float] NULL,
	[MaeketRateofTask] [float] NULL,
	[Production] [bit] NULL,
 CONSTRAINT [PK_tblQuotationTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotationTaskItems]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotationTaskItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotationId] [int] NULL,
	[TaskId] [int] NULL,
	[ItemID] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [decimal](10, 2) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL,
 CONSTRAINT [PK_tblQuotationTaskItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkillTagMaster]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkillTagMaster](
	[Skill_Id] [int] IDENTITY(1,1) NOT NULL,
	[Skill_Detail] [nvarchar](200) NULL,
	[Created_On] [datetime] NULL,
	[Entered_By] [int] NULL,
	[Entered_Unit] [int] NULL,
 CONSTRAINT [PK_tblSkillMaster] PRIMARY KEY CLUSTERED 
(
	[Skill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaffSkill]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaffSkill](
	[Staff_Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_ID] [nvarchar](200) NULL,
	[Staff_ID] [int] NULL,
	[Created_On] [datetime] NULL,
	[Created_Type] [varchar](10) NULL,
	[Created_By] [int] NULL,
 CONSTRAINT [PK_tblStaffSkill] PRIMARY KEY CLUSTERED 
(
	[Staff_Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUploadDocumentLogs]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUploadDocumentLogs](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Downloaded_By] [int] NULL,
	[Downloaded_On] [datetime] NULL,
	[Document_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetProjectActivity]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetProjectActivity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeSheetID] [int] NULL,
	[Project_Name] [int] NULL,
	[Task_ID] [int] NULL,
	[EnteredOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportModes]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportModes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransportMode] [varchar](50) NULL,
	[PriceBand] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripPlans]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripPlans](
	[TripPlanID] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Id] [int] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Log_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Log_Master](
	[User_Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [varchar](50) NULL,
	[IP_Address] [varchar](50) NULL,
	[SignInTime] [datetime] NULL,
	[SignOutTime] [datetime] NULL,
	[AccessTime] [datetime] NULL,
	[User_Id] [int] NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[Location] [varchar](500) NULL,
	[DeviceID] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[VId] [int] IDENTITY(1,1) NOT NULL,
	[Amt] [decimal](18, 0) NULL,
	[Staff_Name] [int] NULL,
	[DisbursalDate] [datetime] NULL,
	[Mode] [nvarchar](50) NULL,
	[Entered_By] [int] NULL,
	[ManualVID] [int] NULL,
	[ID] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [Unique_Of_Att_Config]    Script Date: 3/5/2019 8:05:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Of_Att_Config] ON [dbo].[Attendance_Configuration]
(
	[Company_Unit_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Action_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Admin_Happy_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[AdvancesMaster] ADD  CONSTRAINT [DF_AdvancesRequest_Instalments]  DEFAULT ((1)) FOR [Instalments]
GO
ALTER TABLE [dbo].[AdvancesMaster] ADD  CONSTRAINT [DF_AdvancesMaster_DisbursalStats]  DEFAULT (N'n') FOR [DisbursalStats]
GO
ALTER TABLE [dbo].[campaignModes_Templates] ADD  CONSTRAINT [DF_campaignModes_Templates_ActionStats]  DEFAULT (N'n') FOR [ActionStats]
GO
ALTER TABLE [dbo].[campaignModes_Templates] ADD  CONSTRAINT [DF_campaignModes_Templates_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Check_List_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Check_List_Responsibilities] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Client_Master] ADD  CONSTRAINT [DF__Client_Ma__Enter__619B8048]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Company_Master] ADD  CONSTRAINT [DF__Company_M__Enter__59FA5E80]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Company_Unit_Master] ADD  CONSTRAINT [DF__Company_U__Enter__5AEE82B9]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Component_Entry] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[CRMInvoices] ADD  CONSTRAINT [DF_CRMInvoices_Added]  DEFAULT ((0)) FOR [Added]
GO
ALTER TABLE [dbo].[CRMInvoices] ADD  CONSTRAINT [DF_CRMInvoices_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Department_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Department_Master] ADD  CONSTRAINT [DF_Department_Master_Is_Field]  DEFAULT ((0)) FOR [Is_Field]
GO
ALTER TABLE [dbo].[Department_Master] ADD  CONSTRAINT [DF_Department_Master_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Department_Responsibility] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Designation_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[DModes] ADD  CONSTRAINT [DF_DModes_Field]  DEFAULT ((0)) FOR [Field]
GO
ALTER TABLE [dbo].[Enquiries] ADD  CONSTRAINT [DF_Enquiries_DMode]  DEFAULT ((0)) FOR [DMode]
GO
ALTER TABLE [dbo].[Enquiries] ADD  CONSTRAINT [DF_Enquiries_CMode]  DEFAULT ((0)) FOR [CMode]
GO
ALTER TABLE [dbo].[Enquiries] ADD  CONSTRAINT [DF_Enquiries_BMode]  DEFAULT ((0)) FOR [BMode]
GO
ALTER TABLE [dbo].[FieldStatusExceptions] ADD  CONSTRAINT [DF_FieldStatusExceptions_ExID]  DEFAULT ((0)) FOR [ExID]
GO
ALTER TABLE [dbo].[Holiday_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[LeadValues] ADD  CONSTRAINT [DF_LeadValues_Added]  DEFAULT (N'n') FOR [Added]
GO
ALTER TABLE [dbo].[Leave_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Module_Access_Rights] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Module_Master] ADD  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Module_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [Basic]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [HRA]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [Conveyance]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [Medical]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [CCA]
GO
ALTER TABLE [dbo].[Payslip_Master_History] ADD  DEFAULT ((0)) FOR [Traval]
GO
ALTER TABLE [dbo].[Process_Master] ADD  CONSTRAINT [DF__Process_M__Enter__5708E33C]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Process_Master] ADD  CONSTRAINT [DF__Process_M__Email__74994623]  DEFAULT ('etpoyyail@gmail.com') FOR [Email_Configuration]
GO
ALTER TABLE [dbo].[Process_Master] ADD  CONSTRAINT [DF_Process_Master_Project_Specific]  DEFAULT (N'n') FOR [Project_Specific]
GO
ALTER TABLE [dbo].[Process_Status_Mapping] ADD  CONSTRAINT [DF_Process_Status_Mapping_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Process_Status_Master] ADD  CONSTRAINT [DF_Process_Status_Master_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Process_Status_Master] ADD  CONSTRAINT [DF_Process_Status_Master_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF__Product_M__Enter__5708E33C]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF__Product_M__Email__74994623]  DEFAULT ('etpoyyail@gmail.com') FOR [Email_Configuration]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF_Product_Master_No_Of_Hours]  DEFAULT ((0)) FOR [No_Of_Hours]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF_Product_Master_No_Of_Minutes]  DEFAULT ((0)) FOR [No_Of_Minutes]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF_Product_Master_Project_Specific]  DEFAULT (N'n') FOR [Project_Specific]
GO
ALTER TABLE [dbo].[Project_Master] ADD  CONSTRAINT [DF__Project_M__Start__60A75C0F]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Project_Master] ADD  CONSTRAINT [DF__Project_M__End_D__619B8048]  DEFAULT (getdate()) FOR [End_Date]
GO
ALTER TABLE [dbo].[Project_Master] ADD  CONSTRAINT [DF__Project_M__Enter__628FA481]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Project_Master] ADD  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Project_Master] ADD  CONSTRAINT [DF_Project_Master_CRMCampaign]  DEFAULT (N'n') FOR [CRMCampaign]
GO
ALTER TABLE [dbo].[Project_Process_Master] ADD  CONSTRAINT [DF__Project_P__Enter__618671AF]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Project_Process_Master] ADD  CONSTRAINT [DF__Project_P__Email__758D6A5C]  DEFAULT ('etpoyyail@gmail.com') FOR [Email_Configuration]
GO
ALTER TABLE [dbo].[Project_Process_Master] ADD  CONSTRAINT [DF_Project_Process_Master_Project_Specific]  DEFAULT (N'n') FOR [Project_Specific]
GO
ALTER TABLE [dbo].[Project_Task_Master] ADD  CONSTRAINT [DF_Project_Task_Master_Mail]  DEFAULT ('n') FOR [MailStats]
GO
ALTER TABLE [dbo].[Purpose_Code_Master] ADD  CONSTRAINT [DF__Purpose_C__Enter__2B947552]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Purpose_Mapping] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Reporting_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Resource_Master] ADD  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Resource_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Passw__656C112C]  DEFAULT ('Admin@123') FOR [Password]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Gende__66603565]  DEFAULT ((1)) FOR [Gender]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Date___6754599E]  DEFAULT (getdate()) FOR [Date_of_Birth]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Enter__68487DD7]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Is_Ad__0C50D423]  DEFAULT ((0)) FOR [Is_Admin]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Emplo__2334397B]  DEFAULT ('ACTIVE') FOR [Employee_Status]
GO
ALTER TABLE [dbo].[Staff_Master] ADD  CONSTRAINT [DF__Staff_Mas__Is_Ma__7DCDAAA2]  DEFAULT ((0)) FOR [Is_MasterAdmin]
GO
ALTER TABLE [dbo].[StockCategory] ADD  DEFAULT (getdate()) FOR [EnteredDate]
GO
ALTER TABLE [dbo].[Sub_Module] ADD  CONSTRAINT [DF__Sub_Modul__Is_Ac__693CA210]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Sub_Module] ADD  CONSTRAINT [DF__Sub_Modul__Enter__6A30C649]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Sub_Product_Master] ADD  CONSTRAINT [DF__Sub_Produ__Enter__097F5470]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Sub_Task_Entry] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Sub_Task_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[SubCategory_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[SuppliersMaster] ADD  CONSTRAINT [DF__Suppliers__STORE__0B7CAB7B]  DEFAULT ((0)) FOR [STORE_STATUS]
GO
ALTER TABLE [dbo].[SuppliersMaster] ADD  DEFAULT (getdate()) FOR [Store_EnteredDate]
GO
ALTER TABLE [dbo].[Targets] ADD  CONSTRAINT [DF_Targets_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Task_Engineering_Status] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Task_Master] ADD  CONSTRAINT [DF__Task_Mast__Start__6C190EBB]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Task_Master] ADD  CONSTRAINT [DF__Task_Mast__Enter__6D0D32F4]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Task_Master] ADD  CONSTRAINT [DF_Task_Master_Replan]  DEFAULT (N'n') FOR [Replan]
GO
ALTER TABLE [dbo].[Task_Process_Entry] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[TaskCategory] ADD  CONSTRAINT [DF_TaskCategory_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[TaskCategory] ADD  CONSTRAINT [DF_TaskCategory_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TaskUnit] ADD  CONSTRAINT [DF_TaskUnit_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[TaskUnit] ADD  CONSTRAINT [DF_TaskUnit_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tbl_stockdelivery] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Tbl_StockMaster] ADD  CONSTRAINT [DF__Tbl_Stock__Is_Li__1A89E4E1]  DEFAULT ((0)) FOR [Is_Liquid]
GO
ALTER TABLE [dbo].[Tbl_StockMaster] ADD  CONSTRAINT [DF__Tbl_Stock__Enter__18A19C6F]  DEFAULT (getdate()) FOR [EnteredDate]
GO
ALTER TABLE [dbo].[tblAccessInfo] ADD  CONSTRAINT [DF_tblAccessInfo_Flag]  DEFAULT (N'y') FOR [Flag]
GO
ALTER TABLE [dbo].[tblAppsRegistration] ADD  CONSTRAINT [DF_tblAppsRegistration_Created_On]  DEFAULT (getdate()) FOR [Created_On]
GO
ALTER TABLE [dbo].[tblAppsRegistration] ADD  CONSTRAINT [DF_tblAppsRegistration_Status]  DEFAULT ('C') FOR [Status]
GO
ALTER TABLE [dbo].[tblCampaignLead] ADD  CONSTRAINT [DF_tblCampaignLead_Sub_Status]  DEFAULT ((0)) FOR [Sub_Status]
GO
ALTER TABLE [dbo].[tblCampaignLead] ADD  CONSTRAINT [DF_tblCampaignLead_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblFieldMoreStatusMaster] ADD  CONSTRAINT [DF_tblFieldMoreStatusMaster_NextStatus]  DEFAULT ((0)) FOR [NextStatus]
GO
ALTER TABLE [dbo].[tblLeadMaster] ADD  CONSTRAINT [DF_tblLeadMaster_Pincode]  DEFAULT ((0)) FOR [Pincode]
GO
ALTER TABLE [dbo].[tblLeadMaster] ADD  CONSTRAINT [DF_tblLeadMaster_Dealer]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[tblPush_Notification_Log] ADD  CONSTRAINT [DF_tblPush_Notification_Log_Created_On]  DEFAULT (getdate()) FOR [Created_On]
GO
ALTER TABLE [dbo].[tblPush_Notification_Log] ADD  CONSTRAINT [DF_tblPush_Notification_Log_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tblUploadDocument] ADD  CONSTRAINT [DF_tblUploadDocument_Uploaded_Type]  DEFAULT ('Direct') FOR [Uploaded_Type]
GO
ALTER TABLE [dbo].[tblUploadDocument] ADD  CONSTRAINT [DF_tblUploadDocument_Status]  DEFAULT ('C') FOR [Status]
GO
ALTER TABLE [dbo].[tblUploadDocumentLogs] ADD  CONSTRAINT [DF_tblUploadDocumentLogs_Downloaded_On]  DEFAULT (getdate()) FOR [Downloaded_On]
GO
ALTER TABLE [dbo].[Team_Master] ADD  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF__Time_Shee__Task___7F80E8EA]  DEFAULT (getdate()) FOR [Task_Date]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF__Time_Shee__Enter__00750D23]  DEFAULT (getdate()) FOR [Entered_Date]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF__Time_Shee__Modif__0169315C]  DEFAULT (getdate()) FOR [Modified_Date]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF_Time_Sheet_Master_IncludeStats]  DEFAULT (N'n') FOR [IncludeStats]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF_Time_Sheet_Master_ExecEntry]  DEFAULT ((0)) FOR [ExecEntry]
GO
ALTER TABLE [dbo].[Time_Sheet_Master] ADD  CONSTRAINT [DF_Time_Sheet_Master_Display]  DEFAULT ((0)) FOR [Display]
GO
ALTER TABLE [dbo].[TimeSheetExpenses] ADD  CONSTRAINT [DF_TimeSheetExpenses_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[Action_Master]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Action_Master]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Action_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Action_Ma__Enter__038683F8] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Action_Master] NOCHECK CONSTRAINT [FK__Action_Ma__Enter__038683F8]
GO
ALTER TABLE [dbo].[Actual_Resource_Working]  WITH NOCHECK ADD FOREIGN KEY([ProgressId])
REFERENCES [dbo].[Task_Process_Entry] ([Progress_Id])
GO
ALTER TABLE [dbo].[Actual_Resource_Working]  WITH NOCHECK ADD FOREIGN KEY([ProgressId])
REFERENCES [dbo].[Task_Process_Entry] ([Progress_Id])
GO
ALTER TABLE [dbo].[Actual_Resource_Working]  WITH NOCHECK ADD  CONSTRAINT [FK__Actual_Re__Staff__2B2A60FE] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Actual_Resource_Working] NOCHECK CONSTRAINT [FK__Actual_Re__Staff__2B2A60FE]
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Admin_Hap__Enter__3E723F9C] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master] NOCHECK CONSTRAINT [FK__Admin_Hap__Enter__3E723F9C]
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Happy_Status])
REFERENCES [dbo].[Happy_Status_Master] ([Status_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Happy_Status])
REFERENCES [dbo].[Happy_Status_Master] ([Status_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Admin_Hap__Staff__3C89F72A] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Admin_Happy_Master] NOCHECK CONSTRAINT [FK__Admin_Hap__Staff__3C89F72A]
GO
ALTER TABLE [dbo].[Attendance_Configuration]  WITH NOCHECK ADD  CONSTRAINT [FK__Attendanc__Compa__48EFCE0F] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Attendance_Configuration] NOCHECK CONSTRAINT [FK__Attendanc__Compa__48EFCE0F]
GO
ALTER TABLE [dbo].[Attendance_Configuration]  WITH NOCHECK ADD  CONSTRAINT [FK__Attendanc__Enter__1FEDB87C] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Attendance_Configuration] NOCHECK CONSTRAINT [FK__Attendanc__Enter__1FEDB87C]
GO
ALTER TABLE [dbo].[Attendance_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Attendanc__Enter__090A5324] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Attendance_Master] NOCHECK CONSTRAINT [FK__Attendanc__Enter__090A5324]
GO
ALTER TABLE [dbo].[Attendance_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Attendance_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Attendance_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Attendanc__Modif__09FE775D] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Attendance_Master] NOCHECK CONSTRAINT [FK__Attendanc__Modif__09FE775D]
GO
ALTER TABLE [dbo].[Attendance_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Attendanc__Staff__08162EEB] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Attendance_Master] NOCHECK CONSTRAINT [FK__Attendanc__Staff__08162EEB]
GO
ALTER TABLE [dbo].[Category_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Category_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Category_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Category_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Category_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Category___Enter__6EF57B66] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Category_Master] NOCHECK CONSTRAINT [FK__Category___Enter__6EF57B66]
GO
ALTER TABLE [dbo].[Check_List_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Check_List_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Check_Lis__Enter__33BFA6FF] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Check_List_Master] NOCHECK CONSTRAINT [FK__Check_Lis__Enter__33BFA6FF]
GO
ALTER TABLE [dbo].[Check_List_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD  CONSTRAINT [FK__Check_Lis__Enter__3F3159AB] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities] NOCHECK CONSTRAINT [FK__Check_Lis__Enter__3F3159AB]
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities]  WITH NOCHECK ADD  CONSTRAINT [FK__Check_Lis__Respo__3D491139] FOREIGN KEY([Responsible])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Check_List_Responsibilities] NOCHECK CONSTRAINT [FK__Check_Lis__Respo__3D491139]
GO
ALTER TABLE [dbo].[Client_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Client_Ma__Enter__5224328E] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Client_Master] NOCHECK CONSTRAINT [FK__Client_Ma__Enter__5224328E]
GO
ALTER TABLE [dbo].[Client_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Client_Ma__Enter__6FE99F9F] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Client_Master] NOCHECK CONSTRAINT [FK__Client_Ma__Enter__6FE99F9F]
GO
ALTER TABLE [dbo].[Company_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Company_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Company_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Company_M__Enter__70DDC3D8] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Company_Master] NOCHECK CONSTRAINT [FK__Company_M__Enter__70DDC3D8]
GO
ALTER TABLE [dbo].[Company_Unit_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Company_U__Compa__71D1E811] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Company_Unit_Master] NOCHECK CONSTRAINT [FK__Company_U__Compa__71D1E811]
GO
ALTER TABLE [dbo].[Company_Unit_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Company_U__Conta__72C60C4A] FOREIGN KEY([Contact_Person])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Company_Unit_Master] NOCHECK CONSTRAINT [FK__Company_U__Conta__72C60C4A]
GO
ALTER TABLE [dbo].[Company_Unit_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Company_Unit_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Company_Unit_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Company_U__Enter__73BA3083] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Company_Unit_Master] NOCHECK CONSTRAINT [FK__Company_U__Enter__73BA3083]
GO
ALTER TABLE [dbo].[Component_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit_Id])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Component_Entry]  WITH NOCHECK ADD  CONSTRAINT [FK__Component__Enter__52793849] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Component_Entry] NOCHECK CONSTRAINT [FK__Component__Enter__52793849]
GO
ALTER TABLE [dbo].[Component_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit_Id])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Department_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Department_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Departmen__Enter__74AE54BC] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Department_Master] NOCHECK CONSTRAINT [FK__Departmen__Enter__74AE54BC]
GO
ALTER TABLE [dbo].[Department_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Department_Responsibility]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Department_Responsibility]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Department_Responsibility]  WITH NOCHECK ADD  CONSTRAINT [FK__Departmen__Enter__6E8B6712] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Department_Responsibility] NOCHECK CONSTRAINT [FK__Departmen__Enter__6E8B6712]
GO
ALTER TABLE [dbo].[Department_Responsibility]  WITH NOCHECK ADD  CONSTRAINT [FK__Departmen__Staff__6F7F8B4B] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Department_Responsibility] NOCHECK CONSTRAINT [FK__Departmen__Staff__6F7F8B4B]
GO
ALTER TABLE [dbo].[Designation_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Designation_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Designati__Enter__75A278F5] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Designation_Master] NOCHECK CONSTRAINT [FK__Designati__Enter__75A278F5]
GO
ALTER TABLE [dbo].[Designation_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Category_Name])
REFERENCES [dbo].[Category_Master] ([Category_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Category_Name])
REFERENCES [dbo].[Category_Master] ([Category_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Document___Clien__2FCF1A8A] FOREIGN KEY([Client_Name])
REFERENCES [dbo].[Client_Master] ([Client_Id])
GO
ALTER TABLE [dbo].[Document_Master] NOCHECK CONSTRAINT [FK__Document___Clien__2FCF1A8A]
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Document_Type])
REFERENCES [dbo].[Document_Type_Master] ([Document_Type_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Document_Type])
REFERENCES [dbo].[Document_Type_Master] ([Document_Type_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Document___Enter__797309D9] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Document_Master] NOCHECK CONSTRAINT [FK__Document___Enter__797309D9]
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Document___Proje__7A672E12] FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Document_Master] NOCHECK CONSTRAINT [FK__Document___Proje__7A672E12]
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Sub_Category_Name])
REFERENCES [dbo].[SubCategory_Master] ([SubCategory_Id])
GO
ALTER TABLE [dbo].[Document_Master]  WITH NOCHECK ADD FOREIGN KEY([Sub_Category_Name])
REFERENCES [dbo].[SubCategory_Master] ([SubCategory_Id])
GO
ALTER TABLE [dbo].[Employee_Payslip_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Employee___Staff__06C2E356] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Employee_Payslip_Master] NOCHECK CONSTRAINT [FK__Employee___Staff__06C2E356]
GO
ALTER TABLE [dbo].[Employee_Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Employee_Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Happy_Mas__Enter__34E8D562] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Happy_Master] NOCHECK CONSTRAINT [FK__Happy_Mas__Enter__34E8D562]
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Happy_Status])
REFERENCES [dbo].[Happy_Status_Master] ([Status_Id])
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD FOREIGN KEY([Happy_Status])
REFERENCES [dbo].[Happy_Status_Master] ([Status_Id])
GO
ALTER TABLE [dbo].[Happy_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Happy_Mas__Staff__33008CF0] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Happy_Master] NOCHECK CONSTRAINT [FK__Happy_Mas__Staff__33008CF0]
GO
ALTER TABLE [dbo].[Happy_Status_Master]  WITH NOCHECK ADD FOREIGN KEY([Color_Code])
REFERENCES [dbo].[Color_Master] ([ColorCode])
GO
ALTER TABLE [dbo].[Happy_Status_Master]  WITH NOCHECK ADD FOREIGN KEY([Color_Code])
REFERENCES [dbo].[Color_Master] ([ColorCode])
GO
ALTER TABLE [dbo].[Happy_Status_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Happy_Sta__Enter__2B5F6B28] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Happy_Status_Master] NOCHECK CONSTRAINT [FK__Happy_Sta__Enter__2B5F6B28]
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Holiday_M__Enter__1209AD79] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Holiday_Master] NOCHECK CONSTRAINT [FK__Holiday_M__Enter__1209AD79]
GO
ALTER TABLE [dbo].[Holiday_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Leave_Mas__Appro__16644E42] FOREIGN KEY([Approve_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Leave_Master] NOCHECK CONSTRAINT [FK__Leave_Mas__Appro__16644E42]
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Leave_Mas__Enter__078C1F06] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Leave_Master] NOCHECK CONSTRAINT [FK__Leave_Mas__Enter__078C1F06]
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Leave_Mas__Staff__0697FACD] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Leave_Master] NOCHECK CONSTRAINT [FK__Leave_Mas__Staff__0697FACD]
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Team_Name])
REFERENCES [dbo].[Team_Master] ([Team_Id])
GO
ALTER TABLE [dbo].[Leave_Master]  WITH NOCHECK ADD FOREIGN KEY([Team_Name])
REFERENCES [dbo].[Team_Master] ([Team_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD  CONSTRAINT [FK__Module_Ac__Enter__640DD89F] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights] NOCHECK CONSTRAINT [FK__Module_Ac__Enter__640DD89F]
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Module_Name])
REFERENCES [dbo].[Module_Master] ([Module_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD FOREIGN KEY([Module_Name])
REFERENCES [dbo].[Module_Master] ([Module_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights]  WITH NOCHECK ADD  CONSTRAINT [FK__Module_Ac__Staff__66EA454A] FOREIGN KEY([Staff_Id])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Module_Access_Rights] NOCHECK CONSTRAINT [FK__Module_Ac__Staff__66EA454A]
GO
ALTER TABLE [dbo].[Module_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Module_Ma__Enter__00200768] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Module_Master] NOCHECK CONSTRAINT [FK__Module_Ma__Enter__00200768]
GO
ALTER TABLE [dbo].[Module_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Module_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Pay_Settings_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Pay_Settings_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Pay_Settings_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Pay_Settings_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Payslip_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Payslip_M__Staff__03E676AB] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Payslip_Master] NOCHECK CONSTRAINT [FK__Payslip_M__Staff__03E676AB]
GO
ALTER TABLE [dbo].[Payslip_Master_History]  WITH NOCHECK ADD  CONSTRAINT [FK__Payslip_M__Staff__5807F46D] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Payslip_Master_History] NOCHECK CONSTRAINT [FK__Payslip_M__Staff__5807F46D]
GO
ALTER TABLE [dbo].[Pending_Task_Mapping]  WITH NOCHECK ADD  CONSTRAINT [FK__Pending_T__Staff__1C1D2798] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Pending_Task_Mapping] NOCHECK CONSTRAINT [FK__Pending_T__Staff__1C1D2798]
GO
ALTER TABLE [dbo].[Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Process_M__Compa__542C7691] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Process_Master] NOCHECK CONSTRAINT [FK__Process_M__Compa__542C7691]
GO
ALTER TABLE [dbo].[Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Process_M__Compa__55209ACA] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Process_Master] NOCHECK CONSTRAINT [FK__Process_M__Compa__55209ACA]
GO
ALTER TABLE [dbo].[Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Process_M__Enter__5614BF03] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Process_Master] NOCHECK CONSTRAINT [FK__Process_M__Enter__5614BF03]
GO
ALTER TABLE [dbo].[Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Process_M__Enter__57FD0775] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Process_Master] NOCHECK CONSTRAINT [FK__Process_M__Enter__57FD0775]
GO
ALTER TABLE [dbo].[Process_Points]  WITH NOCHECK ADD  CONSTRAINT [FK__Process_P__Proce__41D8BC2C] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[Process_Master] ([Process_Id])
GO
ALTER TABLE [dbo].[Process_Points] NOCHECK CONSTRAINT [FK__Process_P__Proce__41D8BC2C]
GO
ALTER TABLE [dbo].[Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Product_M__Compa__542C7691] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Product_Master] NOCHECK CONSTRAINT [FK__Product_M__Compa__542C7691]
GO
ALTER TABLE [dbo].[Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Product_M__Compa__55209ACA] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Product_Master] NOCHECK CONSTRAINT [FK__Product_M__Compa__55209ACA]
GO
ALTER TABLE [dbo].[Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Product_M__Enter__5614BF03] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Product_Master] NOCHECK CONSTRAINT [FK__Product_M__Enter__5614BF03]
GO
ALTER TABLE [dbo].[Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Product_M__Enter__57FD0775] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Product_Master] NOCHECK CONSTRAINT [FK__Product_M__Enter__57FD0775]
GO
ALTER TABLE [dbo].[Project_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_M__Clien__01142BA1] FOREIGN KEY([Client_Name])
REFERENCES [dbo].[Client_Master] ([Client_Id])
GO
ALTER TABLE [dbo].[Project_Master] NOCHECK CONSTRAINT [FK__Project_M__Clien__01142BA1]
GO
ALTER TABLE [dbo].[Project_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_M__Enter__02084FDA] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Project_Master] NOCHECK CONSTRAINT [FK__Project_M__Enter__02084FDA]
GO
ALTER TABLE [dbo].[Project_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Project_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Project_Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_P__Compa__5DB5E0CB] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Project_Process_Master] NOCHECK CONSTRAINT [FK__Project_P__Compa__5DB5E0CB]
GO
ALTER TABLE [dbo].[Project_Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_P__Compa__5EAA0504] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Project_Process_Master] NOCHECK CONSTRAINT [FK__Project_P__Compa__5EAA0504]
GO
ALTER TABLE [dbo].[Project_Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_P__Enter__627A95E8] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Project_Process_Master] NOCHECK CONSTRAINT [FK__Project_P__Enter__627A95E8]
GO
ALTER TABLE [dbo].[Project_Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_P__Proce__60924D76] FOREIGN KEY([Process_Name])
REFERENCES [dbo].[Process_Master] ([Process_Id])
GO
ALTER TABLE [dbo].[Project_Process_Master] NOCHECK CONSTRAINT [FK__Project_P__Proce__60924D76]
GO
ALTER TABLE [dbo].[Project_Process_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_P__Proje__5F9E293D] FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Project_Process_Master] NOCHECK CONSTRAINT [FK__Project_P__Proje__5F9E293D]
GO
ALTER TABLE [dbo].[Project_Resource_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_R__Staff__6EE06CCD] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Project_Resource_Master] NOCHECK CONSTRAINT [FK__Project_R__Staff__6EE06CCD]
GO
ALTER TABLE [dbo].[Project_Resource_Master]  WITH NOCHECK ADD FOREIGN KEY([Task_Name])
REFERENCES [dbo].[Project_Task_Master] ([Task_Id])
GO
ALTER TABLE [dbo].[Project_Resource_Master]  WITH NOCHECK ADD FOREIGN KEY([Task_Name])
REFERENCES [dbo].[Project_Task_Master] ([Task_Id])
GO
ALTER TABLE [dbo].[Project_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Sub_Task_Id])
REFERENCES [dbo].[Sub_Task_Master] ([Process_Task_Id])
GO
ALTER TABLE [dbo].[Project_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Sub_Task_Id])
REFERENCES [dbo].[Sub_Task_Master] ([Process_Task_Id])
GO
ALTER TABLE [dbo].[Purpose_Code_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Purpose_C__Enter__2AA05119] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Purpose_Code_Master] NOCHECK CONSTRAINT [FK__Purpose_C__Enter__2AA05119]
GO
ALTER TABLE [dbo].[Purpose_Mapping]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Purpose_Mapping]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Purpose_Mapping]  WITH NOCHECK ADD  CONSTRAINT [FK__Purpose_M__Enter__324172E1] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Purpose_Mapping] NOCHECK CONSTRAINT [FK__Purpose_M__Enter__324172E1]
GO
ALTER TABLE [dbo].[Purpose_Mapping]  WITH NOCHECK ADD  CONSTRAINT [FK__Purpose_M__Purpo__30592A6F] FOREIGN KEY([Purpose_Code_Name])
REFERENCES [dbo].[Purpose_Code_Master] ([Purpose_Code_Id])
GO
ALTER TABLE [dbo].[Purpose_Mapping] NOCHECK CONSTRAINT [FK__Purpose_M__Purpo__30592A6F]
GO
ALTER TABLE [dbo].[Reporting_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Reporting_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Reporting_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Reporting__Enter__7814D14C] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Reporting_Master] NOCHECK CONSTRAINT [FK__Reporting__Enter__7814D14C]
GO
ALTER TABLE [dbo].[Reporting_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Reporting__Repor__7908F585] FOREIGN KEY([Reporting_Staff])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Reporting_Master] NOCHECK CONSTRAINT [FK__Reporting__Repor__7908F585]
GO
ALTER TABLE [dbo].[Reporting_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Reporting__Respo__79FD19BE] FOREIGN KEY([Responsible_Staff])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Reporting_Master] NOCHECK CONSTRAINT [FK__Reporting__Respo__79FD19BE]
GO
ALTER TABLE [dbo].[Resource_Allocation_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Resource___Staff__503BEA1C] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Resource_Allocation_Master] NOCHECK CONSTRAINT [FK__Resource___Staff__503BEA1C]
GO
ALTER TABLE [dbo].[Resource_Allocation_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Resource___Task___51300E55] FOREIGN KEY([Task_Name])
REFERENCES [dbo].[Task_Master] ([Task_Id])
GO
ALTER TABLE [dbo].[Resource_Allocation_Master] NOCHECK CONSTRAINT [FK__Resource___Task___51300E55]
GO
ALTER TABLE [dbo].[Resource_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Resource___Enter__02FC7413] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Resource_Master] NOCHECK CONSTRAINT [FK__Resource___Enter__02FC7413]
GO
ALTER TABLE [dbo].[Resource_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Resource_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Resource_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Resource___Proje__03F0984C] FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Resource_Master] NOCHECK CONSTRAINT [FK__Resource___Proje__03F0984C]
GO
ALTER TABLE [dbo].[Resource_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Resource___Staff__04E4BC85] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Resource_Master] NOCHECK CONSTRAINT [FK__Resource___Staff__04E4BC85]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Compa__05D8E0BE] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Compa__05D8E0BE]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Compa__40058253] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Compa__40058253]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Depar__06CD04F7] FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Depar__06CD04F7]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Desig__07C12930] FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Desig__07C12930]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Enter__08B54D69] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Enter__08B54D69]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Enter__44CA3770] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Enter__44CA3770]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Gende__09A971A2] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender_Master] ([Gender_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Gende__09A971A2]
GO
ALTER TABLE [dbo].[Staff_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Staff_Mas__Team___0A9D95DB] FOREIGN KEY([Team_Name])
REFERENCES [dbo].[Team_Master] ([Team_Id])
GO
ALTER TABLE [dbo].[Staff_Master] NOCHECK CONSTRAINT [FK__Staff_Mas__Team___0A9D95DB]
GO
ALTER TABLE [dbo].[StockAmount]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockAmount]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockCategory]  WITH NOCHECK ADD  CONSTRAINT [FK__StockCate__Enter__11F49EE0] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[StockCategory] NOCHECK CONSTRAINT [FK__StockCate__Enter__11F49EE0]
GO
ALTER TABLE [dbo].[StockCategory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockCategory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockSupplier]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockSupplier]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[StockSupplier]  WITH NOCHECK ADD  CONSTRAINT [FK_StockMaster_StockSupplier] FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[StockSupplier] NOCHECK CONSTRAINT [FK_StockMaster_StockSupplier]
GO
ALTER TABLE [dbo].[StockSupplier]  WITH NOCHECK ADD  CONSTRAINT [FK_StockSupplier_Tbl_SupplierMaster] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Tbl_Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[StockSupplier] NOCHECK CONSTRAINT [FK_StockSupplier_Tbl_SupplierMaster]
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Store_Mas__Enter__3BEAD8AC] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Store_Master] NOCHECK CONSTRAINT [FK__Store_Mas__Enter__3BEAD8AC]
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Store_Mas__Enter__64ECEE3F] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Store_Master] NOCHECK CONSTRAINT [FK__Store_Mas__Enter__64ECEE3F]
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_Master]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__Store_Mas__Enter__457442E6] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory] NOCHECK CONSTRAINT [FK__Store_Mas__Enter__457442E6]
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__Store_Mas__Enter__6C8E1007] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory] NOCHECK CONSTRAINT [FK__Store_Mas__Enter__6C8E1007]
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store_Master] ([Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store_Master] ([Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store_Master] ([Id])
GO
ALTER TABLE [dbo].[Store_MasterHistory]  WITH NOCHECK ADD FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store_Master] ([Id])
GO
ALTER TABLE [dbo].[Sub_Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Produ__Compa__0A7378A9] FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Sub_Product_Master] NOCHECK CONSTRAINT [FK__Sub_Produ__Compa__0A7378A9]
GO
ALTER TABLE [dbo].[Sub_Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Produ__Compa__0B679CE2] FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Sub_Product_Master] NOCHECK CONSTRAINT [FK__Sub_Produ__Compa__0B679CE2]
GO
ALTER TABLE [dbo].[Sub_Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Produ__Enter__0C5BC11B] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Sub_Product_Master] NOCHECK CONSTRAINT [FK__Sub_Produ__Enter__0C5BC11B]
GO
ALTER TABLE [dbo].[Sub_Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Produ__Paren__0D4FE554] FOREIGN KEY([Parent_SubTaskId])
REFERENCES [dbo].[Sub_Product_Master] ([Product_Task_Id])
GO
ALTER TABLE [dbo].[Sub_Product_Master] NOCHECK CONSTRAINT [FK__Sub_Produ__Paren__0D4FE554]
GO
ALTER TABLE [dbo].[Sub_Product_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Produ__Proje__0E44098D] FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Sub_Product_Master] NOCHECK CONSTRAINT [FK__Sub_Produ__Proje__0E44098D]
GO
ALTER TABLE [dbo].[Sub_Task_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Entry]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Task___Enter__6C390A4C] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Entry] NOCHECK CONSTRAINT [FK__Sub_Task___Enter__6C390A4C]
GO
ALTER TABLE [dbo].[Sub_Task_Entry]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Sub_Task_Entry]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Name])
REFERENCES [dbo].[Company_Master] ([Company_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Company_Unit_Name])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Task___Enter__0B7CAB7B] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master] NOCHECK CONSTRAINT [FK__Sub_Task___Enter__0B7CAB7B]
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Parent_SubTaskId])
REFERENCES [dbo].[Sub_Task_Master] ([Process_Task_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Parent_SubTaskId])
REFERENCES [dbo].[Sub_Task_Master] ([Process_Task_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Sub_Task___Proce__0A888742] FOREIGN KEY([Process_Name])
REFERENCES [dbo].[Process_Master] ([Process_Id])
GO
ALTER TABLE [dbo].[Sub_Task_Master] NOCHECK CONSTRAINT [FK__Sub_Task___Proce__0A888742]
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Sub_Task_Master]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH NOCHECK ADD FOREIGN KEY([Category_Name])
REFERENCES [dbo].[Category_Master] ([Category_Id])
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH NOCHECK ADD FOREIGN KEY([Category_Name])
REFERENCES [dbo].[Category_Master] ([Category_Id])
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__SubCatego__Enter__0E6E26BF] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[SubCategory_Master] NOCHECK CONSTRAINT [FK__SubCatego__Enter__0E6E26BF]
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([delivery_id])
REFERENCES [dbo].[tbl_stockdelivery] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([delivery_id])
REFERENCES [dbo].[tbl_stockdelivery] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([delivery_id])
REFERENCES [dbo].[tbl_stockdelivery] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([delivery_id])
REFERENCES [dbo].[tbl_stockdelivery] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD  CONSTRAINT [FK__Suppliers__Store__2BB470E3] FOREIGN KEY([Store_EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster] NOCHECK CONSTRAINT [FK__Suppliers__Store__2BB470E3]
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD  CONSTRAINT [FK__Suppliers__Store__5D4BCC77] FOREIGN KEY([Store_EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster] NOCHECK CONSTRAINT [FK__Suppliers__Store__5D4BCC77]
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD  CONSTRAINT [FK_Staff_Table_1] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[SuppliersMaster] NOCHECK CONSTRAINT [FK_Staff_Table_1]
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD  CONSTRAINT [FK_Stock_Table_1] FOREIGN KEY([StockId])
REFERENCES [dbo].[Tbl_StockMaster] ([StockID])
GO
ALTER TABLE [dbo].[SuppliersMaster] NOCHECK CONSTRAINT [FK_Stock_Table_1]
GO
ALTER TABLE [dbo].[SuppliersMaster]  WITH NOCHECK ADD  CONSTRAINT [FK_Supplier_Table_1] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Tbl_Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SuppliersMaster] NOCHECK CONSTRAINT [FK_Supplier_Table_1]
GO
ALTER TABLE [dbo].[Task_Engineering_Status]  WITH NOCHECK ADD FOREIGN KEY([Color_Code])
REFERENCES [dbo].[Color_Master] ([ColorCode])
GO
ALTER TABLE [dbo].[Task_Engineering_Status]  WITH NOCHECK ADD FOREIGN KEY([Color_Code])
REFERENCES [dbo].[Color_Master] ([ColorCode])
GO
ALTER TABLE [dbo].[Task_Engineering_Status]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Engi__Enter__153B1FDF] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Task_Engineering_Status] NOCHECK CONSTRAINT [FK__Task_Engi__Enter__153B1FDF]
GO
ALTER TABLE [dbo].[Task_Engineering_Status]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Task_Engineering_Status]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Task_Mapping]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Task_Mapping]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Depar__2704CA5F] FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Depar__2704CA5F]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Desig__28ED12D1] FOREIGN KEY([Designation_Name])
REFERENCES [dbo].[Designation_Master] ([Designation_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Desig__28ED12D1]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Enter__0F624AF8] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Enter__0F624AF8]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Enter__5AB9788F] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Enter__5AB9788F]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Paren__71BCD978] FOREIGN KEY([Parent_TaskId])
REFERENCES [dbo].[Project_Task_Master] ([Task_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Paren__71BCD978]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Proce__70C8B53F] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[Process_Master] ([Process_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Proce__70C8B53F]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Proje__10566F31] FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Proje__10566F31]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Resou__114A936A] FOREIGN KEY([Resource])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Resou__114A936A]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Sub_T__1ABEEF0B] FOREIGN KEY([Sub_Task_Id])
REFERENCES [dbo].[Sub_Task_Master] ([Process_Task_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Sub_T__1ABEEF0B]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Task___123EB7A3] FOREIGN KEY([Task_Status])
REFERENCES [dbo].[Task_Status_Master] ([Status_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Task___123EB7A3]
GO
ALTER TABLE [dbo].[Task_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Mast__Team___27F8EE98] FOREIGN KEY([Team_Name])
REFERENCES [dbo].[Team_Master] ([Team_Id])
GO
ALTER TABLE [dbo].[Task_Master] NOCHECK CONSTRAINT [FK__Task_Mast__Team___27F8EE98]
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Component_Name])
REFERENCES [dbo].[Component_Entry] ([Component_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Component_Name])
REFERENCES [dbo].[Component_Entry] ([Component_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Proc__Enter__1BE81D6E] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry] NOCHECK CONSTRAINT [FK__Task_Proc__Enter__1BE81D6E]
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Project_Name])
REFERENCES [dbo].[Project_Master] ([ProjectId])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Proc__Staff__1EC48A19] FOREIGN KEY([Staff_Name])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry] NOCHECK CONSTRAINT [FK__Task_Proc__Staff__1EC48A19]
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Sub_Task_Name])
REFERENCES [dbo].[Sub_Task_Entry] ([Sub_Task_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Sub_Task_Name])
REFERENCES [dbo].[Sub_Task_Entry] ([Sub_Task_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Task_Status])
REFERENCES [dbo].[Task_Engineering_Status] ([Status_Value])
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD  CONSTRAINT [FK__Task_Proc__Task___20ACD28B] FOREIGN KEY([Task_Name])
REFERENCES [dbo].[Task_Master] ([Task_Id])
GO
ALTER TABLE [dbo].[Task_Process_Entry] NOCHECK CONSTRAINT [FK__Task_Proc__Task___20ACD28B]
GO
ALTER TABLE [dbo].[Task_Process_Entry]  WITH NOCHECK ADD FOREIGN KEY([Task_Status])
REFERENCES [dbo].[Task_Engineering_Status] ([Status_Value])
GO
ALTER TABLE [dbo].[Tbl_AccountSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_AccountSummary_Tbl_StaffMaster] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_AccountSummary] NOCHECK CONSTRAINT [FK_Tbl_AccountSummary_Tbl_StaffMaster]
GO
ALTER TABLE [dbo].[Tbl_PettyCash]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PettyCash_Tbl_AccountSummary] FOREIGN KEY([RelId])
REFERENCES [dbo].[Tbl_AccountSummary] ([Id])
GO
ALTER TABLE [dbo].[Tbl_PettyCash] NOCHECK CONSTRAINT [FK_Tbl_PettyCash_Tbl_AccountSummary]
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD  CONSTRAINT [FK__tbl_stock__Enter__231F2AE2] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery] NOCHECK CONSTRAINT [FK__tbl_stock__Enter__231F2AE2]
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD  CONSTRAINT [FK__tbl_stock__Enter__5792F321] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery] NOCHECK CONSTRAINT [FK__tbl_stock__Enter__5792F321]
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD  CONSTRAINT [FK__tbl_stock__Recei__24134F1B] FOREIGN KEY([Received_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery] NOCHECK CONSTRAINT [FK__tbl_stock__Recei__24134F1B]
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD  CONSTRAINT [FK__tbl_stock__Recei__5887175A] FOREIGN KEY([Received_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery] NOCHECK CONSTRAINT [FK__tbl_stock__Recei__5887175A]
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[tbl_stockdelivery]  WITH NOCHECK ADD FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Tbl_SupplierRequest] ([Id])
GO
ALTER TABLE [dbo].[Tbl_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Stock__Cat_I__15C52FC4] FOREIGN KEY([Cat_Id])
REFERENCES [dbo].[StockCategory] ([Id])
GO
ALTER TABLE [dbo].[Tbl_StockMaster] CHECK CONSTRAINT [FK__Tbl_Stock__Cat_I__15C52FC4]
GO
ALTER TABLE [dbo].[Tbl_StockMaster]  WITH NOCHECK ADD FOREIGN KEY([CurrentSupplier])
REFERENCES [dbo].[Tbl_Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Tbl_StockMaster]  WITH NOCHECK ADD FOREIGN KEY([CurrentSupplier])
REFERENCES [dbo].[Tbl_Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Tbl_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Stock__Enter__16B953FD] FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Tbl_StockMaster] CHECK CONSTRAINT [FK__Tbl_Stock__Enter__16B953FD]
GO
ALTER TABLE [dbo].[Tbl_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Stock__Enter__17AD7836] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_StockMaster] CHECK CONSTRAINT [FK__Tbl_Stock__Enter__17AD7836]
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest]  WITH NOCHECK ADD  CONSTRAINT [FK__Tbl_Suppl__Appro__1E5A75C5] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest] NOCHECK CONSTRAINT [FK__Tbl_Suppl__Appro__1E5A75C5]
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest]  WITH NOCHECK ADD  CONSTRAINT [FK__Tbl_Suppl__Appro__55AAAAAF] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest] NOCHECK CONSTRAINT [FK__Tbl_Suppl__Appro__55AAAAAF]
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_SupplierRequest_Tbl_StaffMaster] FOREIGN KEY([EneteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_SupplierRequest] NOCHECK CONSTRAINT [FK_Tbl_SupplierRequest_Tbl_StaffMaster]
GO
ALTER TABLE [dbo].[Tbl_Suppliers]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Tbl_Suppliers]  WITH NOCHECK ADD  CONSTRAINT [FK__Tbl_Suppl__Enter__52CE3E04] FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Tbl_Suppliers] NOCHECK CONSTRAINT [FK__Tbl_Suppl__Enter__52CE3E04]
GO
ALTER TABLE [dbo].[Tbl_Suppliers]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Team_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Team_Master]  WITH NOCHECK ADD FOREIGN KEY([Department_Name])
REFERENCES [dbo].[Department_Master] ([Department_Id])
GO
ALTER TABLE [dbo].[Team_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__Team_Mast__Enter__14270015] FOREIGN KEY([Entered_By])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[Team_Master] NOCHECK CONSTRAINT [FK__Team_Mast__Enter__14270015]
GO
ALTER TABLE [dbo].[Team_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[Team_Master]  WITH NOCHECK ADD FOREIGN KEY([Entered_Unit])
REFERENCES [dbo].[Company_Unit_Master] ([Unit_Id])
GO
ALTER TABLE [dbo].[User_Log_Master]  WITH NOCHECK ADD  CONSTRAINT [FK__User_Log___User___1293BD5E] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Staff_Master] ([Staff_Id])
GO
ALTER TABLE [dbo].[User_Log_Master] NOCHECK CONSTRAINT [FK__User_Log___User___1293BD5E]
GO
/****** Object:  StoredProcedure [dbo].[AdvancesApproval1]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AdvancesApproval1]



@Advance_Id int,



@Advance_Approve VARCHAR(20),



@Approved_By int,



@Approval_remarks NVARCHAR(MAX),



@Advance_Amount int,

@ApprovalUnitID int



as

BEGIN

update AdvancesMaster set ApprovalStats=@Advance_Approve, Approval_Remarks=@Approval_remarks, Approved_By=@Approved_By, ApprovalDate=GETDATE(), Amount=@Advance_Amount, ApprovalUnit=@ApprovalUnitID where ID=@Advance_Id

END
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AuthenticateUser]
                @StaffName nvarchar(50),
                @PassWord nvarchar(50)
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
 
    -- Insert statements for procedure here
                SELECT Staff_Id from Staff_Master where Staff_Name=@StaffName and Password=@PassWord
END
 
GO
/****** Object:  StoredProcedure [dbo].[ChangeMailStats]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[ChangeMailStats]
@Task_Id int
as
update Project_Task_Master set MailStats = 'y' where Task_Id = @Task_ID
GO
/****** Object:  StoredProcedure [dbo].[CheckTaskExists]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CheckTaskExists]
@Task_ID Int

as 

Select * from Project_Task_Master where MailStats='n' and Task_Id = @Task_ID
GO
/****** Object:  StoredProcedure [dbo].[EndLocationUpdate]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[EndLocationUpdate]

               @StaffId int,
			  
			   @Remarks nvarchar(max),
			   @Location nvarchar(500)

			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

				Declare  @PurposeId int
    -- Insert statements for procedure here
 
             
			  update Time_Sheet_Master set  End_Location = @Location , Remarks = @Remarks where Staff_Name = @StaffId and Status = 3 and Location = 'no location found'
			  
			 
			 
			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[getall]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================



-- Author:		<Author,,Name>



-- Create date: <Create Date,,>



-- Description:	<Description,,>



-- =============================================



CREATE PROCEDURE [dbo].[getall] 



	



AS



BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from



	-- interfering with SELECT statements.



	SET NOCOUNT ON;







    -- Insert statements for procedure here



	

select * from Location_Log_Master where staff_id=4605 and (CAST(TimeStamp AS DATE) = CAST(GetDate() - 2 AS DATE))



END 



GO
/****** Object:  StoredProcedure [dbo].[GetCurrentAttendancedata]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentAttendancedata]
               @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;



			  select * from Attendance_Master where Staff_Name = @StaffId and Attendance_Date = CAST(GetDate() AS DATE)
			

			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentRemark]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCurrentRemark] 
	-- Add the parameters for the stored procedure here
	@TimeSheetID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Remarks from Time_Sheet_Master where Time_Sheet_Id = @TimeSheetID
END

GO
/****** Object:  StoredProcedure [dbo].[GetFirstLatLng]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFirstLatLng]
                @TaskDateStart datetime,
				 @TaskDateEnd datetime,
               @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Top 1* from Location_Log_Master where Staff_Id = @StaffId and TimeStamp Between  @TaskDateStart and @TaskDateEnd order by TimeStamp 

    
			 
			  end

			 
			  
			  
		



 
GO
/****** Object:  StoredProcedure [dbo].[GetLastLatLng]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastLatLng]
                @TaskDateStart datetime,
				 @TaskDateEnd datetime,
               @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Top 1* from Location_Log_Master where Staff_Id = @StaffId and TimeStamp Between  @TaskDateStart and @TaskDateEnd order by TimeStamp desc

    
			 
			  end

			 
			  
			  
		



 
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLocations] 
@StaffID int,
@FilterDate datetime,
@TimeSheetID int=0,
@TTId int=0
AS
BEGIN
	SET NOCOUNT ON;

IF  @TimeSheetID = 0 and @TTId =0
	begin

select * from Location_Log_Master where Staff_Id=@StaffID and (CAST(TimeStamp AS DATE) = CAST(@FilterDate AS DATE))  order by TimeStamp asc
END 

If @TimeSheetID <>0 
begin
declare @StartDate datetime, @EndDate datetime
select @StartDate = Modified_Date, @EndDate =(Cast(Task_Date as datetime)) +End_Time  from Time_Sheet_Master where Time_Sheet_Id=@TimeSheetID
select * from Location_Log_Master where Staff_Id=@StaffID and TimeStamp between @StartDate and @EndDate  order by TimeStamp asc
end
If @TTId <> 0
begin
declare @StartDate2 datetime, @EndDate2 datetime
select @StartDate2 =(Cast(TaskDate as datetime))+StartTime, @EndDate2 =(Cast(EndDate as datetime))+EndTime  from TimeSheetTracking where TTId=@TTId
select * from Location_Log_Master where Staff_Id=@StaffID and TimeStamp between @StartDate2 and @EndDate2 order by TimeStamp asc
end
end







GO
/****** Object:  StoredProcedure [dbo].[GetLocations2]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetLocations2] 

@StaffID int,

@FilterDate datetime,

@TimeSheetID int=0,

@TTId int=0

	



AS



BEGIN


	SET NOCOUNT ON;


IF  @TimeSheetID = 0
	begin



select * from Location_Log_Master where Staff_Id=@StaffID and (CAST(TimeStamp AS DATE) = CAST(@FilterDate AS DATE))



END 



If @TimeSheetID <>0

begin

declare @StartDate datetime, @EndDate datetime

select @StartDate =(Cast(Task_Date as datetime))+Start_Time, @EndDate =(Cast(Task_Date as datetime)) +End_Time  from Time_Sheet_Master where Time_Sheet_Id=@TimeSheetID

select * from Location_Log_Master where Staff_Id=@StaffID and TimeStamp between @StartDate and @EndDate

end

If @TTId <> 0

begin

declare @StartDate2 datetime, @EndDate2 datetime

select @StartDate2 =(Cast(TaskDate as datetime))+StartTime, @EndDate2 =(Cast(EndDate as datetime)) +
EndTime  from TimeSheetTracking where TTId=@TTId

select * from Location_Log_Master where Staff_Id=@StaffID and TimeStamp between @StartDate2 and @EndDate2

end

end
GO
/****** Object:  StoredProcedure [dbo].[GetPourposeCodeMaster]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPourposeCodeMaster]
               @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
 Declare @CompanyID int, @UnitId int
    -- Insert statements for procedure here
 
              Select @CompanyID =Company_Name,@UnitId =Company_Unit_Name from Staff_Master where Staff_Id = @StaffId

			  select * from Purpose_Code_Master T1 where CompanyName = @CompanyID and CompanyUnitID= @UnitId

			
			

			  end

		



 
GO
/****** Object:  StoredProcedure [dbo].[GetStaffName]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStaffName] 
	-- Add the parameters for the stored procedure here
	@StaffID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Staff_Name from Staff_Master where Staff_Id = @StaffID
END

GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetRunning]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTimeSheetRunning]
               @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
 
    -- Insert statements for procedure here
 
              ---Select @CompanyID =Company_Name,@UnitId =Company_Unit_Name from Staff_Master where Staff_Id = @StaffId

			  select * from Time_Sheet_Master where Staff_Name = @StaffId and Status= 2 and Purpose_Name is  not null

			
			

			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[InsertUserLogDetails]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserLogDetails]
               
                @DeviceId nvarchar(500),
                @StaffId int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
 
    -- Insert statements for procedure here
 
                Insert into User_Log_Master (AccessTime,User_Id, DeviceID) values(GetDate(),@StaffId, @DeviceId)
END
GO
/****** Object:  StoredProcedure [dbo].[LocationUpdate]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LocationUpdate]

               @StaffId int,
			  @Remarks nvarchar(max),
			  
			   @Location nvarchar(500)

			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

 
              update Time_Sheet_Master set  Location = @Location, Remarks=@Remarks where Staff_Name = @StaffId and Status = 2 and Location = 'no location found'
			 
			  
			 
			 
			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[ReplanProcessTasks]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReplanProcessTasks]

@ProjectName int
as
delete from Project_Task_Master where Project_name= @ProjectName

delete from Resource_Allocation_Master where Task_Name in (select task_Id from task_master where Project_Name =@ProjectName)

delete from Time_Sheet_Master where Task_Id in (select task_Id from Task_Master where Project_Name=@ProjectName)

delete from task_Master where Project_Name=@ProjectName
GO
/****** Object:  StoredProcedure [dbo].[Resource_List]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Resource_List]  
@Task_Id INT
As  
Begin  

 SELECT  c.Staff_Name  FROM Project_Resource_Master  b
 INNER JOIN Staff_Master c ON c.Staff_Id = b.Staff_Name  
 WHERE Task_Name= @Task_Id
 END
GO
/****** Object:  StoredProcedure [dbo].[SetAttendanceInsert]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetAttendanceInsert]
               @StaffId int,
			   @In_Time time(7),
			   @Out_Time time(7),
			   @SignIn_Location varchar(500),
			   @Remarks varchar(1000),
			   @DeviceId nvarchar(50)
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
 Declare @InTime time, @OutTime time
    -- Insert statements for procedure here
 
              ---Select @CompanyID =Company_Name,@UnitId =Company_Unit_Name from Staff_Master where Staff_Id = @StaffId

			  select @InTime =  In_Time,@OutTime = Out_Time from Attendance_Master where Staff_Name = @StaffId and Attendance_Date = CAST(GetDate() AS DATE)
			  If @InTime Is null and @OutTime is null
			  begin
			  Insert into Attendance_Master (Attendance_Date, In_Time, Staff_Name,SignIn_Location,Remarks, DeviceId) values(CAST(GetDate() AS DATE),@In_Time,@StaffId,@SignIn_Location, @Remarks,@DeviceId) 

			

			  end
			  end


			  

		



 select top 10* from Attendance_Master
GO
/****** Object:  StoredProcedure [dbo].[SetAttendanceUpdate]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetAttendanceUpdate]

               @StaffId int,

			   @Remarks varchar(1000),

			   @SignOut_Location varchar(500),

			   @Out_Time time(7)

			

AS

BEGIN

                -- SET NOCOUNT ON added to prevent extra result sets from

                -- interfering with SELECT statements.

                SET NOCOUNT ON;

 Declare @InTime time(7),  @attendanceid int

    -- Insert statements for procedure here

 

              ---Select @CompanyID =Company_Name,@UnitId =Company_Unit_Name from Staff_Master where Staff_Id = @StaffId

			  

			  select @attendanceid = Attendance_Id from Attendance_Master where  Staff_Name = @StaffId and Attendance_Date = CAST(GetDate() AS DATE) and In_Time is not null and Out_Time is null

			 

			  update Attendance_Master set Out_Time = @Out_Time, Remarks = @Remarks, SignOut_Location=@SignOut_Location where Attendance_Id = @attendanceid



			  Select In_Time from Attendance_Master where Attendance_Id = @attendanceid



			 

			  end





			  



		







GO
/****** Object:  StoredProcedure [dbo].[SetLocationInsert]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SetLocationInsert]
               @StaffId int,
			
			   @Latitude nvarchar(50),

			   @Longitude nvarchar(50),
			   @Date datetime
			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for procedure here
 
              insert into Location_Log_Master (Latitude,Longtitude,TimeStamp, Staff_Id) values(@Latitude,@Longitude,@Date,@StaffId)

			

			 
			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[SetTaskByUser]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetTaskByUser]
@TaskDate datetime,
               @StaffId int,
			@PurposeId int,

			   @Remarks nvarchar(max),

			   @PlainNote nvarchar(500),
			   @SDate datetime,
			   @EDate datetime,
			   @Status int,
			   @UniqueTrack int,
			   @ExecuteEntry int,
			   @Location nvarchar(500)

			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @TimeSheetID int,@CompanyName int, @CompanyUnit int

			Select @CompanyName = Company_Name,@CompanyUnit= Company_Unit_Name from Staff_Master where Staff_Id =@StaffId

 
              insert into Time_Sheet_Master(Staff_Name, Task_date, Purpose_Name,Entered_By,Entered_Unit, Start_Time, End_Time, Status, PlainNote,  Remarks,UniqueTrack,ExecEntry,Location,Entered_Date, End_Date, PStart_Time, PEnd_Time) values(@StaffId, @TaskDate, @PurposeId,@StaffId,@CompanyUnit, @SDate, @EDate, 2, @PlainNote, @Remarks,@UniqueTrack,@ExecuteEntry,@Location,GetDate(), DATEADD(minute,30,GETDATE()), DATEADD(minute,30,GETDATE()),DATEADD(minute,30,GETDATE())) Select @TimeSheetID =CAST(scope_identity() AS int)
			
			  Select  @TimeSheetID as TimeSheetID,Purpose_Name,LocationInterval from Purpose_Code_Master where Purpose_Code_Id = @PurposeId
			 
			  end

			 
			  
			  
		



GO
/****** Object:  StoredProcedure [dbo].[SetTaskByUserUpdate]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetTaskByUserUpdate]
@TaskDate datetime,
               @StaffId int,
			   @Remarks nvarchar(max),
			   @PlainNote nvarchar(500),
			   @EDate datetime,
			   @Status int,
			   @TimeSheetID int,
			   @Location nvarchar(500)

			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

				Declare  @PurposeId int
    -- Insert statements for procedure here
 
              update Time_Sheet_Master set End_Time =@EDate, Status = 3, PlainNote = @PlainNote,  Remarks =@Remarks,End_Location = @Location, End_Date = GetDate() where Time_Sheet_Id = @TimeSheetID
			  select Start_Time from Time_Sheet_Master where Time_Sheet_Id = @TimeSheetID
			 
			 
			  end


			  

		



 
GO
/****** Object:  StoredProcedure [dbo].[SP_Action_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Action_Master]
@Action_Id  int,
@Designation_Name  int,
@Action_Name  varchar(100),
@Action_Short_Name  varchar(30),
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Action_Master] WHERE [Action_Id]=@Action_Id )
BEGIN
INSERT INTO  [Action_Master]
(
[Designation_Name],
[Action_Name],
[Action_Short_Name],
[Remarks],
[Entered_By],
[Entered_Date]
)
VALUES
(
@Designation_Name,
@Action_Name,
@Action_Short_Name,
@Remarks,
@Entered_By,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Action_Master] SET
[Designation_Name] = @Designation_Name,
[Action_Name] = @Action_Name,
[Action_Short_Name] = @Action_Short_Name,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date
WHERE [Action_Id]=@Action_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_AddSuppliersName]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Procedure [dbo].[Sp_AddSuppliersName] 
@Id  INT=0,
@SupplierName Varchar(100)='',
@EnteredBy int,
@RequestId INT =0,
@StockID INT =0,
@Entered_Unit INT
AS 
BEGIN
     If Not EXISTS(select * from Tbl_Suppliers where SupplierName =@SupplierName )
     BEGIN
         Insert into Tbl_Suppliers (SupplierName, EnteredDate,EnteredBy,Entered_Unit)
          Values(@SupplierName,GETDATE(),@EnteredBy,@Entered_Unit)
          
          Update  SuppliersMaster SET SupplierId =@@IDENTITY, EnteredDate=GETDATE(), EnteredBy=@EnteredBy   where 
          RequestId=@RequestId AND StockId=@StockID
    SET @Id = @@Identity      
    SELECT @Id As Id
    END
    ELSe
    BEGIN
    Declare @SupplierId INT
       Select @SupplierId =SupplierId  from Tbl_Suppliers where SupplierName =@SupplierName 
       Update  SuppliersMaster SET SupplierId =@SupplierId, EnteredDate=GETDATE(), EnteredBy=@EnteredBy, Entered_Unit=@Entered_Unit   where 
          RequestId=@RequestId AND StockId=@StockID
    END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_Happy_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Admin_Happy_Master]
@Happy_Id  int,
@Happy_Date  datetime,
@Staff_Name  int,
@Happy_Status  int,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Unit  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Admin_Happy_Master] WHERE Month(Happy_Date)= Month(@Happy_Date) AND Year(Happy_Date)= Year(@Happy_Date) AND Staff_Name = @Staff_Name AND [Entered_By] = @Entered_By)
BEGIN
INSERT INTO  [Admin_Happy_Master]
(
[Happy_Date],
[Staff_Name],
[Happy_Status],
[Remarks],
[Entered_By],
[Entered_Unit],
[Entered_Date]
)
VALUES
(
@Happy_Date,
@Staff_Name,
@Happy_Status,
@Remarks,
@Entered_By,
@Entered_Unit,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Admin_Happy_Master] SET
[Happy_Date] = @Happy_Date,
[Staff_Name] = @Staff_Name,
[Happy_Status] = @Happy_Status,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Unit] = @Entered_Unit,
[Entered_Date] = @Entered_Date
WHERE Month(Happy_Date)= Month(@Happy_Date) AND Year(Happy_Date)= Year(@Happy_Date) AND Staff_Name = @Staff_Name AND [Entered_By] = @Entered_By
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_Staff_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Admin_Staff_Master]  
  
  
  
  
  
  
  
@Staff_Id  int,  
  
  
  
  
  
  
  
@Staff_Name  varchar(100),  
  
  
  
  
  
  
  
@Employee_Code  int,  
  
  
  
  
  
  
  
@Password  varchar(50),  
  
  
  
  
  
  
  
@Gender  int,  
  
  
  
  
  
  
  
@Date_of_Birth  datetime,  
  
  
  
  
  
  
  
@Higher_Qualification  varchar(100),  
  
  
  
  
  
  
  
@Department_Name  int,  
  
  
  
  
  
  
  
@Team_Name  int,  
  
  
  
  
  
  
  
@Designation_Name  int,  
  
  
  
  
  
  
  
@Salary  numeric,  
  
  
  
  
  
  
  
@Email_Id  varchar(75),  
  
  
  
  
  
  
  
@Address  varchar(1500),  
  
  
  
  
  
  
  
@Contact_No  varchar(20),  
  
  
  
  
  
  
  
@Entered_By  int,  
  
  
  
  
  
  
  
@Company_Name  int,  
  
  
  
  
  
  
  
@Company_Unit_Name  int,  
  
  
  
  
  
  
  
@Entered_Date  datetime,  
  
  
  
  
  
  
  
@Skills_Details  varchar(1000),  
  
  
  
  
  
  
  
@Is_Admin  bit = 0,  
  
  
  
  
  
  
  
@Is_MasterAdmin bit = 0,  
  
  
  
  
  
  
  
@Entered_Unit  int,  
  
  
  
  
  
  
  
@Employee_Status varchar(20),  
  
  
  
  
  
  
  
@Blood_Group  varchar(10),  
  
  
  
  
  
  
  
@Family_Details  varchar(1000),  
  
  
  
  
  
  
  
@ESI_Card_No  varchar(30),  
  
  
  
  
  
  
  
@Insurance_Policy_No  varchar(100),  
  
  
  
  
  
  
  
@PAN_No  varchar(50),  
  
  
  
  
  
  
  
@Adhaar_No NVARCHAR(50),  
  
  
  
  
  
  
  
@DIN_No  varchar(30),  
  
  
  
  
  
  
  
@Bank_Details  varchar(500),  
  
  
  
  
  
  
  
@Pass_Port_No  varchar(50),  
  
  
  
  
  
  
  
@Date_of_Issue  datetime,  
  
  
  
  
  
  
  
@Date_of_Expiry  datetime,  
  
  
  
  
  
  
  
@Date_of_Join  datetime,  
  
  
  
  
  
  
  
@ECNR_Required_Or_Not  bit,  
  
  
  
  
  
  
  
@Mobile_No  varchar(20),  
  
  
  
  
  
  
  
@Residence_No  varchar(20),  
  
  
  
  
  
  
  
@PF_Account_No  varchar(30),  
  
  
  
  
  
  
  
@Passport_Details  varchar(500),  
  
  
  
  
  
  
  
@Date_Of_Departure datetime,  
  
  
  
  
  
  
  
@Departure_Location varchar(500) ,  
  
  
  
  
  
  
  
@Level VARCHAR(50),  
  
  
  
  
  
  
  
@Permanent_Address VARCHAR(1000),  
  
  
  
  
  
  
  
@Next_of_Kin VARCHAR(150),  
  
  
  
  
  
  
  
@Relation_Next_Kin VARCHAR(150),  
  
  
  
  
  
  
  
@Emp_Name VARCHAR(100),  
  
  
  
@picPath VARCHAR(100),  
  
@Band int=0 ,

@VehicleId int=0
  
  
  
  
  
  
  
AS  
  
  
  
  
  
  
  
BEGIN  
  
  
  
  
  
  
  
IF NOT EXISTS( SELECT * FROM [Staff_Master] WHERE [Staff_Id]=@Staff_Id )  
  
  
  
  
  
  
  
BEGIN  
  
  
  
  
  
  
  
INSERT INTO  [Staff_Master]  
  
  
  
  
  
  
  
(  
  
  
  
  
  
  
  
[Staff_Name],  
  
  
  
  
  
  
  
[Employee_Code],  
  
  
  
  
  
  
  
[Password],  
  
  
  
  
  
  
  
[Gender],  
  
  
  
  
  
  
  
[Date_of_Birth],  
  
  
  
  
  
  
  
[Higher_Qualification],  
  
  
  
  
  
  
  
[Department_Name],  
  
  
  
  
  
  
  
[Team_Name],  
  
  
  
  
  
  
  
[Designation_Name],  
  
  
  
  
  
  
  
[Salary],  
  
  
  
  
  
  
  
[Email_Id],  
  
  
  
  
  
  
  
[Address],  
  
  
  
  
  
  
  
[Contact_No],  
  
  
  
  
  
  
  
[Entered_By],  
  
  
  
  
  
  
  
[Company_Name],  
  
  
  
  
  
  
  
[Company_Unit_Name],  
  
  
  
  
  
  
  
[Entered_Date],  
  
  
  
  
  
  
  
[Skills_Details],  
  
  
  
  
  
  
  
[Is_Admin],  
  
  
  
  
  
  
  
[Is_MasterAdmin],  
  
  
  
  
  
  
  
[Entered_Unit],  
  
  
  
  
  
  
  
[Employee_Status],  
  
  
  
  
  
  
  
[Blood_Group],  
  
  
  
  
  
  
  
[Family_Details],  
  
  
  
  
  
  
  
[ESI_Card_No],  
  
  
  
  
  
  
  
[Insurance_Policy_No],  
  
  
  
  
  
  
  
[PAN_No],  
  
  
  
  
  
  
  
[Adhaar_No],  
  
  
  
  
  
  
  
[DIN_No],  
  
  
  
  
  
  
  
[Bank_Details],  
  
  
  
  
  
  
  
[Pass_Port_No],  
  
  
  
  
  
  
  
[Date_of_Issue],  
  
  
  
  
  
  
  
[Date_of_Expiry],  
  
  
  
  
  
  
  
[Date_of_Join],  
  
  
  
  
  
  
  
[ECNR_Required_Or_Not],  
  
  
  
  
  
  
  
[Mobile_No],  
  
  
  
  
  
  
  
[Residence_No],  
  
  
  
  
  
  
  
[PF_Account_No],  
  
  
  
  
  
  
  
[Passport_Details],  
  
  
  
  
  
  
  
[Date_Of_Departure],  
  
  
  
  
  
  
  
[Departure_Location],  
  
  
  
  
  
  
  
[Level],  
  
  
  
  
  
  
  
[Permanent_Address],  
  
  
  
  
  
  
  
[Next_of_Kin] ,  
  
  
  
  
  
  
  
[Relation_Next_Kin],  
  
  
  
  
  
  
  
[Emp_Name],  
  
  
  
[PicPath],  
  
[Band],

[VehicleId]
  
  
  
  
  
  
  
)  
  
  
  
  
  
  
  
VALUES  
  
  
  
  
  
  
  
(  
  
  
  
  
  
  
  
@Staff_Name,  
  
  
  
  
  
  
  
@Employee_Code,  
  
  
  
  
  
  
  
@Password,  
  
  
  
  
  
  
  
@Gender,  
  
  
  
  
  
  
  
@Date_of_Birth,  
  
  
  
  
  
  
  
@Higher_Qualification,  
  
  
  
  
  
  
  
@Department_Name,  
  
  
  
  
  
  
  
@Team_Name,  
  
  
  
  
  
  
  
@Designation_Name,  
  
  
  
  
  
  
  
@Salary,  
  
  
  
  
  
  
  
@Email_Id,  
  
  
  
  
  
  
  
@Address,  
  
  
  
  
  
  
  
@Contact_No,  
  
  
  
  
  
  
  
@Entered_By,  
  
  
  
  
  
  
  
@Company_Name,  
  
  
  
  
  
  
  
@Company_Unit_Name,  
  
  
  
  
  
  
  
@Entered_Date,  
  
  
  
  
  
  
  
@Skills_Details,  
  
  
  
  
  
  
  
@Is_Admin,  
  
  
  
  
  
  
  
@Is_MasterAdmin,  
  
  
  
  
  
  
  
@Entered_Unit,  
  
  
  
  
  
  
  
@Employee_Status,  
  
  
  
  
  
  
  
@Blood_Group,  
  
  
  
  
  
  
  
@Family_Details,  
  
  
  
  
  
  
  
@ESI_Card_No,  
  
  
  
  
  
  
  
@Insurance_Policy_No,  
  
  
  
  
  
  
  
@PAN_No,  
  
  
  
  
  
  
  
@Adhaar_No,  
  
  
  
  
  
  
  
@DIN_No,  
  
  
  
  
  
  
  
@Bank_Details,  
  
  
  
  
  
  
  
@Pass_Port_No,  
  
  
  
  
  
  
  
@Date_of_Issue,  
  
  
  
  
  
  
  
@Date_of_Expiry,  
  
  
  
  
  
  
  
@Date_of_Join,  
  
  
  
  
  
  
  
@ECNR_Required_Or_Not,  
  
  
  
  
  
  
  
@Mobile_No,  
  
  
  
  
  
  
  
@Residence_No,  
  
  
  
  
  
  
  
@PF_Account_No,  
  
  
  
  
  
  
  
@Passport_Details,  
  
  
  
  
  
  
  
@Date_Of_Departure,  
  
  
  
  
  
  
  
@Departure_Location ,  
  
  
  
  
  
  
  
@Level,  
  
  
  
  
  
  
  
@Permanent_Address ,  
  
  
  
  
  
  
  
@Next_of_Kin,  
  
  
  
  
  
  
  
@Relation_Next_Kin,  
  
  
  
  
  
  
  
@Emp_Name,  
  
  
  
@picPath,  
  
@Band,

@VehicleId
  
  
  
  
  
  
  
)  
  
  
  
  
  
  
  
END  
  
  
  
  
  
  
  
ELSE  
  
  
  
  
  
  
  
BEGIN  
  
  
  
  
  
  
  
UPDATE [Staff_Master] SET  
  
  
  
  
  
  
  
[Staff_Name] = @Staff_Name,  
  
  
  
  
  
  
  
[Employee_Code] = @Employee_Code,  
  
  
  
  
  
  
  
[Password] = ISNULL(@Password,[Password]),  
  
  
  
  
  
  
  
[Gender] = @Gender,  
  
  
  
  
  
  
  
[Date_of_Birth] = @Date_of_Birth,  
  
  
  
  
  
  
  
[Higher_Qualification] = @Higher_Qualification,  
  
  
  
  
  
  
  
[Department_Name] = @Department_Name,  
  
  
  
  
  
  
  
[Team_Name] = @Team_Name,  
  
  
  
  
  
  
  
[Designation_Name] = @Designation_Name,  
  
  
  
  
  
  
  
[Salary] = @Salary,  
  
  
  
  
  
  
  
[Email_Id] = @Email_Id,  
  
  
  
  
  
  
  
[Address] = @Address,  
  
  
  
  
  
  
  
[Contact_No] = @Contact_No,  
  
  
  
  
  
  
  
[Entered_By] = @Entered_By,  
  
  
  
  
  
  
  
[Company_Name] = @Company_Name,  
  
  
  
  
  
  
  
[Company_Unit_Name] = @Company_Unit_Name,  
  
  
  
  
  
  
  
[Entered_Date] = @Entered_Date,  
  
  
  
  
  
  
  
[Skills_Details] = @Skills_Details,  
  
  
  
  
  
  
  
[Is_Admin] = @Is_Admin,  
  
  
  
  
  
  
  
[Is_MasterAdmin]= @Is_MasterAdmin,  
  
  
  
  
  
  
  
[Entered_Unit] = @Entered_Unit,  
  
  
  
  
  
  
  
[Employee_Status] = @Employee_Status ,  
  
  
  
  
  
  
  
[Blood_Group] = @Blood_Group,  
  
  
  
  
  
  
  
[Family_Details] = @Family_Details,  
  
  
  
  
  
  
  
[ESI_Card_No] = @ESI_Card_No,  
  
  
  
  
  
  
  
[Insurance_Policy_No] = @Insurance_Policy_No,  
  
  
  
  
  
  
  
[PAN_No] = @PAN_No,  
  
  
  
  
  
  
  
[Adhaar_No] = @Adhaar_No,   
  
  
  
  
  
  
  
[DIN_No] = @DIN_No,  
  
  
  
  
  
  
  
[Bank_Details] = @Bank_Details,  
  
  
  
  
  
  
  
[Pass_Port_No] = @Pass_Port_No,  
  
  
  
  
  
  
  
[Date_of_Issue] = @Date_of_Issue,  
  
  
  
  
  
  
  
[Date_of_Expiry] = @Date_of_Expiry,  
  
  
  
  
  
  
  
[Date_of_Join] = @Date_of_Join,  
  
  
  
  
  
  
  
[ECNR_Required_Or_Not] = @ECNR_Required_Or_Not,  
  
  
  
  
  
  
  
[Mobile_No] = @Mobile_No,  
  
  
  
  
  
  
  
[Residence_No] = @Residence_No,  
  
  
  
  
  
  
  
[PF_Account_No] = @PF_Account_No,  
  
  
  
  
  
  
  
[Passport_Details] = @Passport_Details,  
  
  
  
  
  
  
  
[Date_Of_Departure]= @Date_Of_Departure,  
  
  
  
  
  
  
  
[Departure_Location] = @Departure_Location,  
  
  
  
  
  
  
  
[Level]  = @Level,  
  
  
  
  
  
  
  
[Permanent_Address] = @Permanent_Address,  
  
  
  
  
  
  
  
[Next_of_Kin] = @Next_of_Kin,  
  
  
  
  
  
  
  
[Relation_Next_Kin] = @Relation_Next_Kin,  
  
  
  
  
  
  
  
[Emp_Name] = @Emp_Name,  
  
  
  
[PicPath] = @picPath,  
  
[Band] = @Band,

[VehicleId] = @VehicleId 
  
  
  
  
  
  
  
WHERE [Staff_Id]=@Staff_Id  
  
  
  
  
  
  
  
END  
  
  
  
  
  
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Advances_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Advances_Master]

@Advance_Id  int,

@Company_Name  int,

@Company_Unit_Name  int,

@Department_Name  int,

@Team_Name  int,

@Designation_Name  int,

@Staff_Name  int,

@Amount  int,

@Instalments int,

@InstalmentAmount  int,

@Remarks  NVARCHAR(1000),

@Entered_Unit  int,

@Entered_By  int,

@Entered_Date  datetime,

@Advance_Approve VARCHAR(20),

@Approved_By int,

@Approval_Date datetime,

@Approval_remarks NVARCHAR(MAX)

AS

BEGIN

IF NOT EXISTS( SELECT * FROM [AdvancesMaster] WHERE [ID]=@Advance_Id )

BEGIN

INSERT INTO  [AdvancesMaster]

(

[Company_Name],

[Company_Unit_Name],

[Department_Name],

[Team_Name],

[Designation_Name],

[Staff_Name],

[Amount],

[Instalments],

[InstalmentAmt],

[Remarks],

[Entered_Unit],

[Entered_By],

[Entered_Date],

[ApprovalStats],

[Approved_By] ,

[ApprovalDate],

[Approval_Remarks]

)

VALUES

(

@Company_Name,

@Company_Unit_Name,

@Department_Name,

@Team_Name,

@Designation_Name,

@Staff_Name,

@Amount,

@Instalments,

@InstalmentAmount,

@Remarks,

@Entered_Unit,

@Entered_By,

@Entered_Date,

@Advance_Approve,

CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE @Entered_By END,

CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE GETDATE() END,

CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE @Approval_remarks END





)

END

ELSE

BEGIN

UPDATE [AdvancesMaster] SET

[Company_Name] = @Company_Name,

[Company_Unit_Name] = @Company_Unit_Name,

[Department_Name] = @Department_Name,

[Team_Name] = @Team_Name,

[Designation_Name] = @Designation_Name,

[Staff_Name] = @Staff_Name,

Amount = @Amount,

[Instalments] = @Instalments,

[InstalmentAmt] = @InstalmentAmount,

[Remarks] = @Remarks,

[Entered_Unit] = @Entered_Unit,

[Entered_By] = @Entered_By,

[ApprovalStats]=@Advance_Approve,

[Approved_By] = CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE @Entered_By END,

[ApprovalDate] = CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE GETDATE() END,

[Approval_Remarks]= CASE WHEN @Advance_Approve IS NULL THEN NULL ELSE @Approval_remarks END

WHERE [ID]=@Advance_Id

END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_Configuration]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Attendance_Configuration]
@Configuration_Id  int,
@Office_Start_Time  time,
@Office_End_Time  time,
@Late_Coming  time,
@Early_leaving  time,
@No_of_Leave  decimal(5,2),
@No_of_late  tinyint,
@Loss_of_Pay  decimal(5,2),
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Company_Unit_Name int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Attendance_Configuration] WHERE [Company_Unit_Name] = @Company_Unit_Name )
BEGIN
INSERT INTO  [Attendance_Configuration]
(
[Office_Start_Time],
[Office_End_Time],
[Late_Coming],
[Early_leaving],
[No_of_Leave],
[No_of_late],
[Loss_of_Pay],
[Remarks],
[Entered_By],
[Entered_Date],
[Company_Unit_Name]
)
VALUES
(
@Office_Start_Time,
@Office_End_Time,
@Late_Coming,
@Early_leaving,
@No_of_Leave,
@No_of_late,
@Loss_of_Pay,
@Remarks,
@Entered_By,
@Entered_Date ,
@Company_Unit_Name
)
END
ELSE
BEGIN
UPDATE [Attendance_Configuration] SET
[Office_Start_Time] = @Office_Start_Time,
[Office_End_Time] = @Office_End_Time,
[Late_Coming] = @Late_Coming,
[Early_leaving] = @Early_leaving,
[No_of_Leave] = @No_of_Leave,
[No_of_late] = @No_of_late,
[Loss_of_Pay] = @Loss_of_Pay,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Company_Unit_Name] = @Company_Unit_Name
WHERE [Configuration_Id]=@Configuration_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_Entry]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Attendance_Entry]
@Attendance_Date  date,
@Staff_Name  int,
@In_Time  time,
@Out_Time  time,
@Remarks  varchar(1000),
@Entered_By  int,
@Modified_By  int,
@Entered_Date  datetime,
@Modified_Date  datetime,
@Entered_Unit  int ,
@SignIn_Location VARCHAR(500),
@SignOut_Location VARCHAR(500)
AS
BEGIN


IF NOT EXISTS( SELECT * FROM [Attendance_Master] WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name)
BEGIN
INSERT INTO  [Attendance_Master]
(
[Attendance_Date],
[Staff_Name],
[In_Time],
[Out_Time] ,
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit],
[SignIn_Location],
[SignOut_Location],
[Is_MobileSignIn],
[Is_MobileSignOut]
)
VALUES
(
@Attendance_Date,
@Staff_Name,
@In_Time,
@Out_Time,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit,
@SignIn_Location,
@SignOut_Location ,
0,
0

)

END
ELSE
BEGIN
UPDATE Attendance_Master SET
[Attendance_Date] = @Attendance_Date,
[Staff_Name] = @Staff_Name,
[In_Time] = @In_Time,
[Out_Time] = @Out_Time,
[Remarks] = @Remarks,
[Modified_By] = @Modified_By,
[Modified_Date] = @Modified_Date,
[Entered_Unit] = @Entered_Unit,
[SignIn_Location] =@SignIn_Location,
[SignOut_Location] = @SignOut_Location,
[Is_MobileSignIn] = ISNULL(Is_MobileSignIn,0),
[Is_MobileSignOut] = ISNULL(Is_MobileSignOut,0)
WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_FullDetails]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Attendance_FullDetails]



@Year INT,



@Month INT,



@Staff_Id INT



AS



BEGIN



DECLARE @Late_Coming TIME,



@Early_leaving TIME,



@No_Of_Late tinyint,



@Loss_Of_Pay decimal(5,2)











--SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,



--@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay



--FROM [Attendance_Configuration] WHERE Company_Unit_Name IS NULL







--IF NOT EXISTS(SELECT *FROM [Attendance_Configuration]  



--WHERE Company_Unit_Name IN(SELECT ISNULL(Company_Unit_Name,0) FROM Staff_Master WHERE Staff_Id=@Staff_Id))



BEGIN







	SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,  



	@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay   



	FROM [Attendance_Configuration]  



	WHERE Company_Unit_Name IN(SELECT Company_Unit_Name FROM Staff_Master WHERE Staff_Id=@Staff_Id)







END







IF  @Month =0



BEGIN







SELECT @No_Of_Late =@No_Of_Late+ISNULL(COUNT(*),0) from Leave_Master where (Total_Leave % 1)>0  



AND @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To)



AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'











SELECT Staff_Name, Count(*) AS Total,0 AS AryPosition from Attendance_Master



WHERE YEAR(Attendance_Date) = @year



AND Staff_Name=@Staff_Id group by Staff_Name



UNION



SELECT Staff_Name,



CAST(



CAST(Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))/60 AS  VARCHAR) +'.'+



CASE WHEN (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) < 10 Then



'0'+ CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)



ELSE



CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)



END  AS DECIMAL(7,2))AS Att_Hours,



1



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year



AND Staff_Name=@Staff_Id



group by Staff_Name



UNION



SELECT Staff_Name, Count(*) AS MLate,



CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year



AND Staff_Name=@Staff_Id



AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



IN ( 2,3)



group by Staff_Name,



CASE WHEN @Late_Coming< In_Time Then 2 WHEN @Early_leaving> Out_Time Then 3  End



UNION



SELECT Staff_Name, (Count(*) /@No_Of_Late)* @Loss_Of_Pay AS MLate,4



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year



AND Staff_Name=@Staff_Id



AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



IN ( 2,3)



group by Staff_Name



UNION



SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when Approve_Status = 'Approved' Then 6 Else 5 End



AS AryPosition FROM Leave_Master



WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To)



AND Staff_Name=@Staff_Id AND ISNULL(Approve_Status,'Not Approved')  IN ('Not Approved','Approved' )



group by Staff_Name, case when Approve_Status = 'Approved' Then 6 Else 5 End



UNION



SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when LeaveType = 'C' Then 7 when LeaveType = 'M' Then 8 End



AS AryPosition FROM Leave_Master



WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To)



AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'



group by Staff_Name, case when LeaveType = 'C' Then 7 when LeaveType = 'M' Then 8 End



UNION



SELECT Staff_Name,CAST(CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))/60 AS  VARCHAR) +'.'+



CASE WHEN (Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60)<10 Then



'0'+CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)



ELSE



CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)



END



AS DECIMAL(7,2)) AS Task_Hours,



9



FROM Time_Sheet_Master



WHERE YEAR(Task_Date) = @year



AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL



AND CAST(Start_Time AS DATETIME)< CAST( End_Time AS DATETIME)



GROUP BY Staff_Name



UNION



SELECT Staff_Name,Count(*),10



FROM Time_Sheet_Master



WHERE YEAR(Task_Date) = @year



AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL



AND CAST(Start_Time AS DATETIME)< CAST( End_Time AS DATETIME)



GROUP BY Staff_Name



END



ELSE



BEGIN







SELECT @No_Of_Late =@No_Of_Late+ISNULL(COUNT(*),0) from Leave_Master where (Total_Leave % 1)>0  



AND @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To) AND @Month BETWEEN Month(Leave_From) AND Month(Leave_To)



AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'







SELECT Staff_Name, Count(*) AS Total,0 AS AryPosition from Attendance_Master



WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month



AND Staff_Name=@Staff_Id group by Staff_Name



UNION



SELECT Staff_Name,



CAST(



CAST(Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))/60 AS  VARCHAR) +'.'+



CASE WHEN (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) < 10 Then



'0'+ CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)



ELSE



CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)



END  AS DECIMAL(7,2))AS Att_Hours,



1



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month



AND Staff_Name=@Staff_Id



group by Staff_Name



UNION



SELECT Staff_Name, Count(*) AS MLate,



CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month



AND Staff_Name=@Staff_Id



AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



IN ( 2,3)



group by Staff_Name,



CASE WHEN @Late_Coming< In_Time Then 2 WHEN @Early_leaving> Out_Time Then 3  End



UNION



SELECT Staff_Name, (Count(*) /@No_Of_Late)* @Loss_Of_Pay AS MLate,4



FROM Attendance_Master



WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month



AND Staff_Name=@Staff_Id



AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End



IN ( 2,3)



group by Staff_Name



UNION



SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when Approve_Status = 'Approved' Then 6 Else 5 End



AS AryPosition FROM Leave_Master



WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To) AND @Month BETWEEN Month(Leave_From) AND Month(Leave_To)



AND Staff_Name=@Staff_Id AND ISNULL(Approve_Status,'Not Approved')  IN ('Not Approved','Approved' )



group by Staff_Name, case when Approve_Status = 'Approved' Then 6 Else 5 End



UNION



SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when LeaveType = 'C' Then 7 when LeaveType = 'M' Then 8 End



AS AryPosition FROM Leave_Master



WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To) AND @Month BETWEEN Month(Leave_From) AND Month(Leave_To)



AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'



group by Staff_Name, case when LeaveType = 'C' Then 7 when LeaveType = 'M' Then 8 End



UNION



SELECT Staff_Name,CAST(CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))/60 AS  VARCHAR) +'.'+



CASE WHEN (Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60)<10 Then



'0'+CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)



ELSE



CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)



END



AS DECIMAL(7,2)) AS Task_Hours,



9



FROM Time_Sheet_Master



WHERE YEAR(Task_Date) = @year and MONTH(Task_Date) = @Month



AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL



AND CAST(Start_Time AS DATETIME)< CAST( End_Time AS DATETIME)



GROUP BY Staff_Name



UNION



SELECT Staff_Name,Count(*),10



FROM Time_Sheet_Master



WHERE YEAR(Task_Date) = @year and MONTH(Task_Date) = @Month



AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL



AND CAST(Start_Time AS DATETIME)< CAST( End_Time AS DATETIME)



GROUP BY Staff_Name







END







END
GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Attendance_Master]
@Attendance_Date  date,
@Staff_Name  int,
@In_Time  time,
@Out_Time  time,
@Remarks  varchar(1000),
@Entered_By  int,
@Modified_By  int,
@Entered_Date  datetime,
@Modified_Date  datetime,
@Entered_Unit  int,
@SignIn_Location VARCHAR(500),
@SignOut_Location VARCHAR(500),
@Is_MobileSignIn BIT,
@Is_MobileSignOut BIT
AS
BEGIN


IF NOT EXISTS( SELECT * FROM [Attendance_Master] WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name)
BEGIN
INSERT INTO  [Attendance_Master]
(
[Attendance_Date],
[Staff_Name],
[In_Time],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit],
[SignIn_Location],
[Is_MobileSignIn]
)
VALUES
(
@Attendance_Date,
@Staff_Name,
@In_Time,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit ,
@SignIn_Location,
@Is_MobileSignIn
)

END
ELSE
BEGIN
UPDATE Attendance_Master SET
[Attendance_Date] = @Attendance_Date,
[Staff_Name] = @Staff_Name,
[In_Time] = ISNULL([In_Time],@In_Time),
[Out_Time] = @Out_Time,
[Remarks] = @Remarks,
[Modified_By] = @Modified_By,
[Modified_Date] = @Modified_Date,
[Entered_Unit] = @Entered_Unit  ,
[SignIn_Location]=ISNULL(SignIn_Location,@SignIn_Location),
[SignOut_Location]=@SignOut_Location,
[Is_MobileSignIn] = ISNULL(Is_MobileSignIn,@Is_MobileSignIn),
[Is_MobileSignOut]= @Is_MobileSignOut
WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name
END

UPDATE Leave_Master  SET Approve_Status = 'Cancelled' , Approve_By=@Entered_By,Approved_Date =GetDate() WHERE @Attendance_Date   BETWEEN Leave_From AND Leave_To and Total_Leave>=1
AND ISNULL(Approve_Status,'Not Approved') NOT IN ('Approved')


END




GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_Master2]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Attendance_Master2]

@Attendance_Date  date,

@Staff_Name  int,

@In_Time  time,

@Out_Time  time,

@DeviceID nvarchar,

@SignIn_Location VARCHAR(500),

@SignOut_Location VARCHAR(500)

AS

BEGIN


IF NOT EXISTS( SELECT * FROM [Attendance_Master] WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name)

BEGIN

INSERT INTO  [Attendance_Master]

(

[Attendance_Date],

[Staff_Name],

[In_Time],

[DeviceID],

[SignIn_Location]

)

VALUES

(

@Attendance_Date,

@Staff_Name,

@In_Time,

@DeviceID,

@SignIn_Location

)



END

ELSE

BEGIN

UPDATE Attendance_Master SET

[Attendance_Date] = @Attendance_Date,

[Staff_Name] = @Staff_Name,

[In_Time] = ISNULL([In_Time],@In_Time),

[Out_Time] = @Out_Time,

[DeviceID] = @DeviceID,

[SignIn_Location]=ISNULL(SignIn_Location,@SignIn_Location),

[SignOut_Location]=@SignOut_Location


WHERE [Attendance_Date]=@Attendance_Date AND [Staff_Name] = @Staff_Name

END



UPDATE Leave_Master  SET Approve_Status = 'Cancelled' , Approve_By='',Approved_Date =GetDate() WHERE @Attendance_Date   BETWEEN Leave_From AND Leave_To and Total_Leave>=1

AND ISNULL(Approve_Status,'Not Approved') NOT IN ('Approved')





END

GO
/****** Object:  StoredProcedure [dbo].[SP_Attendance_Report]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Attendance_Report]
@Year INT,
@Month INT,
@Staff_Id INT
AS
BEGIN
DECLARE @Late_Coming TIME,
@Early_leaving TIME,
@No_Of_Late tinyint,
@Loss_Of_Pay decimal(5,2)



SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,
@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay
FROM [Attendance_Configuration] WHERE Company_Unit_Name IS NULL

IF NOT EXISTS(SELECT *FROM [Attendance_Configuration]  
WHERE Company_Unit_Name IN(SELECT ISNULL(Company_Unit_Name,0) FROM Staff_Master WHERE Staff_Id=@Staff_Id))
BEGIN

	SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,  
	@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay   
	FROM [Attendance_Configuration]  
	WHERE Company_Unit_Name IN(SELECT Company_Unit_Name FROM Staff_Master WHERE Staff_Id=@Staff_Id)

END

IF  @Month =0
BEGIN
SELECT Staff_Name, Count(*) AS Total,0 AS AryPosition from Attendance_Master
WHERE YEAR(Attendance_Date) = @year
AND Staff_Name=@Staff_Id group by Staff_Name
UNION
SELECT Staff_Name,
CAST(
CAST(Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))/60 AS  VARCHAR) +'.'+
CASE WHEN (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) < 10 Then
'0'+ CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)
ELSE
CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)
END  AS DECIMAL(7,2))AS Att_Hours,
1
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year
AND Staff_Name=@Staff_Id
group by Staff_Name
UNION
SELECT Staff_Name, Count(*) AS MLate,
CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year
AND Staff_Name=@Staff_Id
AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
IN ( 2,3)
group by Staff_Name,
CASE WHEN @Late_Coming< In_Time Then 2 WHEN @Early_leaving> Out_Time Then 3  End
UNION
SELECT Staff_Name, (Count(*) /@No_Of_Late)* @Loss_Of_Pay AS MLate,4
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year
AND Staff_Name=@Staff_Id
AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
IN ( 2,3)
group by Staff_Name
END
ELSE
BEGIN

SELECT Staff_Name, Count(*) AS Total,0 AS AryPosition from Attendance_Master
WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month
AND Staff_Name=@Staff_Id GROUP BY Staff_Name
UNION
SELECT Staff_Name,
CAST(
CAST(Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))/60 AS  VARCHAR) +'.'+
CASE WHEN (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) < 10 Then
'0'+ CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)
ELSE
CAST( (Sum(datediff(N,Cast(In_Time as datetime),CAST ( Out_Time as Datetime)))% 60) AS VARCHAR)
END  AS DECIMAL(7,2))AS Att_Hours,
1
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month
AND Staff_Name=@Staff_Id
GROUP BY Staff_Name
UNION
SELECT Staff_Name, Count(*) AS MLate,
CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month
AND Staff_Name=@Staff_Id
AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
IN ( 2,3)
GROUP BY Staff_Name,
CASE WHEN @Late_Coming< In_Time Then 2 WHEN @Early_leaving> Out_Time Then 3  End
UNION
SELECT Staff_Name, (Count(*) /@No_Of_Late)* @Loss_Of_Pay AS MLate,4
FROM Attendance_Master
WHERE YEAR(Attendance_Date) = @year and MONTH(Attendance_Date) = @Month
AND Staff_Name=@Staff_Id
AND CASE WHEN @Late_Coming< In_Time Then 2  WHEN @Early_leaving> Out_Time Then 3  End
IN ( 2,3)
GROUP BY Staff_Name

END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Category_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Category_Master]
@Category_Id  int,
@Category_Name  varchar(100),
@Description  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Category_Master] WHERE [Category_Id]=@Category_Id )
BEGIN
INSERT INTO  [Category_Master]
(
[Category_Name],
[Description],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Category_Name,
@Description,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Category_Master] SET
[Category_Name] = @Category_Name,
[Description] = @Description,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Category_Id]=@Category_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CHANGE_PASSWORD]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_CHANGE_PASSWORD]
@NewPassword VARCHAR(100),
@Staff_Name VARCHAR(100),
@Password VARCHAR(100)
AS
BEGIN
UPDATE Staff_Master SET [Password] = @NewPassword WHERE Staff_name=@Staff_Name AND [PASSWORD]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Check_List_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Check_List_Master]
@Check_List_Id  int,
@Check_List_Name  varchar(500),
@Description  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Check_List_Master] WHERE [Check_List_Id]=@Check_List_Id )
BEGIN
INSERT INTO  [Check_List_Master]
(
[Check_List_Name],
[Description],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Check_List_Name,
@Description,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Check_List_Master] SET
[Check_List_Name] = @Check_List_Name,
[Description] = @Description,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Check_List_Id]=@Check_List_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Check_List_Responsibilities]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Check_List_Responsibilities]
@Responsible_Id  int,
@Responsible  int,
@Project_Name  int,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Check_List_Responsibilities] WHERE [Responsible_Id]=@Responsible_Id )
BEGIN
INSERT INTO  [Check_List_Responsibilities]
(
[Responsible],
[Project_Name],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Responsible,
@Project_Name,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Check_List_Responsibilities] SET
[Responsible] = @Responsible,
[Project_Name] = @Project_Name,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Responsible_Id]=@Responsible_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Client_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Client_Master]
@Client_Id  int,
@Client_Name  varchar(100),
@Client_Short_Name  varchar(10),
@Company_Name  varchar(100),
@Address  varchar(1000),
@Eamil_Id  varchar(150),
@Phone_Number  varchar(15),
@Mobile_No  varchar(15),
@Date_of_Order  DateTime,
@Website_Name  varchar(150),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int,
@Cell_No VARCHAR(50)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Client_Master] WHERE [Client_Id]=@Client_Id )
BEGIN
INSERT INTO  [Client_Master]
(
[Client_Name],
[Client_Short_Name],
[Company_Name],
[Address],
[Eamil_Id],
[Phone_Number],
[Mobile_No],
[Date_of_Order],
[Website_Name],
[Entered_By],
[Entered_Date],
[Entered_Unit],
[Cell_No]
)
VALUES
(
@Client_Name,
@Client_Short_Name,
@Company_Name,
@Address,
@Eamil_Id,
@Phone_Number,
@Mobile_No,
@Date_of_Order,
@Website_Name,
@Entered_By,
@Entered_Date,
@Entered_Unit,
@Cell_No
)
END
ELSE
BEGIN
UPDATE [Client_Master] SET
[Client_Name] = @Client_Name,
[Client_Short_Name] = @Client_Short_Name,
[Company_Name] = @Company_Name,
[Address] = @Address,
[Eamil_Id] = @Eamil_Id,
[Phone_Number] = @Phone_Number,
[Mobile_No] = @Mobile_No,
[Date_of_Order] = @Date_of_Order,
[Website_Name] = @Website_Name,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit,
[Cell_No] = @Cell_No
WHERE [Client_Id]=@Client_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Color_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Color_Master]
@Color_Id  int,
@ColorCode  varchar(10),
@Color_Name  varchar(50)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Color_Master] WHERE [Color_Id]=@Color_Id )
BEGIN
INSERT INTO  [Color_Master]
(
[ColorCode],
[Color_Name]
)
VALUES
(
@ColorCode,
@Color_Name
)
END
ELSE
BEGIN
UPDATE [Color_Master] SET
[ColorCode] = @ColorCode,
[Color_Name] = @Color_Name
WHERE [Color_Id]=@Color_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Company_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Company_Master]
@Company_Id  int,
@Company_Name  varchar(150),
@Address  varchar(1000),
@Email_Id  varchar(15),
@Mobile_No  varchar(15),
@Phone_Number  varchar(15),
@Fax  varchar(50),
@Website_Name  varchar(150),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Company_Master] WHERE [Company_Id]=@Company_Id )
BEGIN
INSERT INTO  [Company_Master]
(
[Company_Name],
[Address],
[Email_Id],
[Mobile_No],
[Phone_Number],
[Fax],
[Website_Name],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Company_Name,
@Address,
@Email_Id,
@Mobile_No,
@Phone_Number,
@Fax,
@Website_Name,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Company_Master] SET
[Company_Name] = @Company_Name,
[Address] = @Address,
[Email_Id] = @Email_Id,
[Mobile_No] = @Mobile_No,
[Phone_Number] = @Phone_Number,
[Fax] = @Fax,
[Website_Name] = @Website_Name,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Company_Id]=@Company_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Company_Unit_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Company_Unit_Master]

@Unit_Id  int,

@Company_Name  int,

@Contact_Person  int,

@Address  varchar(1000),

@Company_Unit_Name  VARCHAR(100),

@Phone_Number  varchar(15),

@Mobile_No  varchar(15),

@Entered_By  int,

@Entered_Date  datetime,

@NoOfUser int,

@Entered_Unit  int

AS

BEGIN

IF NOT EXISTS( SELECT * FROM [Company_Unit_Master] WHERE [Unit_Id]=@Unit_Id )

BEGIN

INSERT INTO  [Company_Unit_Master]

(

[Company_Name],

[Contact_Person],

[Address],

[Company_Unit_Name],

[Phone_Number],

[Mobile_No],

[Entered_By],

[Entered_Date],

[NoOfUser],

[Entered_Unit]

)

VALUES

(

@Company_Name,

@Contact_Person,

@Address,

@Company_Unit_Name,

@Phone_Number,

@Mobile_No,

@Entered_By,

@Entered_Date,

@NoOfUser,

@Entered_Unit

)

END

ELSE

BEGIN

UPDATE [Company_Unit_Master] SET

[Company_Name] = @Company_Name,

[Contact_Person] = @Contact_Person,

[Address] = @Address,

[Company_Unit_Name] = @Company_Unit_Name,

[Phone_Number] = @Phone_Number,

[Mobile_No] = @Mobile_No,

[Entered_By] = @Entered_By,

[Entered_Date] = @Entered_Date,

[NoOfUser] = @NoOfUser,

[Entered_Unit] = @Entered_Unit

WHERE [Unit_Id]=@Unit_Id

END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Component_Entry]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Component_Entry]
@Component_Id  int,
@Component_Name  varchar(150),
@Remarks  varchar(1000),
@Entered_Unit_Id  int,
@Entered_By  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Component_Entry] WHERE [Component_Id]=@Component_Id )
BEGIN
INSERT INTO  [Component_Entry]
(
[Component_Name],
[Remarks],
[Entered_Unit_Id],
[Entered_By],
[Entered_Date]
)
VALUES
(
@Component_Name,
@Remarks,
@Entered_Unit_Id,
@Entered_By,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Component_Entry] SET
[Component_Name] = @Component_Name,
[Remarks] = @Remarks,
[Entered_Unit_Id] = @Entered_Unit_Id,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date
WHERE [Component_Id]=@Component_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_Pay_Settings_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_Pay_Settings_Master]
	 @Master_Id INT
AS
BEGIN
	DELETE FROM [Pay_Settings_Master] WHERE KeyField=@Master_Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Project]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Project]  
@ProjectId INT  
AS  
BEGIN  
  
 DELETE FROM Time_Sheet_Master    
 WHERE Task_Id IN  
 (  
	SELECT Task_Id FROM TASK_MASTER WHERE Project_Name = @ProjectId  
 ) 
DELETE FROM Resource_Allocation_Master  
WHERE Task_Name IN  
(  
SELECT Task_Id FROM TASK_MASTER WHERE Project_Name = @ProjectId  
)  
DELETE FROM Task_Mapping WHERE Project_Name = @ProjectId  
DELETE FROM TASK_MASTER WHERE Project_Name = @ProjectId AND Task_RefId IS NOT NULL  
DELETE FROM TASK_MASTER WHERE Project_Name = @ProjectId  
DELETE FROM Project_Resource_Master
WHERE Task_Name IN  
(  
	SELECT Task_Id FROM Project_Task_Master WHERE Project_Name = @ProjectId  
)  

DELETE FROM Project_Task_Master WHERE Project_Name = @ProjectId  AND Sub_Task_Id IS NOT NULL 
DELETE FROM Project_Task_Master WHERE Project_Name = @ProjectId  AND Parent_TaskId IS NOT NULL
DELETE FROM Project_Task_Master WHERE Project_Name = @ProjectId  
DELETE FROM Sub_Task_Master WHERE Project_Name = @ProjectId
DELETE FROM Project_Process_Master WHERE Project_Name = @ProjectId
DELETE FROM Resource_Master WHERE Project_Name = @ProjectId  
DELETE FROM Project_Master WHERE ProjectId = @ProjectId  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Department_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Department_Master]

@Department_Id  int,

@Department_Name  varchar(75),

@Rolse_and_Response  varchar(1500),

@Entered_By  int,

@Entered_Date  datetime,

@Entered_Unit  int,

@Closed int,


@IsField int

AS

BEGIN

IF NOT EXISTS( SELECT * FROM [Department_Master] WHERE [Department_Id]=@Department_Id )

BEGIN

INSERT INTO  [Department_Master]

(

[Department_Name],

[Rolse_and_Response],

[Entered_By],

[Entered_Date],

[Entered_Unit],

Closed,

Is_Field

)

VALUES

(

@Department_Name,

@Rolse_and_Response,

@Entered_By,

@Entered_Date,

@Entered_Unit,

@Closed,


@IsField

)

END

ELSE

BEGIN

UPDATE [Department_Master] SET

[Department_Name] = @Department_Name,

[Rolse_and_Response] = @Rolse_and_Response,

[Entered_By] = @Entered_By,

[Entered_Date] = @Entered_Date,

[Entered_Unit] = @Entered_Unit,

Closed = @Closed,

Is_Field= @IsField

WHERE [Department_Id]=@Department_Id

END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Department_Responsibility]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Department_Responsibility]
@Department_Name  int,
@Staff_Name  int,
@Entered_By  int,
@Entered_Date  datetime,
@Is_Active  bit
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Department_Responsibility] WHERE [Department_Name] = @Department_Name AND [Staff_Name] = @Staff_Name )
BEGIN
INSERT INTO  [Department_Responsibility]
(
[Department_Name],
[Staff_Name],
[Entered_By],
[Entered_Date],
[Is_Active]
)
VALUES
(
@Department_Name,
@Staff_Name,
@Entered_By,
@Entered_Date,
@Is_Active
)
END
ELSE
BEGIN
UPDATE [Department_Responsibility] SET
[Department_Name] = @Department_Name,
[Staff_Name] = @Staff_Name,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Is_Active] = @Is_Active
WHERE [Department_Name] = @Department_Name AND [Staff_Name] = @Staff_Name
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Designation_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery2.sql|139|0|C:\Users\ADMINI~1\AppData\Local\Temp\2\~vs3D29.sql
CREATE PROCEDURE [dbo].[SP_Designation_Master]    
@Designation_Id  int,    
@Designation_Name  varchar(100),    
@Rolse_and_Response  varchar(1500),    
@Entered_Date  datetime,    
@Entered_By  int,    
@Entered_Unit  int ,  
@Incentive_Points INT   
AS    
BEGIN    
IF NOT EXISTS( SELECT * FROM [Designation_Master] WHERE [Designation_Id]=@Designation_Id )    
BEGIN    
INSERT INTO  [Designation_Master]    
(    
[Designation_Name],    
[Rolse_and_Response],    
[Entered_Date],    
[Entered_By],    
[Entered_Unit]  ,  
[Incentive_Points]   
)    
VALUES    
(    
@Designation_Name,    
@Rolse_and_Response,    
@Entered_Date,    
@Entered_By,    
@Entered_Unit ,  
@Incentive_Points   
)    
END    
ELSE    
BEGIN    
UPDATE [Designation_Master] SET    
[Designation_Name] = @Designation_Name,    
[Rolse_and_Response] = @Rolse_and_Response,    
[Entered_Date] = @Entered_Date,    
[Entered_By] = @Entered_By,    
[Entered_Unit] = @Entered_Unit ,  
[Incentive_Points] = @Incentive_Points   
WHERE [Designation_Id]=@Designation_Id    
END    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Document_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Document_Master]
@Document_Id  int,
@Category_Name  int,
@Sub_Category_Name  int,
@Project_Name  int,
@Client_Name  int,
@Document_Name  varchar(200),
@Document_Type  int,
@File_Name  varchar(200),
@Key_word  varchar(500),
@Description  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Document_Master] WHERE [Document_Id]=@Document_Id )
BEGIN
INSERT INTO  [Document_Master]
(
[Category_Name],
[Sub_Category_Name],
[Project_Name],
[Client_Name],
[Document_Name],
[Document_Type],
[File_Name],
[Key_word],
[Description],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Category_Name,
@Sub_Category_Name,
@Project_Name,
@Client_Name,
@Document_Name,
@Document_Type,
@File_Name,
@Key_word,
@Description,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Document_Master] SET
[Category_Name] = @Category_Name,
[Sub_Category_Name] = @Sub_Category_Name,
[Project_Name] = @Project_Name,
[Client_Name] = @Client_Name,
[Document_Name] = @Document_Name,
[Document_Type] = @Document_Type,
[File_Name] = @File_Name,
[Key_word] = @Key_word,
[Description] = @Description,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Document_Id]=@Document_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Document_Type_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Document_Type_Master]
@Document_Type_Id  int,
@Document_Type  varchar(100)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Document_Type_Master] WHERE [Document_Type_Id]=@Document_Type_Id )
BEGIN
INSERT INTO  [Document_Type_Master]
(
[Document_Type]
)
VALUES
(
@Document_Type
)
END
ELSE
BEGIN
UPDATE [Document_Type_Master] SET
[Document_Type] = @Document_Type
WHERE [Document_Type_Id]=@Document_Type_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_duration_count]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_duration_count]
 @PROJECTID INT
 AS
 SELECT 'ACTUAL' AS STAGE, Expect_Start_Date AS DATEFROM, Expect_End_Date AS DATETO,
 DATEDIFF(DD, Expect_Start_Date ,Expect_End_Date ) +1 AS DURATION
 FROM VW_PROJECT_PROCESS_DURATION_GRAPH WHERE PROJECTID = @PROJECTID
 UNION
 SELECT 'PLANNED' AS STAGE, Start_Date AS DATEFROM, End_Date AS DATETO,
 DATEDIFF(DD, Start_Date ,End_Date )+1 AS DURATION
 FROM VW_PROJECT_PROCESS_DURATION_GRAPH WHERE PROJECTID = @PROJECTID
 UNION
 SELECT 'CLIENT DATES' AS STAGE,PLAN_START_DATE AS DATEFROM, Plan_End_Date AS DATETO ,
 DATEDIFF(DD, Plan_Start_Date ,Plan_End_Date )+1 AS DURATION
 FROM VW_PROJECT_PROCESS_DURATION_GRAPH WHERE PROJECTID = @PROJECTID
GO
/****** Object:  StoredProcedure [dbo].[Sp_DurationBasedTask_Assign_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_DurationBasedTask_Assign_Master]
@DateFrom datetime,
@DateTo datetime
AS
BEGIN
SELECT Staff_Master.Staff_Id,Staff_Master.Staff_Name,Task_Master.Task_Description,
Project_Master.Project_Name,Task_Master.Task_Name,Task_Master.Start_Date,
Task_Master.End_Date,Task_Status
FROM Staff_Master
LEFT OUTER JOIN Resource_Allocation_master ON Resource_Allocation_master.Staff_Name = Staff_Master.Staff_Id
LEFT OUTER JOIN Task_Master ON Resource_Allocation_master.Task_Name = Task_Master.Task_Id
AND Cast(Convert(varchar(20),Task_Master.Start_Date,101) As datetime) >= Cast(Convert(varchar(20),@DateFrom,101) as datetime)
AND Cast(Convert(varchar(20),Task_Master.End_Date,101) As datetime) <= Cast(Convert(varchar(20),@DateTo,101) as datetime)
LEFT OUTER JOIN Project_Master ON Project_Master.ProjectId = Task_Master.Project_Name
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Employee_Payslip_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Employee_Payslip_Master]
	@Staff_Name  int,
	@Year  float,
	@Month  float,
	@Working_Day  float,
	@Attendance_Day  float,
	@Basic  float,
	@HRA  float,
	@Conveyance  float,
	@Medical  float,
	@CCA  float,
	@Advance  float,
	@PF  float,
	@ESI  float,
	@PT  float,
	@TDS  float,
	@Arrears  float,
	@Traval  float,
	@cdate  datetime,
	@mdate  datetime,
	@Pay_State bit
AS
BEGIN
	IF NOT EXISTS( SELECT 1 FROM [Employee_Payslip_Master] WHERE [Staff_Name] = @Staff_Name 
	AND  [Year]=@Year AND [Month] =@Month)
	BEGIN
		INSERT INTO  [Employee_Payslip_Master]
		(
			[Staff_Name],
			[Year],
			[Month],
			[Working_Day],
			[Attendance_Day],
			[Basic],
			[HRA],
			[Conveyance],
			[Medical],
			[CCA],
			[Advance],
			[PF],
			[ESI],
			[PT],
			[TDS],
			[Arrears],
			[Traval],
			[cdate],
			[mdate],
			[Pay_State]
		)
		VALUES
		(
			@Staff_Name,
			@Year,
			@Month,
			@Working_Day,
			@Attendance_Day,
			@Basic,
			@HRA,
			@Conveyance,
			@Medical,
			@CCA,
			@Advance,
			@PF,
			@ESI,
			@PT,
			@TDS,
			@Arrears,
			@Traval,
			@cdate,
			@mdate,
			@Pay_State
		)
	END
	ELSE
	BEGIN
		UPDATE [Employee_Payslip_Master] SET
			[Staff_Name] = @Staff_Name,
			[Year] = @Year,
			[Month] = @Month,
			[Working_Day] = @Working_Day,
			[Attendance_Day] = @Attendance_Day,
			[Basic] = @Basic,
			[HRA] = @HRA,
			[Conveyance] = @Conveyance,
			[Medical] = @Medical,
			[CCA] = @CCA,
			[Advance] = @Advance,
			[PF] = @PF,
			[ESI] = @ESI,
			[PT] = @PT,
			[TDS] = @TDS,
			[Arrears] = @Arrears,
			[Traval] = @Traval,
			[cdate] = @cdate,
			[mdate] = @mdate
		WHERE [Staff_Name] = @Staff_Name AND  [Year]=@Year AND [Month] =@Month
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Engineers_Based_Points]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Engineers_Based_Points]  
    @Staff_Id INT =NULL,  
    @Project_Id INT =NULL,  
    @Company_Unit_Id INT =NULL,  
    @Process_Id INT =NULL,  
    @DateFrom DATETIME =NULL,  
    @DateTo DATETIME =NULL,  
    @Engineers_Id INT =NULL,  
    @Designation_Id INT =NULL  
AS  
BEGIN        
     
   SELECT staff.Staff_Name,staff.Staff_Id,TempPoints.Points,TempPoints.Task_Count,  
   TempPoints.Process_Name,TempPoints.Process_Id,Point_Index FROM VW_ACtive_STAFF_Master As staff  
   LEFT OUTER JOIN(  
   SELECT DISTINCT c.Staff_Name,c.Staff_Id, d.Process_Id,  
   d.Process_Name,  
   Case  WHEN ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)THEN 'A'  ELSE 'B' END As Point_Index,   
   Sum(DISTINCT  ISNULL(ISNULL(g.difficulty,e.difficulty),d.difficulty)) * Sum(DISTINCT ISNULL(ISNULL(g.Points,e.Points),d.Points)) * Sum(DISTINCT ISNULL(f.Incentive_Points,1))  As Points,  
   Count( DISTINCT b.Task_Name) AS Task_Count FROM   
    Staff_Master c  
   INNER JOIN Project_Task_Master a  ON a.Entered_By= c.Staff_Id
   INNER JOIN Project_Resource_Master b ON  a.Task_Id = b.Task_Name    
   INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id   
   INNER JOIN Designation_Master f ON f.Designation_Id = c.Designation_Name   
   INNER JOIN VW_Resource_Count r ON a.Task_Id=b.Task_Name    
   LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id   
   LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name  
   WHERE   
   (@DateFrom between Start_Date and End_Date  
    OR  
    @DateTo between Start_Date and End_Date)  
   AND  
   ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)  
   AND a.Project_Name=CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE a.Project_Name END  
   AND a.Process_Id=CASE WHEN @Process_Id IS NOT NULL THEN @Process_Id ELSE a.Process_Id END  
   AND a.Entered_By=CASE WHEN @Engineers_Id IS NOT NULL THEN @Engineers_Id ELSE a.Entered_By END  
   GROUP BY c.Staff_Name, d.Process_Id, d.Process_Name,c.Staff_Id,  
   Case  WHEN ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)THEN 'A'  ELSE 'B' END ) as TempPoints  
   ON TempPoints.Staff_Id = staff.Staff_Id        
   WHERE staff.Staff_Id=CASE WHEN @Staff_Id IS NOT NULL THEN @Staff_Id ELSE staff.Staff_Id  END      
   AND staff.Company_Unit_Name= @Company_Unit_Id 
   AND staff.Staff_Id IN ( SELECT Entered_By  FROM Project_Task_Master)   
   AND staff.Designation_Name=CASE WHEN @Designation_Id IS NOT NULL THEN @Designation_Id ELSE staff.Designation_Name  END  
   ORDER BY staff.Staff_Name ASC  
     
END  

GO
/****** Object:  StoredProcedure [dbo].[Sp_GetdateInfo]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetdateInfo]
@DateFrom datetime,
@DateTo datetime
AS
BEGIN
DECLARE @dtmNextDate DATETIME
SET @dtmNextDate =  @DateFrom
create table #DayList
(
MonthDay varchar(20),
FullDate DATETIME
)

WHILE(@dtmNextDate <=@DateTo)
BEGIN

INSERT INTO #DayList (MonthDay,FullDate)
VALUES (CAST(DATENAME(MONTH,@dtmNextDate)AS VARCHAR(3))+ CASE WHEN DATENAME(DD,@dtmNextDate)<10 Then '0'+DATENAME(DD,@dtmNextDate) Else DATENAME(DD,@dtmNextDate) End,@dtmNextDate)
SET @dtmNextDate  = DATEADD(dd,1,@dtmNextDate )
END
SELECT * FROM #DayList
DROP TABLE #DayList

END

GO
/****** Object:  StoredProcedure [dbo].[Sp_GetMonthInfo]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetMonthInfo]
@DateFrom datetime,
@DateTo datetime
AS
BEGIN
DECLARE @dtmNextDate DATETIME
SET @dtmNextDate = CAST( '1' +'-'+ CAST(DATENAME(MONTH,@DateFrom)AS VARCHAR(3))+'-'+ CAST(YEAR(@DateFrom) AS VARCHAR) AS DATETIME)

create table #DayList
(
MonthYear varchar(20),
FullDate DATETIME
)

WHILE(@dtmNextDate <=@DateTo)
BEGIN

INSERT INTO #DayList (MonthYear,FullDate)
VALUES (CAST(DATENAME(MONTH,@dtmNextDate)AS VARCHAR(3))+ DATENAME(YY,@dtmNextDate) ,@dtmNextDate)
SET @dtmNextDate  = DATEADD(MM,1,@dtmNextDate )

END
SELECT * FROM #DayList
DROP TABLE #DayList

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Happy_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Happy_Master]
@Happy_Id  int,
@Happy_Date  datetime,
@Staff_Name  int,
@Happy_Status  int,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Unit  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Happy_Master] WHERE Month(Happy_Date)= Month(@Happy_Date) AND Year(Happy_Date)= Year(@Happy_Date) AND Staff_Name = @Staff_Name)
BEGIN
INSERT INTO  [Happy_Master]
(
[Happy_Date],
[Staff_Name],
[Happy_Status],
[Remarks],
[Entered_By],
[Entered_Unit],
[Entered_Date]
)
VALUES
(
@Happy_Date,
@Staff_Name,
@Happy_Status,
@Remarks,
@Entered_By,
@Entered_Unit,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Happy_Master] SET
[Happy_Date] = @Happy_Date,
[Staff_Name] = @Staff_Name,
[Happy_Status] = @Happy_Status,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Unit] = @Entered_Unit,
[Entered_Date] = @Entered_Date
WHERE Month(Happy_Date)= Month(@Happy_Date) AND Year(Happy_Date)= Year(@Happy_Date) AND Staff_Name = @Staff_Name
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Happy_Status_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Happy_Status_Master]
@Status_Id  int,
@Status_Name  varchar(50),
@Color_Code  varchar(10),
@Entered_Date  datetime,
@Entered_By  int,
@Score  decimal(7,2)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Happy_Status_Master] WHERE [Status_Id]=@Status_Id )
BEGIN
INSERT INTO  [Happy_Status_Master]
(
[Status_Name],
[Color_Code],
[Entered_Date],
[Entered_By],
[Score]
)
VALUES
(
@Status_Name,
@Color_Code,
@Entered_Date,
@Entered_By,
@Score
)
END
ELSE
BEGIN
UPDATE [Happy_Status_Master] SET
[Status_Name] = @Status_Name,
[Color_Code] = @Color_Code,
[Entered_Date] = @Entered_Date,
[Entered_By] = @Entered_By,
[Score] = @Score
WHERE [Status_Id]=@Status_Id
END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Holiday_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Holiday_Master]
@Holiday_Id  int,
@Company_Name  int,
@Company_Unit_Name  int,
@Holiday_For  varchar(250),
@Holiday_From  datetime,
@Holiday_To  datetime,
@Holiday_Details  varchar(1000),
@Remarks  varchar(500),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Holiday_Master] WHERE [Holiday_Id]=@Holiday_Id )
BEGIN
INSERT INTO  [Holiday_Master]
(
[Company_Name],
[Company_Unit_Name],
[Holiday_For],
[Holiday_From],
[Holiday_To],
[Holiday_Details],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Company_Name,
@Company_Unit_Name,
@Holiday_For,
@Holiday_From,
@Holiday_To,
@Holiday_Details,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Holiday_Master] SET
[Company_Name] = @Company_Name,
[Company_Unit_Name] = @Company_Unit_Name,
[Holiday_For] = @Holiday_For,
[Holiday_From] = @Holiday_From,
[Holiday_To] = @Holiday_To,
[Holiday_Details] = @Holiday_Details,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Holiday_Id]=@Holiday_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Leave_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Leave_Master]
@Leave_Id  int,
@Company_Name  int,
@Company_Unit_Name  int,
@Department_Name  int,
@Team_Name  int,
@Designation_Name  int,
@Staff_Name  int,
@Leave_From  datetime,
@Leave_To  datetime,
@Total_Leave  decimal(5,2),
@Reason_for_leave  varchar(1000),
@Remarks  varchar(1000),
@Entered_Unit  int,
@Entered_By  int,
@Entered_Date  datetime,
@LeaveType VARCHAR(10),
@Leave_Approve VARCHAR(20)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Leave_Master] WHERE [Leave_Id]=@Leave_Id )
BEGIN
INSERT INTO  [Leave_Master]
(
[Company_Name],
[Company_Unit_Name],
[Department_Name],
[Team_Name],
[Designation_Name],
[Staff_Name],
[Leave_From],
[Leave_To],
[Total_Leave],
[Reason_for_leave],
[Remarks],
[Entered_Unit],
[Entered_By],
[Entered_Date],
[Approve_Status],
[Approve_By] ,
[LeaveType] ,
[Approved_Date]
)
VALUES
(
@Company_Name,
@Company_Unit_Name,
@Department_Name,
@Team_Name,
@Designation_Name,
@Staff_Name,
@Leave_From,
@Leave_To,
@Total_Leave,
@Reason_for_leave,
@Remarks,
@Entered_Unit,
@Entered_By,
@Entered_Date,
@Leave_Approve,
@Entered_By,
@LeaveType,
CASE WHEN @Leave_Approve IS NULL THEN NULL ELSE GETDATE() END

)
END
ELSE
BEGIN
UPDATE [Leave_Master] SET
[Company_Name] = @Company_Name,
[Company_Unit_Name] = @Company_Unit_Name,
[Department_Name] = @Department_Name,
[Team_Name] = @Team_Name,
[Designation_Name] = @Designation_Name,
[Staff_Name] = @Staff_Name,
[Leave_From] = @Leave_From,
[Leave_To] = @Leave_To,
[Total_Leave] = @Total_Leave,
[Reason_for_leave] = @Reason_for_leave,
[Remarks] = @Remarks,
[Entered_Unit] = @Entered_Unit,
[Approve_Status]=@Leave_Approve,
[Approve_By] = CASE WHEN @Leave_Approve IS NULL THEN NULL ELSE @Entered_By END,
[Approved_Date] = CASE WHEN @Leave_Approve IS NULL THEN NULL ELSE GETDATE() END,
LeaveType = @LeaveType
WHERE [Leave_Id]=@Leave_Id
END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Leave_Report]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Leave_Report]
@Year INT,
@Month INT,
@Staff_Id INT
AS
BEGIN
DECLARE @Late_Coming TIME,
@Early_leaving TIME,
@No_Of_Late tinyint,
@Loss_Of_Pay decimal(5,2)


SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,
@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay
FROM [Attendance_Configuration]

IF  @Month =0
BEGIN

SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when Approve_Status = 'Approved' Then 1 Else 0 End
AS AryPosition FROM Leave_Master
WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To)
AND Staff_Name=@Staff_Id AND ISNULL(Approve_Status,'Not Approved')  IN ('Not Approved','Approved' )
GROUP BY Staff_Name, case when Approve_Status = 'Approved' Then 1 Else 0 End
UNION
SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when LeaveType = 'C' Then 2 when LeaveType = 'M' Then 3 End
AS AryPosition FROM Leave_Master
WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To)
AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'
group by Staff_Name, case when LeaveType = 'C' Then 2 when LeaveType = 'M' Then 3 End
END
ELSE
BEGIN


SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when Approve_Status = 'Approved' Then 1 Else 0 End
AS AryPosition FROM Leave_Master
WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To) AND @Month BETWEEN Month(Leave_From) AND Month(Leave_To)
AND Staff_Name=@Staff_Id AND ISNULL(Approve_Status,'Not Approved')  IN ('Not Approved','Approved' )
GROUP BY Staff_Name, case when Approve_Status = 'Approved' Then 1 Else 0 End
UNION
SELECT Staff_Name,SUM(Leave_Master.Total_Leave) As Total,case when LeaveType = 'C' Then 2 when LeaveType = 'M' Then 3 End
AS AryPosition FROM Leave_Master
WHERE @Year BETWEEN YEAR(Leave_From) AND YEAR(Leave_To) AND @Month BETWEEN Month(Leave_From) AND Month(Leave_To)
AND Staff_Name=@Staff_Id AND LeaveType in('C','M') and Approve_Status = 'Approved'
group by Staff_Name, case when LeaveType = 'C' Then 2 when LeaveType = 'M' Then 3 End



END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Module_Access_Rights]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Module_Access_Rights]
@Access_Id  int,
@Module_Name  int,
@Sub_Module_Name  int,
@Department_Name  int,
@Designation_Name  int,
@Staff_Id  int,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int,
@Is_Active bit
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Module_Access_Rights] WHERE [Sub_Module_Name]=@Sub_Module_Name AND [Staff_Id] = @Staff_Id )
BEGIN
INSERT INTO  [Module_Access_Rights]
(
[Module_Name],
[Sub_Module_Name],
[Department_Name],
[Designation_Name],
[Staff_Id],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit],
[Is_Active]
)
VALUES
(
@Module_Name,
@Sub_Module_Name,
@Department_Name,
@Designation_Name,
@Staff_Id,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit,
@Is_Active
)
END
ELSE
BEGIN
UPDATE [Module_Access_Rights] SET
[Module_Name] = @Module_Name,
[Sub_Module_Name] = @Sub_Module_Name,
[Department_Name] = @Department_Name,
[Designation_Name] = @Designation_Name,
[Staff_Id] = @Staff_Id,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit,
[Is_Active] = @Is_Active
WHERE [Sub_Module_Name]=@Sub_Module_Name AND [Staff_Id] = @Staff_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Module_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Module_Master]
@Module_Id  int,
@Module_Name  varchar(75),
@Is_Active  bit,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Module_Master] WHERE [Module_Id]=@Module_Id )
BEGIN
INSERT INTO  [Module_Master]
(
[Module_Name],
[Is_Active],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Module_Name,
@Is_Active,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Module_Master] SET
[Module_Name] = @Module_Name,
[Is_Active] = @Is_Active,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Module_Id]=@Module_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Pay_Settings_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Pay_Settings_Master]
	@KeyField  int,
	@Company_Name  int,
	@Company_Unit_Name  int,
	@PF_Basic_Limit  float,
	@PF_Percentage  float,
	@PF_Max_Amount  float,
	@ESI_Percentage  float,
	@ESI_Basic_Limit  float,
	@PT_Basic_Limit  float,
	@PT_Amount  float,
	@Description  varchar(1000),
	@cdate  datetime,
	@mdate  datetime
AS
BEGIN
	IF NOT EXISTS( SELECT * FROM [Pay_Settings_Master] WHERE [KeyField]=@KeyField )
	BEGIN
		INSERT INTO  [Pay_Settings_Master]
		(
			[Company_Name],
			[Company_Unit_Name],
			[PF_Basic_Limit],
			[PF_Percentage],
			[PF_Max_Amount],
			[ESI_Percentage],
			[ESI_Basic_Limit],
			[PT_Basic_Limit],
			[PT_Amount],
			[Description],
			[cdate],
			[mdate]
		)
		VALUES
		(
			@Company_Name,
			@Company_Unit_Name,
			@PF_Basic_Limit,
			@PF_Percentage,
			@PF_Max_Amount,
			@ESI_Percentage,
			@ESI_Basic_Limit,
			@PT_Basic_Limit,
			@PT_Amount,
			@Description,
			@cdate,
			@mdate
		)
	END
	ELSE
	BEGIN
		UPDATE [Pay_Settings_Master] SET
			[Company_Name] = @Company_Name,
			[Company_Unit_Name] = @Company_Unit_Name,
			[PF_Basic_Limit] = @PF_Basic_Limit,
			[PF_Percentage] = @PF_Percentage,
			[PF_Max_Amount] = @PF_Max_Amount,
			[ESI_Percentage] = @ESI_Percentage,
			[ESI_Basic_Limit] = @ESI_Basic_Limit,
			[PT_Basic_Limit] = @PT_Basic_Limit,
			[PT_Amount] = @PT_Amount,
			[Description] = @Description,
			[cdate] = @cdate,
			[mdate] = @mdate
		 WHERE [KeyField]=@KeyField
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Payslip_Configuration]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Payslip_Configuration]
	@Staff_Id INT = NULL,
	@Company_Unit_Id INT = NULL,
	@Department_Id INT =NULL,
	@Type INT = NULL,
	@LoadType INT = 0,
	@Year INT = NULL,
	@Month INT = NULL
AS
BEGIN

	IF ( @LoadType = 0 )
	BEGIN
		SELECT Staff.Staff_Id,
		Staff.Staff_Name,
		Staff.PF_Account_No,
		Staff.ESI_Card_No,	
		Pay.* FROM Staff_Master As Staff
		LEFT OUTER JOIN Payslip_Master Pay ON Staff.Staff_Id = Pay.Staff_Name 
		WHERE  Staff.Employee_Status='ACTIVE' 
		AND (@Staff_Id IS NULL 
		OR Staff.Staff_Id=@Staff_Id)
		AND (@Company_Unit_Id IS NULL OR Staff.Company_Unit_Name=@Company_Unit_Id)
		AND (@Department_Id IS NULL OR Staff.Department_Name=@Department_Id)
		AND CASE WHEN Pay.Pay_Id IS NULL AND @Type <> 0 THEN 2 
				 WHEN Pay.Pay_Id IS NOT NULL
					  AND @Type <> 0 THEN 1 
				 ELSE @Type 
			END = @Type
	END
	ELSE IF ( @LoadType = 1 )
	BEGIN
		SELECT Staff.Staff_Id,
		Staff.Staff_Name,
		desg.Designation_Name,
		Staff.PF_Account_No,
		Staff.ESI_Card_No,
		com.Company_Name As [Company_Name],
		comunit.Company_Unit_Name As [Company_Unit_Name],
		comunit.[Address] As [Company_Unit_Address],	
		ISNULL(Pay.[Basic] ,0) AS [Basic],
		ISNULL(Pay.HRA,0) AS HRA,	
		ISNULL(Pay.CCA,0) AS CCA,
		ISNULL( Pay.Medical ,0) AS Medical,
		ISNULL(Pay.Conveyance,0) AS Conveyance,
		ISNULL(Pay.Traval,0) AS Traval,
		ISNULL(EmpPay.TDS,0) AS TDS,
		ISNULL(EmpPay.Advance,0) AS Advance,
		ISNULL(EmpPay.Arrears,0) AS Arrears,
		ISNULL(psm.PF_Basic_Limit,15000) AS PF_Basic_Limit,
		ISNULL(psm.PF_Percentage,12) AS PF_Percentage,
		ISNULL(psm.PF_Max_Amount,1800) AS PF_Max_Amount,
		ISNULL(psm.ESI_Basic_Limit,15000) AS ESI_Basic_Limit,
		ISNULL(psm.ESI_Percentage,1.75) AS ESI_Percentage,
		ISNULL(psm.PT_Basic_Limit,15000) AS PT_Basic_Limit,
		ISNULL(psm.PT_Amount,200) AS PT_Amount
		FROM Staff_Master As Staff
		LEFT OUTER JOIN Designation_Master desg ON Staff.Designation_Name = desg.Designation_Id
		INNER JOIN Payslip_Master Pay ON Staff.Staff_Id = Pay.Staff_Name
		LEFT JOIN Employee_Payslip_Master EmpPay 
		ON Staff.Staff_Id = EmpPay.Staff_Name
		AND [YEAR]=@Year AND [Month]=@Month 
		LEFT OUTER JOIN Pay_Settings_Master psm ON Staff.Company_Unit_Name = psm.Company_Unit_Name
		LEFT OUTER JOIN Company_Unit_Master comunit ON Staff.Company_Unit_Name = comunit.Unit_Id
		LEFT OUTER JOIN Company_Master com ON Staff.Company_Name = com.Company_Id
		AND comunit.Company_Name = com.Company_Id
		WHERE  Staff.Employee_Status='ACTIVE' 
		AND (@Staff_Id IS NULL OR Staff.Staff_Id=@Staff_Id)
		AND (@Company_Unit_Id IS NULL OR Staff.Company_Unit_Name=@Company_Unit_Id)
		AND (@Department_Id IS NULL OR 
		Staff.Department_Name=@Department_Id)
		AND CASE WHEN EmpPay.Emp_Pay_Id IS NULL 
					  AND @Type <> 0 THEN 2 
				 WHEN EmpPay.Emp_Pay_Id IS NOT NULL 
					  AND @Type <> 0 THEN 1 
				 ELSE @Type 
			END = @Type
	END
	ELSE IF(@LoadType = 2)
	BEGIN
		SELECT Staff.Staff_Id,
		Staff.Staff_Name,
		desg.Designation_Name,
		Staff.PF_Account_No,
		Staff.ESI_Card_No,	
		com.Company_Name As [Company_Name],
		comunit.Company_Unit_Name As [Company_Unit_Name],
		comunit.[Address] As [Company_Unit_Address],
		EmpPay.[Year] As [Year],
		EmpPay.[Month] As [Month],
		EmpPay.[Working_Day] As [Working_Day],
		EmpPay.[Attendance_Day] As [Attendance_Day],
		ISNULL(EmpPay.[Basic] ,0) AS [Basic],
		ISNULL(EmpPay.HRA,0) AS HRA,	
		ISNULL(EmpPay.CCA,0) AS CCA,
		ISNULL(EmpPay.Medical ,0) AS Medical,
		ISNULL(EmpPay.Conveyance,0) AS Conveyance,
		ISNULL(EmpPay.Traval,0) AS Traval,
		ISNULL(EmpPay.TDS,0) AS TDS,
		ISNULL(EmpPay.Advance,0) AS Advance,
		ISNULL(EmpPay.PT,0) AS PT,
		ISNULL(EmpPay.ESI,0) AS ESI,
		ISNULL(EmpPay.PF,0) AS PF,
		ISNULL(EmpPay.Arrears,0) AS Arrears,
		ISNULL(psm.PF_Basic_Limit,15000) AS PF_Basic_Limit,
		ISNULL(psm.PF_Percentage,12) AS PF_Percentage,
		ISNULL(psm.PF_Max_Amount,1800) AS PF_Max_Amount,
		ISNULL(psm.ESI_Basic_Limit,15000) AS ESI_Basic_Limit,
		ISNULL(psm.ESI_Percentage,1.75) AS ESI_Percentage,
		ISNULL(psm.PT_Basic_Limit,15000) AS PT_Basic_Limit,
		ISNULL(psm.PT_Amount,200) AS PT_Amount
		FROM Staff_Master As Staff
		LEFT OUTER JOIN Designation_Master desg ON Staff.Designation_Name = desg.Designation_Id
		INNER JOIN Employee_Payslip_Master EmpPay 
		ON Staff.Staff_Id = EmpPay.Staff_Name
		LEFT OUTER JOIN Pay_Settings_Master psm ON Staff.Company_Unit_Name = psm.Company_Unit_Name
		LEFT OUTER JOIN Company_Unit_Master comunit ON Staff.Company_Unit_Name = comunit.Unit_Id
		LEFT OUTER JOIN Company_Master com ON Staff.Company_Name = com.Company_Id
		AND comunit.Company_Name = com.Company_Id
		WHERE  Staff.Employee_Status='ACTIVE' 
		AND [YEAR]=@Year AND [Month]=@Month AND Pay_State=1
		AND (@Staff_Id IS NULL OR
		Staff.Staff_Id=@Staff_Id )
		AND (@Company_Unit_Id IS NULL OR 
		Staff.Company_Unit_Name=@Company_Unit_Id)
		AND (@Department_Id IS NULL OR 
		Staff.Department_Name=@Department_Id)
		AND CASE WHEN EmpPay.Emp_Pay_Id IS NULL 
					  AND @Type <> 0 THEN 2 
				 WHEN EmpPay.Emp_Pay_Id IS NOT NULL 
					  AND @Type <> 0 THEN 1 
				 ELSE @Type 
			END = @Type
	END
END



GO
/****** Object:  StoredProcedure [dbo].[SP_Payslip_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Payslip_Master]
	@Staff_Name  int,
	@Basic  float,
	@HRA  float,
	@Conveyance  float,
	@Medical  float,
	@CCA  float,
	@Traval  float	
AS
BEGIN
	IF NOT EXISTS( SELECT 1 FROM [Payslip_Master] WHERE Staff_Name=@Staff_Name )
	BEGIN
		INSERT INTO  [Payslip_Master]
		(
			[Staff_Name],
			[Basic],
			[HRA],
			[Conveyance],
			[Medical],
			[CCA],
			[Traval],
			[cdate],
			[mdate]
		)
		VALUES
		(
			@Staff_Name,
			@Basic,
			@HRA,
			@Conveyance,
			@Medical,
			@CCA,
			@Traval,
			GetDate(),
			GetDate()
		)
	END
	ELSE
	BEGIN
	
		IF NOT EXISTS( SELECT 1 FROM [Payslip_Master] WHERE Staff_Name=@Staff_Name AND
			( [Basic] <> @Basic OR
			[HRA] <> @HRA OR
			[Conveyance] <> @Conveyance OR
			[Medical] <> @Medical OR
			[CCA] <> @CCA OR
			[Traval]<>@Traval )			
		)
		BEGIN
			INSERT INTO [Payslip_Master_History] (
			[Pay_Id],
			[Staff_Name],
			[Basic],
			[HRA],
			[Conveyance],
			[Medical],
			[CCA],
			[Traval])
			SELECT 	[Pay_Id],[Staff_Name],
			[Basic],
			[HRA],
			[Conveyance],
			[Medical],
			[CCA],
			[Traval] FROM [Payslip_Master] WHERE Staff_Name=@Staff_Name 
		END
			 
		UPDATE [Payslip_Master] SET
			[Staff_Name] = @Staff_Name,
			[Basic] = @Basic,
			[HRA] = @HRA,
			[Conveyance] = @Conveyance,
			[Medical] = @Medical,
			[CCA] = @CCA,
			[Traval] = @Traval,
			[mdate] = GetDate()
		 WHERE Staff_Name=@Staff_Name
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Pending_Task_Mapping]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Pending_Task_Mapping]
@Pending_Task_Id INT OUTPUT,
@Task_Identity INT,
@Task_Type VARCHAR(30),
@Staff_Name INT
AS
BEGIN
IF NOT EXISTS( SELECT * FROM Pending_Task_Mapping WHERE Task_Identity=@Task_Identity AND Task_Type = @Task_Type AND Staff_Name=@Staff_Name )
BEGIN

INSERT INTO Pending_Task_Mapping
(
Task_Identity ,
Task_Type ,
Staff_Name
)
VALUES
(

@Task_Identity ,
@Task_Type ,
@Staff_Name
)
SET @Pending_Task_Id = @@IDENTITY
END
ELSE
BEGIN

SELECT @Pending_Task_Id = Pending_Task_Id FROM Pending_Task_Mapping WHERE Task_Identity=@Task_Identity AND Task_Type = @Task_Type AND Staff_Name=@Staff_Name

END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ProcedureToInsertQuatation]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohan Sankri
-- Create date: 21-Jun-2014
-- Description:	To insert Quatation data into respective table
-- =============================================
CREATE PROCEDURE [dbo].[sp_ProcedureToInsertQuatation]
@QuatationID AS INT,
@Manhours   AS INT,
@AmountPerManhour AS DECIMAL(18,2),
@ClientID AS INT,
@TaskId AS INT,
@EnteredBy AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tblQuotations (QuatationNo, ClientId, TaskId, NoOfManhour, AmountOfManhour, EnterdBy, EnteredDate)
	VALUES(@QuatationID,@ClientID,@TaskId,@Manhours,@AmountPerManhour,@EnteredBy,GETDATE())
	
	   SELECT @@Identity AS Id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ProcedureToInsertQuatationItemDetail]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohan Sankri
-- Create date: 21-Jun-2014
-- Description:	To insert Quatation data into respective table
-- =============================================
CREATE PROCEDURE [dbo].[sp_ProcedureToInsertQuatationItemDetail]
@QuatationID AS INT,
@Price AS FLOAT,
@Quantity AS DECIMAL(10,2),
@TaskId AS INT,
@ItemID AS INT,
@EnteredBy AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tblQuotationTaskItems (QuotationId, TaskId, ItemID, Price, Quantity, EnteredBy, EnteredDate)
	VALUES(@QuatationID,@TaskId,@ItemID,@Price,@Quantity,@EnteredBy,GETDATE())
	
	   SELECT @@Identity AS Id
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Information]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Process_Information]          
 @Project_Id INT,          
 @Process_Id INT ,          
 @Start_Date DATETIME = NULL,          
 @End_Date DATETIME = NULL        
 As          
BEGIN           
            
 SELECT a.Process_Id,a.Process_Name, ISNULL(b.Difficulty ,ISNULL(a.Difficulty,1)) AS DiffiCulty, ISNULL(b.Points,ISNULL(a.Points,1)) AS Points,          
 CAST(CASE WHEN DATEDIFF(DD,@Start_Date,@End_Date )+1 <= ISNULL(b.No_Of_Days ,ISNULL(a.No_Of_Days,1)) THEN 1 ELSE 0 END AS BIT) AS Task_Check  ,      
 ISNULL(b.No_Of_Days ,ISNULL(a.No_Of_Days,1)) As No_Of_Days   ,    
 ISNULL(b.No_Of_Staffs,ISNULL(a.No_Of_Staffs,1)) As No_Of_Staffs,
 ISNULL(b.Email_Configuration,a.Email_Configuration) As Email_Configuration          
 FROM Process_Master a          
 LEFT OUTER JOIN Project_Process_Master b ON a.Process_Id= b.Process_Name AND Project_Name=@Project_Id          
 WHERE a.Company_Unit_Name IN (SELECT Entered_Unit FROM Project_Master WHERE ProjectId=@Project_Id )          
 AND a.Process_Id= CASE WHEN @Process_Id IS NULL THEN a.Process_Id ELSE @Process_Id END          
     
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_Process_Master]      
@Process_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Process_Name  varchar(100),      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),
@No_Of_Hours INT,
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT ,
@Skill_Id VARCHAR(1000),
@Department_Id INT,
@Project_Specific VARCHAR(10)  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Process_Master] WHERE [Process_Id]=@Process_Id )      
BEGIN      
INSERT INTO  [Process_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Process_Name],      
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number],
[Skill_Id],
[Department_Id],
[Project_Specific]      
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Process_Name,      
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number,
@Skill_Id,
@Department_Id,
@Project_Specific  
)      
END      
ELSE      
BEGIN      
UPDATE [Process_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  , 
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number ,
[Skill_Id] = @Skill_Id,
[Department_Id] = @Department_Id,
[Project_Specific] = @Project_Specific
WHERE [Process_Id]=@Process_Id      
END      
END 



GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Master_2015-03-16]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Process_Master_2015-03-16]      
@Process_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Process_Name  varchar(100),      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Process_Master] WHERE [Process_Id]=@Process_Id )      
BEGIN      
INSERT INTO  [Process_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Process_Name],      
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number]     
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Process_Name,      
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number  
)      
END      
ELSE      
BEGIN      
UPDATE [Process_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  ,  
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number 
WHERE [Process_Id]=@Process_Id      
END      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Master_2015-06-18]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Process_Master_2015-06-18]      
@Process_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Process_Name  varchar(100),      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),
@No_Of_Hours INT,
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Process_Master] WHERE [Process_Id]=@Process_Id )      
BEGIN      
INSERT INTO  [Process_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Process_Name],      
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number]     
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Process_Name,      
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number  
)      
END      
ELSE      
BEGIN      
UPDATE [Process_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  , 
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number 
WHERE [Process_Id]=@Process_Id      
END      
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESS_MASTER_REPORT]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[SP_PROCESS_MASTER_REPORT]      
    
   @STAFF_ID INT =NULL,        
    
   @PROJECT_ID INT =NULL,        
    
   @COMPANY_UNIT_ID INT =NULL,        
    
   @PROCESS_ID INT =NULL,        
    
   @DATEFROM DATETIME =NULL,        
    
   @DATETO DATETIME =NULL,        
    
   @ENGINEERS_ID INT =NULL,    
    
   @Filter INT = NULL      
    
        
    
AS        
    
BEGIN      
    
With T(Project_Name,ProjectId,PROCESS_NAME,PROCESS_ID,NO_OF_DAYS,NO_OF_STAFFS,ACTUAL_DAYS,Process_State,    
    
Actual_Plan_Start,Actual_Plan_End,PLANNED_START_DATE,PLANNED_END_DATE,RESOURCE_COUNT,Task_Count,COMPLETED_DATE    
    
)    
    
AS    
    
(      
    
SELECT Temp.Project_Name,Temp.ProjectId,Temp.PROCESS_NAME,Temp.PROCESS_ID,Temp.NO_OF_DAYS,    
    
Temp.NO_OF_STAFFS , Sum(Temp.ACTUAL_DAYS) AS ACTUAL_DAYS,    
    
MAX(CASE  Temp.PROCESS_STATUS   WHEN 'completed' THEN 2      
    
  WHEN 'inprogress' THEN 3      
    
  WHEN 'warning' THEN 5      
    
  WHEN 'completedwarning' THEN 4     
    
  WHEN 'planned' THEN 1       
    
  ELSE 0 END ) AS Process_State,    
    
  Min(ACTUAL_START_DATE) As Actual_Plan_Start ,Max(ACTUAL_END_DATE) As Actual_Plan_End    
    
 ,Min(PLANNED_START_DATE) AS PLANNED_START_DATE,  Max(PLANNED_END_DATE) AS PLANNED_END_DATE    
    
 ,Sum(RESOURCE_COUNT) As RESOURCE_COUNT, Sum(TASK_COUNT) As Task_Count,Max(COMPLETED_DATE) AS COMPLETED_DATE    
    
FROM       
    
(      
    
SELECT F.ProjectId,F.Project_Name+'['+ ISNULL(Project_Short_Name,'')+']' AS Project_Name,    
    
D.PROCESS_NAME,A.PROCESS_ID,A.TASK_ID,    
    
MIN(A.START_DATE) AS ACTUAL_START_DATE,            
    
MAX(A.END_DATE) AS ACTUAL_END_DATE,     
    
MIN(PLANNED_START_DATE) AS PLANNED_START_DATE,     
    
MAX(PLANNED_END_DATE) AS PLANNED_END_DATE,       
    
MAX(Completed_Date) AS COMPLETED_DATE,           
    
Sum(DATEDIFF(DD,A.START_DATE,A.END_DATE)+1) AS ACTUAL_DAYS,            
    
COUNT(DISTINCT C.STAFF_NAME ) AS RESOURCE_COUNT,              
    
COUNT(DISTINCT A.TASK_NAME) AS TASK_COUNT,    
    
ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS) AS NO_OF_DAYS,              
    
ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0)) AS NO_OF_STAFFS,            
    
CASE  WHEN (DATEDIFF(DD,A.START_DATE,A.END_DATE)+1)<=(ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS))            
    
      AND            
    
      COUNT(DISTINCT C.STAFF_NAME )<= ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0))            
    
      AND            
    
 CAST(A.COMPLETED_DATE AS DATE) BETWEEN A.START_DATE AND A.END_DATE AND A.COMPLETED_DATE  IS NOT NULL THEN            
    
   'completed'            
    
 WHEN A.TASK_STATUS=9  AND (A.COMPLETED_DATE IS NULL) AND  A.End_Date >= (SELECT DATEADD(n,630,GETDATE())) THEN          
    
   'inprogress'           
    
  WHEN A.TASK_STATUS=2  AND (A.COMPLETED_DATE IS NULL) AND A.End_Date >= (SELECT DATEADD(n,630,GETDATE())) THEN          
    
   'planned'           
    
  WHEN   (A.COMPLETED_DATE IS NULL  AND (SELECT DATEADD(n,630,GETDATE())) < A.START_DATE ) THEN        
    
   B.STATUS_VALUE       
    
  WHEN   (A.COMPLETED_DATE IS NOT NULL ) THEN      
    
  'completedwarning'       
  
  WHEN   A.TASK_STATUS=9  AND (A.START_DATE <= (SELECT DATEADD(n,630,GETDATE())) ) THEN      
    
  'inprogress'       
    
    
  ELSE            
    
   'warning'            
    
  END AS PROCESS_STATUS        
    
FROM       
    
Project_Master F       
    
LEFT OUTER JOIN PROJECT_TASK_MASTER A ON F.PROJECTID = A.PROJECT_NAME         
    
LEFT OUTER JOIN TASK_STATUS_MASTER B ON A.TASK_STATUS =B.STATUS_ID            
    
LEFT OUTER JOIN PROJECT_RESOURCE_MASTER C ON C.TASK_NAME = A.TASK_ID              
    
LEFT OUTER JOIN PROCESS_MASTER D ON D.PROCESS_ID = A.PROCESS_ID                 
    
LEFT OUTER JOIN SUB_TASK_MASTER G ON G.PROCESS_TASK_ID=A.SUB_TASK_ID                 
    
LEFT OUTER JOIN PROJECT_PROCESS_MASTER E ON E.PROCESS_NAME=D.PROCESS_ID AND E.PROJECT_NAME = A.PROJECT_NAME           
    
WHERE  F.Entered_Unit= @Company_Unit_Id  and A.TASK_STATUS<>5      
    
AND( EXISTS(SELECT 1 FROM DatesBetween(@DateFrom,@DateTo) AS dtm WHERE dtm.DateValue BETWEEN F.Expected_Start_Date  AND F.Expected_End_Date)     
    
OR @Filter IN(1,2,3,4))    
    
AND A.PROCESS_ID=CASE WHEN @PROCESS_ID IS NOT NULL THEN @PROCESS_ID ELSE A.PROCESS_ID END        
    
AND A.ENTERED_BY=CASE WHEN @ENGINEERS_ID IS NOT NULL THEN @ENGINEERS_ID ELSE A.ENTERED_BY END          
    
AND F.ProjectId =CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE F.ProjectId END        
    
AND CASE WHEN @Filter =0 THEN @Filter     
    
 WHEN @Filter =1 THEN    
    
   CASE WHEN EXISTS(SELECT 1 FROM PROJECT_TASK_MASTER WHERE Task_Status=9 AND PROJECT_NAME = A.PROJECT_NAME ) THEN    
    
   @Filter     
    
   ELSE    
    
    0    
    
   END    
    
 WHEN @Filter =2 THEN      
    
  CASE WHEN EXISTS( SELECT 1 FROM PROJECT_TASK_MASTER WHERE Task_Status!=1 AND PROJECT_NAME = A.PROJECT_NAME) THEN    
    
   0    
    
  ELSE    
    
   @Filter     
    
  END    
    
 WHEN @Filter =3 THEN      
    
  CASE WHEN EXISTS( SELECT 1 FROM VW_PROJECT_TASK_MASTER_LIMIT_PROCESS WHERE Task_Status!=1 AND PROJECT_NAME = A.PROJECT_NAME) THEN    
    
   0    
    
  ELSE    
    
   @Filter     
    
  END    
    
 WHEN @Filter = 4 THEN     
    
  @Filter    
    
 WHEN @Filter =5 THEN      
    
  CASE WHEN EXISTS( SELECT 1 FROM Process_Task_Details WHERE Process_Status='warning' AND ProjectId = A.PROJECT_NAME) THEN    
    
   @Filter     
    
  ELSE    
    
   0    
    
  END     
    
 END = @Filter     
    
GROUP BY F.Project_Name, Project_Short_Name, F.ProjectId,A.PROCESS_ID,A.START_DATE,A.END_DATE, A.TASK_ID,C.STAFF_NAME  ,A.COMPLETED_DATE,  A.TASK_STATUS,             
    
ISNULL(ISNULL(G.NO_OF_DAYS,E.NO_OF_DAYS),D.NO_OF_DAYS), PLANNED_START_DATE, PLANNED_END_DATE,          
    
ISNULL(ISNULL(G.NO_OF_STAFFS,E.NO_OF_STAFFS),ISNULL(D.NO_OF_STAFFS,0)),D.PROCESS_NAME , B.STATUS_VALUE        
    
) AS Temp GROUP BY Temp.Project_Name, Temp.ProjectId,Temp.PROCESS_NAME,Temp.PROCESS_ID,     
    
 Temp.NO_OF_DAYS,    
    
Temp.NO_OF_STAFFS    
    
  )    
    
  SELECT CASE WHEN Process_State= 1 THEN 'Planned'     
    
     WHEN Process_State= 3 THEN 'inprogress'    
    
              WHEN Process_State= 2 THEN 'completed'    
    
              WHEN Process_State= 4 THEN 'completedwarning'    
    
              WHEN Process_State= 5 THEN 'warning' End As Process_Status,    
    
  * FROM T ORDER BY T.ProjectId    
    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Points]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Process_Points]
	@Process_Id INT ,
	@Project_Engineers DECIMAL(7,2),
	@Work_Engineers DECIMAL(7,2),
	@Design_Engineers DECIMAL(7,2)
AS
BEGIN


	IF NOT  EXISTS (SELECT 1 from  Process_Points Where Process_Id=@Process_Id)
	BEGIN
		INSERT INTO Process_Points
		(
			Process_Id ,
			Project_Engineers,
			Work_Engineers,
			Design_Engineers 
		)
		VALUES
		(
			@Process_Id ,
			@Project_Engineers,
			@Work_Engineers,
			@Design_Engineers 
		)
		
	END
	BEGIN
			UPDATE Process_Points SET
			Project_Engineers = @Project_Engineers,
			Work_Engineers =@Work_Engineers,
			Design_Engineers =@Design_Engineers
			WHERE Process_Id=@Process_Id
	END
	
	
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_Process_Sub_Task_Information]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Process_Sub_Task_Information]          
 @Process_TaskId INT,
 @Start_Date DATETIME = NULL,          
 @End_Date DATETIME = NULL        
 As          
BEGIN           
            
 SELECT a.Process_Name, ISNULL(a.Difficulty,1) AS DiffiCulty, ISNULL(a.Points,1) AS Points,          
 CAST(CASE WHEN DATEDIFF(DD,@Start_Date,@End_Date )+1 <=ISNULL(a.No_Of_Days,1) THEN 1 ELSE 0 END AS BIT) AS Task_Check  ,      
 ISNULL(a.No_Of_Days,1) As No_Of_Days   ,    
 ISNULL(a.No_Of_Staffs,1) As No_Of_Staffs         
 FROM Sub_Task_Master a   WHERE Process_Task_Id=@Process_TaskId      
     
END  

GO
/****** Object:  StoredProcedure [dbo].[SP_Product_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Product_Master]      
@Product_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Product_Name  varchar(100),
@Process_Name  int,       
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),
@No_Of_Hours INT,
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Product_Master] WHERE [Product_Id]=@Product_Id )      
BEGIN      
INSERT INTO  [Product_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Product_Name],  
[Process_Name],     
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number]     
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Product_Name,    
@Process_Name,   
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number  
)      
END      
ELSE      
BEGIN      
UPDATE [Product_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Product_Name] = @Product_Name,   
[Process_Name] = @Process_Name,   
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  , 
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number 
WHERE [Product_Id]=@Product_Id      
END      
END 

GO
/****** Object:  StoredProcedure [dbo].[SP_Product_Master_2015-05-27]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Product_Master_2015-05-27]      
@Product_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Product_Name  varchar(100),      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),
@No_Of_Hours INT,
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Product_Master] WHERE [Product_Id]=@Product_Id )      
BEGIN      
INSERT INTO  [Product_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Product_Name],      
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number]     
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Product_Name,      
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number  
)      
END      
ELSE      
BEGIN      
UPDATE [Product_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Product_Name] = @Product_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  , 
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number 
WHERE [Product_Id]=@Product_Id      
END      
END 



GO
/****** Object:  StoredProcedure [dbo].[SP_Product_Master_2015-06-19]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Product_Master_2015-06-19]      
@Product_Id  int,      
@Company_Unit_Name  int,      
@Company_Name  int,      
@Product_Name  varchar(100),   
@Process_Name  varchar(100),    
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Description  varchar(1000),      
@Entered_By  int,      
@Entered_Date  datetime,      
@Entered_Unit  int,    
@Email_Configuration VARCHAR(1000),
@No_Of_Hours INT,
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),
@No_Of_Staffs INT,
@Order_Number INT,
@Skill_Id VARCHAR(1000),
@Department_Id INT,
@Project_Specific VARCHAR(10)  
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Product_Master] WHERE [Product_Id]=@Product_Id )      
BEGIN      
INSERT INTO  [Product_Master]      
(      
[Company_Unit_Name],      
[Company_Name],      
[Product_Name],  
[Process_Name],     
[Difficulty],      
[Points],      
[Description],      
[Entered_By],      
[Entered_Date],      
[Entered_Unit],    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
[No_Of_Days],
[No_Of_Staffs],
[Order_Number],
[Skill_Id],
[Department_Id],
[Project_Specific]     
)      
VALUES      
(      
@Company_Unit_Name,      
@Company_Name,      
@Product_Name,
@Process_Name,      
@Difficulty,      
@Points,      
@Description,      
@Entered_By,      
@Entered_Date,      
@Entered_Unit ,    
@Email_Configuration ,  
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days ,
@No_Of_Staffs,
@Order_Number,
@Skill_Id,
@Department_Id,
@Project_Specific  
)      
END      
ELSE      
BEGIN      
UPDATE [Product_Master] SET      
[Company_Unit_Name] = @Company_Unit_Name,      
[Company_Name] = @Company_Name,      
[Product_Name] = @Product_Name,
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Description] = @Description,      
[Entered_By] = @Entered_By,      
[Entered_Date] = @Entered_Date,      
[Entered_Unit] = @Entered_Unit ,    
Email_Configuration = @Email_Configuration  , 
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days ,
[No_Of_Staffs]=@No_Of_Staffs,
[Order_Number] = @Order_Number,
[Skill_Id] = @Skill_Id,
[Department_Id] = @Department_Id,
[Project_Specific] = @Project_Specific 
WHERE [Product_Id]=@Product_Id      
END      
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_Product_Master_Category]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_Product_Master_Category]
    

@Company_Unit_Name  int,      

@Company_Name  int,      

@Product_Name  varchar(100),

@Process_Name  int,       

@Difficulty  decimal(7,2),      

@Points  decimal(7,2),      

@Description  varchar(1000),      

@Entered_By  int,      

@Entered_Date  datetime,      

@Entered_Unit  int,    

@Email_Configuration VARCHAR(1000),

@No_Of_Hours INT,

@No_Of_Minutes INT,    

@No_Of_Days decimal(7,2),

@No_Of_Staffs INT,

@Order_Number INT  

AS      

BEGIN      
INSERT INTO  [Product_Master]      

(      

[Company_Unit_Name],      

[Company_Name],      

[Product_Name],  

[Process_Name],     

[Difficulty],      

[Points],      

[Description],      

[Entered_By],      

[Entered_Date],      

[Entered_Unit],    

[Email_Configuration] ,  

No_Of_Hours,

No_Of_Minutes,  

[No_Of_Days],

[No_Of_Staffs],

[Order_Number]     

)      

VALUES      

(      

@Company_Unit_Name,      

@Company_Name,      

@Product_Name,    

@Process_Name,   

@Difficulty,      

@Points,      

@Description,      

@Entered_By,      

@Entered_Date,      

@Entered_Unit ,    

@Email_Configuration ,  

@No_Of_Hours,

@No_Of_Minutes,  

@No_Of_Days ,

@No_Of_Staffs,

@Order_Number  

)      

END   
GO
/****** Object:  StoredProcedure [dbo].[SP_Product_Process_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Product_Process_Master]      
@Product_Process_Id  int,      
@Company_Name  int,      
@Company_Unit_Name  int,      
@Project_Name  int,      
@Process_Name  int,      
@Product_Name  int,  
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Remarks  varchar(1000),      
@Entered_Date  datetime,      
@Entered_By  int ,    
@Email_Configuration VARCHAR(1000)  ,  
@No_Of_Hours INT,
@No_Of_Minutes INT,  
@No_Of_Days decimal(7,2),  
@No_Of_Staffs INT
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Product_Process_Master] WHERE [Product_Process_Id]=@Product_Process_Id )      
BEGIN      
INSERT INTO  [Product_Process_Master]      
(      
[Company_Name],      
[Company_Unit_Name],      
[Project_Name],      
[Process_Name], 
[Product_Name],     
[Difficulty],      
[Points],      
[Remarks],      
[Entered_Date],      
[Entered_By]  ,    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
 [No_Of_Days] ,
[No_Of_Staffs]  
)      
VALUES      
(      
@Company_Name,      
@Company_Unit_Name,      
@Project_Name,      
@Process_Name,     
@Product_Name,  
@Difficulty,      
@Points,      
@Remarks,      
@Entered_Date,      
@Entered_By  ,    
@Email_Configuration  , 
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days,   
@No_Of_Staffs   
)      
END      
ELSE      
BEGIN      
UPDATE [Product_Process_Master] SET      
[Company_Name] = @Company_Name,      
[Company_Unit_Name] = @Company_Unit_Name,      
[Project_Name] = @Project_Name,      
[Process_Name] = @Process_Name,  
[Product_Name] = @Product_Name,    
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Remarks] = @Remarks,      
[Entered_Date] = @Entered_Date,      
[Entered_By] = @Entered_By  ,    
Email_Configuration = @Email_Configuration ,  
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes, 
[No_Of_Days]=@No_Of_Days,
[No_Of_Staffs] =@No_Of_Staffs   
WHERE [Product_Process_Id]=@Product_Process_Id      
END      
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Based_Points]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Based_Points]
   @Staff_Id INT =NULL,
   @Project_Id INT =NULL,
   @Company_Unit_Id INT =NULL,
   @Process_Id INT =NULL,
   @DateFrom DATETIME =NULL,
   @DateTo DATETIME =NULL,
   @Engineers_Id INT =NULL,
   @Designation_Id INT =NULL
AS
BEGIN			   

SELECT Project.Project_Name ,Project.ProjectId,TempPoints.Points,TempPoints.Task_Count,
TempPoints.Process_Name,TempPoints.Process_Id,Point_Index FROM Project_Master As Project
LEFT OUTER JOIN(
SELECT DISTINCT p.Project_Name,p.ProjectId, d.Process_Id,
d.Process_Name,
Case  WHEN ( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)THEN 'A'  ELSE 'B' END As Point_Index, 
Sum(DISTINCT  ISNULL(ISNULL(g.difficulty,e.difficulty),d.difficulty)) * Sum(DISTINCT ISNULL(ISNULL(g.Points,e.Points),d.Points)) * Sum(DISTINCT ISNULL(f.Incentive_Points,1))  As Points,
Count( DISTINCT b.Task_Name) AS Task_Count FROM
Project_Master p 
INNER JOIN  Project_Task_Master a  ON a.Project_Name=p.ProjectId 
INNER JOIN Project_Resource_Master b ON  b.Task_Name  = a.Task_Id
INNER JOIN Staff_Master c ON  c.Staff_Id = b.Staff_Name  
INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id 
INNER JOIN Designation_Master f ON f.Designation_Id = c.Designation_Name 
INNER JOIN VW_Resource_Count r ON a.Task_Id=b.Task_Name  
LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id 
LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name
WHERE 
(@DateFrom between a.Start_Date and a.End_Date
OR
@DateTo between a.Start_Date and a.End_Date)
AND
( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)
AND a.Project_Name=CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE a.Project_Name END
AND a.Process_Id=CASE WHEN @Process_Id IS NOT NULL THEN @Process_Id ELSE a.Process_Id END
AND a.Entered_By=CASE WHEN @Engineers_Id IS NOT NULL THEN @Engineers_Id ELSE a.Entered_By END
AND c.Staff_Id=CASE WHEN @Staff_Id IS NOT NULL THEN @Staff_Id ELSE c.Staff_Id  END   
AND c.Designation_Name=CASE WHEN @Designation_Id IS NOT NULL THEN @Designation_Id ELSE C.Designation_Name  END
AND c.Company_Unit_Name= @Company_Unit_Id 
GROUP BY  p.Project_Name,p.ProjectId, d.Process_Id, d.Process_Name,
Case  WHEN ( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)THEN 'A'  ELSE 'B' END ) as TempPoints
ON TempPoints.ProjectId = Project.ProjectId
WHERE  Project.Entered_Unit= @Company_Unit_Id   
AND Project.ProjectId =CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE Project.ProjectId END
ORDER BY Project.Project_Name ASC

END


GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Based_Points_Temp]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Based_Points_Temp]
   @Staff_Id INT =NULL,
   @Project_Id INT =NULL,
   @Company_Unit_Id INT =NULL,
   @Process_Id INT =NULL,
   @DateFrom DATETIME =NULL,
   @DateTo DATETIME =NULL,
   @Engineers_Id INT =NULL,
   @Designation_Id INT =NULL
AS
BEGIN			   
SET NOCOUNT ON
SELECT Project.Project_Name ,Project.ProjectId,TempPoints.Points,TempPoints.Task_Count,
TempPoints.Process_Name,TempPoints.Process_Id,Point_Index FROM Project_Master As Project
INNER JOIN(
SELECT DISTINCT p.Project_Name,p.ProjectId, d.Process_Id,
d.Process_Name,10 As Points,
Case  WHEN ( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (ISNULL(r.Resource_Count,0)<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)THEN 'A'  ELSE 'B' END As Point_Index, 
1 AS Task_Count FROM
Project_Master p 
INNER JOIN  PROJECT_TASK_MASTER a  ON a.Project_Name=p.ProjectId 
INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id 
LEFT OUTER JOIN VW_Resource_Count r ON a.Task_Id=r.Task_Name  
LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id 
LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name
WHERE Exists(SELECT PROJECT_TASK_MASTER.* FROM PROJECT_TASK_MASTER,PROCESS_MASTER 
WHERE  PROJECT_TASK_MASTER.PROCESS_ID = PROCESS_MASTER.PROCESS_ID AND PROJECT_TASK_MASTER.Project_Name = P.ProjectId
AND PROCESS_MASTER.ORDER_NUMBER=22  AND PROJECT_TASK_MASTER.Completed_Date between @DateFrom and @DateTo) 
AND
( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (isnull(r.Resource_Count,0)<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)
AND a.Project_Name=CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE a.Project_Name END
AND a.Process_Id=CASE WHEN @Process_Id IS NOT NULL THEN @Process_Id ELSE a.Process_Id END
AND a.Entered_By=CASE WHEN @Engineers_Id IS NOT NULL THEN @Engineers_Id ELSE a.Entered_By END
GROUP BY  p.Project_Name,p.ProjectId, d.Process_Id, d.Process_Name,
CASE  WHEN ( DateDiff(dd,a.Start_Date,a.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) ) 
AND (ISNULL(r.Resource_Count,0)<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )
AND (Completed_Date BETWEEN a.Start_Date AND a.End_Date)THEN 'A'  ELSE 'B' END ) as TempPoints
ON TempPoints.ProjectId = Project.ProjectId
WHERE  Project.Entered_Unit= @Company_Unit_Id   
AND Project.ProjectId =CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE Project.ProjectId END
ORDER BY Project.Project_Name ASC
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_ManHours]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_ManHours]

@Project_Id INT

As

BEGIN

DECLARE @Days INT,

@Total_Task INT,

@Total_ManDays INT,

@Resource_Involved INT,

@Leave_Count INT,

@Holiday_Count INT,

@Project_Name VARCHAR(100) ,

@Planned_ManHours int



SELECT

@Project_Name = Project_Name,

@Resource_Involved = SUM(Resource_Count) ,

@Total_Task = COUNT(*),

@Total_ManDays = SUM(Duration * Resource_Count),

@Planned_ManHours = Planned_ManHours

FROM

(

SELECT DATEDIFF(DD,vw.Start_Date,vw.End_Date)+1 As Duration,

(

select COUNT(*) from Resource_Allocation_Master staff

where staff.Task_Name = vw.Task_Id

)AS Resource_Count,

Project_Name,Planned_ManHours FROM VW_Task_Master vw WHERE ProjectId = @Project_Id

) AS Temp_Resource_ManHour GROUP BY Project_Name, Planned_ManHours



SELECT @Days=SUM(Days_Count) FROM

(

SELECT Days_Count = (DATEDIFF(dd,MIN(Start_Date),Max(End_Date)))+1 FROM

[VW_Project_Duration_Graph] vw WHERE ProjectId = @Project_Id

)  as temp





SELECT

@Leave_Count = SUM(CASE WHEN DATEDIFF(DD,Task.Start_Date,End_Date)>= DATEDIFF(DD,Leave.Leave_From,Leave.Leave_To) THEN

DATEDIFF(DD,Leave.Leave_From,Leave.Leave_To) +1

ELSE

DATEDIFF(DD,Task.Start_Date,End_Date)+1

END)

FROM  Task_Master Task

INNER JOIN Resource_Allocation_Master Resources ON Resources.Task_Name = Task.Task_Id

INNER JOIN Leave_Master Leave ON  Leave.Staff_Name = Resources.Staff_Name

WHERE Task.Start_Date BETWEEN Leave.Leave_From AND Leave.Leave_To

AND Task.End_Date BETWEEN Leave.Leave_From AND Leave.Leave_To

AND Task.Project_Name = @Project_Id



SELECT

@Holiday_Count = SUM (CASE WHEN DATEDIFF(DD,Task.Start_Date,End_Date)>= DATEDIFF(DD,Leave.Holiday_From,Leave.Holiday_To) THEN

DATEDIFF(DD,Leave.Holiday_From,Leave.Holiday_To)+1

ELSE

DATEDIFF(DD,Task.Start_Date,End_Date)+1

END)

FROM  Task_Master Task

INNER JOIN Resource_Allocation_Master Resources ON Resources.Task_Name = Task.Task_Id

INNER JOIN Staff_Master Staff ON Staff.Staff_Id = Resources.Staff_Name

INNER JOIN Holiday_Master Leave ON  Leave.Company_Unit_Name = Staff.Company_Unit_Name

WHERE Task.Start_Date BETWEEN Leave.Holiday_From AND Leave.Holiday_To

AND Task.End_Date BETWEEN Leave.Holiday_From AND Leave.Holiday_To

AND Task.Project_Name = @Project_Id



SET @Days = @Days - ( ISNULL(@Leave_Count,0) + ISNULL(@Holiday_Count,0))

SET @Total_ManDays = @Total_ManDays - ( ISNULL(@Leave_Count,0) + ISNULL(@Holiday_Count,0))



SELECT  CASE WHEN @Days<0 THEN 0 ELSE @Days END AS Days,

@Total_Task As Total_Task ,

CASE WHEN @Total_ManDays<0 THEN 0 ELSE ISNULL(@Total_ManDays,0) END As Total_ManDays,

@Resource_Involved As Resource_Involved,

@Leave_Count As Leave_Count ,

@Holiday_Count As Holiday_Count ,

@Project_Name As Project_Name,

@Planned_ManHours As Planned_ManHours

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[SP_Project_Master]

@ProjectId  int,

@Project_Name  varchar(150),

@Project_Short_Name  varchar(30),

@Client_Name  int,

@Start_Date  datetime,

@End_Date  datetime,

@Is_Active  bit,

@Statement_of_Work  varchar(1500),

@Project_Purpose  varchar(1000),

@Comments  varchar(1000),

@Entered_By  int,

@Entered_Date  datetime,

@Expected_Start_Date  datetime,

@Expected_End_Date  datetime,

@Entered_Unit  int,

@Date_Of_Order DATETIME ,

@Planned_ManHours INT,

@Ck_Crm_Campaign bit,

@Crm_Cost decimal(18, 0),

@Crm_Mode nvarchar(50)

AS

BEGIN

IF NOT EXISTS( SELECT * FROM [Project_Master] WHERE [ProjectId]=@ProjectId )

BEGIN

INSERT INTO  [Project_Master]

(

[Project_Name],

[Project_Short_Name],

[Client_Name],

[Start_Date],

[End_Date],

[Is_Active],

[Statement_of_Work],

[Project_Purpose],

[Comments],

[Entered_By],

[Entered_Date],

[Expected_Start_Date],

[Expected_End_Date],

[Entered_Unit],

[Date_Of_Order] ,

[Planned_ManHours],

[CRMCampaign],

[CampaignCost],

[CampaignMode]

)

VALUES

(

@Project_Name,

@Project_Short_Name,

@Client_Name,

@Start_Date,

@End_Date,

@Is_Active,

@Statement_of_Work,

@Project_Purpose,

@Comments,

@Entered_By,

@Entered_Date,

@Expected_Start_Date,

@Expected_End_Date,

@Entered_Unit,

@Date_Of_Order ,

@Planned_ManHours,

@Ck_Crm_Campaign,

@Crm_Cost,

@Crm_Mode


)

SET @ProjectId = @@IDENTITY

END

ELSE

BEGIN

UPDATE [Project_Master] SET

[Project_Name] = @Project_Name,

[Project_Short_Name] = @Project_Short_Name,

[Client_Name] = @Client_Name,

[Start_Date] = @Start_Date,

[End_Date] = @End_Date,

[Is_Active] = @Is_Active,

[Statement_of_Work] = @Statement_of_Work,

[Project_Purpose] = @Project_Purpose,

[Comments] = @Comments,

[Entered_By] = @Entered_By,

[Entered_Date] = @Entered_Date,

[Expected_Start_Date] = @Expected_Start_Date,

[Expected_End_Date] = @Expected_End_Date,

[Entered_Unit] = @Entered_Unit,

[Date_Of_Order]=@Date_Of_Order ,

[Planned_ManHours] = @Planned_ManHours,

[CRMCampaign]=@Ck_Crm_Campaign,

[CampaignCost]=@Crm_Cost,

[CampaignMode]=@Crm_Mode


WHERE [ProjectId]=@ProjectId

END

SELECT @ProjectId AS ProjectId

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Master_20141001]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Project_Master_20141001]
@ProjectId  int,
@Project_Name  varchar(150),
@Project_Short_Name  varchar(30),
@Client_Name  int,
@Start_Date  datetime,
@End_Date  datetime,
@Is_Active  bit,
@Statement_of_Work  varchar(1500),
@Project_Purpose  varchar(1000),
@Comments  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Expected_Start_Date  datetime,
@Expected_End_Date  datetime,
@Entered_Unit  int,
@Date_Of_Order DATETIME ,
@Planned_ManHours INT
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Project_Master] WHERE [ProjectId]=@ProjectId )
BEGIN
INSERT INTO  [Project_Master]
(
[Project_Name],
[Project_Short_Name],
[Client_Name],
[Start_Date],
[End_Date],
[Is_Active],
[Statement_of_Work],
[Project_Purpose],
[Comments],
[Entered_By],
[Entered_Date],
[Expected_Start_Date],
[Expected_End_Date],
[Entered_Unit],
[Date_Of_Order] ,
[Planned_ManHours]
)
VALUES
(
@Project_Name,
@Project_Short_Name,
@Client_Name,
@Start_Date,
@End_Date,
@Is_Active,
@Statement_of_Work,
@Project_Purpose,
@Comments,
@Entered_By,
@Entered_Date,
@Expected_Start_Date,
@Expected_End_Date,
@Entered_Unit,
@Date_Of_Order ,
@Planned_ManHours
)
SET @ProjectId = @@IDENTITY
END
ELSE
BEGIN
UPDATE [Project_Master] SET
[Project_Name] = @Project_Name,
[Project_Short_Name] = @Project_Short_Name,
[Client_Name] = @Client_Name,
[Start_Date] = @Start_Date,
[End_Date] = @End_Date,
[Is_Active] = @Is_Active,
[Statement_of_Work] = @Statement_of_Work,
[Project_Purpose] = @Project_Purpose,
[Comments] = @Comments,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Expected_Start_Date] = @Expected_Start_Date,
[Expected_End_Date] = @Expected_End_Date,
[Entered_Unit] = @Entered_Unit,
[Date_Of_Order]=@Date_Of_Order ,
[Planned_ManHours] = @Planned_ManHours
WHERE [ProjectId]=@ProjectId
END
SELECT @ProjectId AS ProjectId
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Process_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Process_Master]        
@Project_Process_Id  int,        
@Company_Name  int,        
@Company_Unit_Name  int,        
@Project_Name  int,        
@Process_Name  int, 
@Product_Name  int,        
@Difficulty  decimal(7,2),        
@Points  decimal(7,2),        
@Remarks  varchar(1000),        
@Entered_Date  datetime,        
@Entered_By  int ,      
@Email_Configuration VARCHAR(1000)  ,    
@No_Of_Hours INT,  
@No_Of_Minutes INT,    
@No_Of_Days decimal(7,2),    
@No_Of_Staffs INT,  
@Skill_Id VARCHAR(1000),  
@Department_Id INT,  
@Project_Specific VARCHAR(10)   
AS        
BEGIN        
IF NOT EXISTS( SELECT * FROM [Project_Process_Master] WHERE [Project_Process_Id]=@Project_Process_Id )        
BEGIN        
INSERT INTO  [Project_Process_Master]        
(        
[Company_Name],        
[Company_Unit_Name],        
[Project_Name],        
[Process_Name], 
[Product_Name],       
[Difficulty],        
[Points],        
[Remarks],        
[Entered_Date],        
[Entered_By]  ,      
[Email_Configuration] ,    
No_Of_Hours,  
No_Of_Minutes,    
 [No_Of_Days] ,  
[No_Of_Staffs] ,  
[Skill_Id],  
[Department_Id],  
[Project_Specific]   
)        
VALUES        
(        
@Company_Name,        
@Company_Unit_Name,        
@Project_Name,        
@Process_Name, 
@Product_Name,        
@Difficulty,        
@Points,        
@Remarks,        
@Entered_Date,        
@Entered_By  ,      
@Email_Configuration  ,   
@No_Of_Hours,  
@No_Of_Minutes,    
@No_Of_Days,     
@No_Of_Staffs ,  
@Skill_Id,  
@Department_Id,  
@Project_Specific    
)        
END        
ELSE        
BEGIN        
UPDATE [Project_Process_Master] SET        
[Company_Name] = @Company_Name,        
[Company_Unit_Name] = @Company_Unit_Name,        
[Project_Name] = @Project_Name,        
[Process_Name] = @Process_Name, 
[Product_Name] = @Product_Name,        
[Difficulty] = @Difficulty,        
[Points] = @Points,        
[Remarks] = @Remarks,        
[Entered_Date] = @Entered_Date,        
[Entered_By] = @Entered_By  ,      
Email_Configuration = @Email_Configuration ,    
No_Of_Hours=@No_Of_Hours,  
No_Of_Minutes=@No_Of_Minutes,   
[No_Of_Days]=@No_Of_Days,  
[No_Of_Staffs] =@No_Of_Staffs ,  
[Skill_Id] = @Skill_Id,  
[Department_Id] = @Department_Id,  
[Project_Specific] = @Project_Specific    
WHERE [Project_Process_Id]=@Project_Process_Id        
END        
END   
  
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Process_Master_2015-03-16]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Project_Process_Master_2015-03-16]      
@Project_Process_Id  int,      
@Company_Name  int,      
@Company_Unit_Name  int,      
@Project_Name  int,      
@Process_Name  int,      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Remarks  varchar(1000),      
@Entered_Date  datetime,      
@Entered_By  int ,    
@Email_Configuration VARCHAR(1000)  ,  
@No_Of_Days decimal(7,2),  
@No_Of_Staffs INT
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Project_Process_Master] WHERE [Project_Process_Id]=@Project_Process_Id )      
BEGIN      
INSERT INTO  [Project_Process_Master]      
(      
[Company_Name],      
[Company_Unit_Name],      
[Project_Name],      
[Process_Name],      
[Difficulty],      
[Points],      
[Remarks],      
[Entered_Date],      
[Entered_By]  ,    
[Email_Configuration] ,   
 [No_Of_Days] ,
[No_Of_Staffs]  
)      
VALUES      
(      
@Company_Name,      
@Company_Unit_Name,      
@Project_Name,      
@Process_Name,      
@Difficulty,      
@Points,      
@Remarks,      
@Entered_Date,      
@Entered_By  ,    
@Email_Configuration  ,  
@No_Of_Days,   
@No_Of_Staffs   
)      
END      
ELSE      
BEGIN      
UPDATE [Project_Process_Master] SET      
[Company_Name] = @Company_Name,      
[Company_Unit_Name] = @Company_Unit_Name,      
[Project_Name] = @Project_Name,      
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Remarks] = @Remarks,      
[Entered_Date] = @Entered_Date,      
[Entered_By] = @Entered_By  ,    
Email_Configuration = @Email_Configuration ,  
[No_Of_Days]=@No_Of_Days,
[No_Of_Staffs] =@No_Of_Staffs   
WHERE [Project_Process_Id]=@Project_Process_Id      
END      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Process_Master_2015-06-18]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_Project_Process_Master_2015-06-18]      
@Project_Process_Id  int,      
@Company_Name  int,      
@Company_Unit_Name  int,      
@Project_Name  int,      
@Process_Name  int,      
@Difficulty  decimal(7,2),      
@Points  decimal(7,2),      
@Remarks  varchar(1000),      
@Entered_Date  datetime,      
@Entered_By  int ,    
@Email_Configuration VARCHAR(1000)  ,  
@No_Of_Hours INT,
@No_Of_Minutes INT,  
@No_Of_Days decimal(7,2),  
@No_Of_Staffs INT
AS      
BEGIN      
IF NOT EXISTS( SELECT * FROM [Project_Process_Master] WHERE [Project_Process_Id]=@Project_Process_Id )      
BEGIN      
INSERT INTO  [Project_Process_Master]      
(      
[Company_Name],      
[Company_Unit_Name],      
[Project_Name],      
[Process_Name],      
[Difficulty],      
[Points],      
[Remarks],      
[Entered_Date],      
[Entered_By]  ,    
[Email_Configuration] ,  
No_Of_Hours,
No_Of_Minutes,  
 [No_Of_Days] ,
[No_Of_Staffs]  
)      
VALUES      
(      
@Company_Name,      
@Company_Unit_Name,      
@Project_Name,      
@Process_Name,      
@Difficulty,      
@Points,      
@Remarks,      
@Entered_Date,      
@Entered_By  ,    
@Email_Configuration  , 
@No_Of_Hours,
@No_Of_Minutes,  
@No_Of_Days,   
@No_Of_Staffs   
)      
END      
ELSE      
BEGIN      
UPDATE [Project_Process_Master] SET      
[Company_Name] = @Company_Name,      
[Company_Unit_Name] = @Company_Unit_Name,      
[Project_Name] = @Project_Name,      
[Process_Name] = @Process_Name,      
[Difficulty] = @Difficulty,      
[Points] = @Points,      
[Remarks] = @Remarks,      
[Entered_Date] = @Entered_Date,      
[Entered_By] = @Entered_By  ,    
Email_Configuration = @Email_Configuration ,  
No_Of_Hours=@No_Of_Hours,
No_Of_Minutes=@No_Of_Minutes, 
[No_Of_Days]=@No_Of_Days,
[No_Of_Staffs] =@No_Of_Staffs   
WHERE [Project_Process_Id]=@Project_Process_Id      
END      
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Resource_Insert]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Resource_Insert]
@Task_Id INT
AS
BEGIN

	DECLARE @Parent_TaskId  INT
   SELECT @Parent_TaskId = Parent_TaskId  FROM Task_Master where Task_Id=@Task_Id
   
  IF (@Parent_TaskId IS NOT NULL )
  BEGIN
  	
	DELETE FROM Project_Resource_Master WHERE Task_Name = @Parent_TaskId
	INSERT INTO Project_Resource_Master (Staff_Name,Task_Name)
	SELECT Staff_Name,Parent_TaskId FROM Resource_Allocation_Master
	INNER JOIN Task_Master ON Resource_Allocation_Master.Task_Name = Task_Master.Task_Id
	WHERE Task_Master.Parent_TaskId IS NOT NULL AND 
	Task_Master.Parent_TaskId =@Parent_TaskId 

 END   
 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Resource_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Resource_Master]        
  @Staff_Name  int,
   @Project_name  int, 
 @Task_Name  int        
AS        
BEGIN        
        
 IF NOT EXISTS( SELECT * FROM [Project_Resource_Master] WHERE [Staff_Name]=@Staff_Name AND Task_Name= @Task_Name And Project_Name= @Project_name )        
 BEGIN      
     
  DECLARE @Task_Id INT      
     
  SELECT @Task_Id=Task_Id FROM Task_Master WHERE Task_RefId IS NULL     
  AND Parent_TaskId =@Task_Name    
      
  EXEC SP_Resource_Allocation_Master NULL,@Staff_Name,@Task_Id    
      
  INSERT INTO  [Project_Resource_Master]        
  (        
   [Staff_Name],  
   Project_Name,      
   Task_Name        
  )        
  VALUES        
  (        
   @Staff_Name,
   @Project_name,        
   @Task_Name        
  )        
      
 END        
         
END   
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Sub_Task_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Project_Sub_Task_Master]    
 @Process_Task_Id  int,    
 @Company_Name  int,    
 @Company_Unit_Name  int,    
 @Process_Name  INT,    
 @Project_Name INT,   
 @Task_Name  varchar(200),    
 @Remarks  varchar(1000),    
 @Entered_By  int,    
 @Entered_Date  datetime ,  
 @Difficulty decimal(7,2),  
 @Points decimal(7,2),  
 @Email_Configuration varchar(1000),  
 @No_Of_Days decimal(7,2),  
 @No_Of_Staffs int,
 @Parent_SubTaskId INT     
AS    
BEGIN    
 IF NOT EXISTS( SELECT * FROM [Sub_Task_Master]  WHERE [Parent_SubTaskId]=@Parent_SubTaskId )    
 BEGIN    
  INSERT INTO  [Sub_Task_Master]    
  (    
   [Company_Name],    
   [Company_Unit_Name],    
   [Process_Name],    
  [Project_Name],   
   [Task_Name],    
   [Remarks],    
   [Entered_By],    
   [Entered_Date] ,  
   [Difficulty],  
   [Points] ,  
   [Email_Configuration],  
   [No_Of_Days],  
   [No_Of_Staffs] ,
  [Parent_SubTaskId]     
  )    
  VALUES    
  (    
   @Company_Name,    
   @Company_Unit_Name,    
   @Process_Name,    
   @Project_Name ,  
   @Task_Name,    
   @Remarks,    
   @Entered_By,    
   @Entered_Date ,  
   @Difficulty,  
   @Points ,  
   @Email_Configuration,  
   @No_Of_Days,  
   @No_Of_Staffs ,
   @Parent_SubTaskId     
  )    
 END    
 ELSE    
 BEGIN    
  UPDATE [Sub_Task_Master] SET    
   [Company_Name] = @Company_Name,    
   [Company_Unit_Name] = @Company_Unit_Name,    
   [Process_Name] = @Process_Name,    
   [Project_Name] = @Project_Name,   
   [Task_Name] = @Task_Name,    
   [Remarks] = @Remarks,    
   [Entered_By] = @Entered_By,    
   [Entered_Date] = @Entered_Date  ,  
   [Difficulty] = @Difficulty ,  
   [Points] =@Points,  
   [Email_Configuration]=@Email_Configuration,  
   [No_Of_Days]=@No_Of_Days,  
   [No_Of_Staffs]= @No_Of_Staffs   
   WHERE  [Parent_SubTaskId]=@Parent_SubTaskId    
 END    
END  

GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Task_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Task_Master]                    







 @Task_Id  int,                    







 @Project_Name  int,                    







 @Task_Name  varchar(300),                    







 @Task_Description  varchar(1000),                    







 @Start_Date  datetime,                    







 @End_Date  datetime,                    







 @Department_Name  int,                    







 @Team_Name  int,                    







 @Designation_Name  int,                    







 @Resource  int =null,                    







 @Task_Status  int,                    







 @Entered_Date  datetime,                    







 @Remarks  varchar(1000),                    







 @Entered_By  int,                    







 @Entered_Unit  int,                    







 @Task_Configuration_Id int,                  







 @Process_Id int,                  







 @Parent_TaskId  INT   ,    







 @Sub_Task_Id INT,  







@IsResourceAllocated bit,



@Task_Map_Id int                   







AS                    







BEGIN                    







  DECLARE @Task_Identity INT      







IF NOT EXISTS( SELECT * FROM [Project_Task_Master] WHERE [Task_Id]=@Task_Id )                    







BEGIN                    







INSERT INTO  [Project_Task_Master]                    







(                    







 [Project_Name],                    







 [Task_Name],                    







 [Task_Description],                    







 [Start_Date],                    







 [End_Date],                    







 [Department_Name],                    







 [Team_Name],                    







 [Designation_Name],                    







 [Task_Status],                    







 [Entered_Date],                    







 [Remarks],                    







 [Entered_By],                    







 [Entered_Unit],                    







 [Task_Configuration_Id],                  







 [Process_Id],                  







 [Parent_TaskId]  ,    







 [Sub_Task_Id]  ,                 







 [Planned_Start_Date],







 [Planned_End_Date],



  [Task_Map_Id]







)                    







VALUES                    







(                    







 @Project_Name,                    







 @Task_Name,                    







 @Task_Description,                    







 @Start_Date,                    







 @End_Date,                    







 @Department_Name,                    







 @Team_Name,                    







 @Designation_Name,                    







 @Task_Status,                    







 @Entered_Date,                    







 @Remarks,                    







 @Entered_By,                    







 @Entered_Unit,                    







 @Task_Configuration_Id,                  







 @Process_Id,                    







 @Parent_TaskId  ,    







 @Sub_Task_Id,







 @Start_Date, 







 @End_Date,

  @Task_Map_Id               







)                    







            







SET @Task_Id = @@IDENTITY     







     







SELECT @Task_Id AS Task_Id         







EXEC SP_Task_Order @Project_Name, @Process_Id, NULL, NULL,NULL          







 IF (@IsResourceAllocated=1)  







 BEGIN      







  EXEC SP_TASK_MASTER  NULL, @Project_Name,                  







   @Task_Name,                  







   @Task_Description,                  







   @Start_Date,                  







   @End_Date,                  







   @Department_Name,                  







   @Team_Name,                  







   @Designation_Name,                  







   @Entered_By,                  







   @Task_Status,                  







   @Entered_Date,                  







   @Remarks,                  







   @Entered_By,                  







   @Entered_Unit,                  







   @Task_Configuration_Id,  







   @Process_Id,                  







   @Task_Id   ,    







   @Sub_Task_Id,   







   NULL ,
   
   @Task_Map_Id     







 END    







  IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      







 BEGIN      







  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      







  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      







 END               







 ELSE      







 BEGIN     







  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  







  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      















 END 







          







 RETURN              







END                    







ELSE                    







BEGIN           







              







UPDATE [Project_Task_Master] SET                    







[Project_Name] = @Project_Name,                    







[Task_Name] = @Task_Name,                    







[Task_Description] = @Task_Description,                    







[Start_Date] = @Start_Date,                    







[End_Date] = @End_Date,                    







[Department_Name] = @Department_Name,                    







[Team_Name] = @Team_Name,      







[Designation_Name] = @Designation_Name,   







[Task_Status] = @Task_Status,                    







[Entered_Date] = @Entered_Date,                    







[Remarks] = @Remarks,                    







[Entered_By] = @Entered_By,                    







[Entered_Unit] = @Entered_Unit,                    







[Task_Configuration_Id]=@Task_Configuration_Id,                  







[Process_Id] = @Process_Id,                  







[Parent_TaskId] = @Parent_TaskId ,       







[Sub_Task_Id ]= @Sub_Task_Id                  







WHERE [Task_Id]=@Task_Id           







    







END  







                  







 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      







 BEGIN      







  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      







  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      







 END               







 ELSE      







 BEGIN     







  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  







  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      















 END 























      SELECT @Task_Id AS Task_Id              







END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Task_Master_2015-06-08]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Project_Task_Master_2015-06-08]                    

 @Task_Id  int,                    

 @Project_Name  int,                    

 @Task_Name  varchar(300),                    

 @Task_Description  varchar(1000),                    

 @Start_Date  datetime,                    

 @End_Date  datetime,                    

 @Department_Name  int,                    

 @Team_Name  int,                    

 @Designation_Name  int,                    

 @Resource  int =null,                    

 @Task_Status  int,                    

 @Entered_Date  datetime,                    

 @Remarks  varchar(1000),                    

 @Entered_By  int,                    

 @Entered_Unit  int,                    

 @Task_Configuration_Id int,                  

 @Process_Id int,                  

 @Parent_TaskId  INT   ,    

 @Sub_Task_Id INT,  

@IsResourceAllocated bit                 

AS                    

BEGIN                    

  DECLARE @Task_Identity INT      

IF NOT EXISTS( SELECT * FROM [Project_Task_Master] WHERE [Task_Id]=@Task_Id )                    

BEGIN                    

INSERT INTO  [Project_Task_Master]                    

(                    

 [Project_Name],                    

 [Task_Name],                    

 [Task_Description],                    

 [Start_Date],                    

 [End_Date],                    

 [Department_Name],                    

 [Team_Name],                    

 [Designation_Name],                    

 [Task_Status],                    

 [Entered_Date],                    

 [Remarks],                    

 [Entered_By],                    

 [Entered_Unit],                    

 [Task_Configuration_Id],                  

 [Process_Id],                  

 [Parent_TaskId]  ,    

 [Sub_Task_Id]  ,                 

 [Planned_Start_Date],

 [Planned_End_Date]

)                    

VALUES                    

(                    

 @Project_Name,                    

 @Task_Name,                    

 @Task_Description,                    

 @Start_Date,                    

 @End_Date,                    

 @Department_Name,                    

 @Team_Name,                    

 @Designation_Name,                    

 @Task_Status,                    

 @Entered_Date,                    

 @Remarks,                    

 @Entered_By,                    

 @Entered_Unit,                    

 @Task_Configuration_Id,                  

 @Process_Id,                    

 @Parent_TaskId  ,    

 @Sub_Task_Id,

 @Start_Date, 

 @End_Date              

)                    

            

SET @Task_Id = @@IDENTITY     

     

SELECT @Task_Id AS Task_Id         

EXEC SP_Task_Order @Project_Name, @Process_Id, NULL, NULL,NULL          

 IF (@IsResourceAllocated=1)  

 BEGIN      

  EXEC SP_TASK_MASTER  NULL, @Project_Name,                  

   @Task_Name,                  

   @Task_Description,                  

   @Start_Date,                  

   @End_Date,                  

   @Department_Name,                  

   @Team_Name,                  

   @Designation_Name,                  

   @Entered_By,                  

   @Task_Status,                  

   @Entered_Date,                  

   @Remarks,                  

   @Entered_By,                  

   @Entered_Unit,                  

   @Task_Configuration_Id,                

   @Process_Id,                  

   @Task_Id   ,    

   @Sub_Task_Id,   

   NULL      

 END    

  IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      

 BEGIN      

  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      

  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      

 END               

 ELSE      

 BEGIN     

  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  

  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      



 END 

          

 RETURN              

END                    

ELSE                    

BEGIN           

              

UPDATE [Project_Task_Master] SET                    

[Project_Name] = @Project_Name,                    

[Task_Name] = @Task_Name,                    

[Task_Description] = @Task_Description,                    

[Start_Date] = @Start_Date,                    

[End_Date] = @End_Date,                    

[Department_Name] = @Department_Name,                    

[Team_Name] = @Team_Name,      

[Designation_Name] = @Designation_Name,   

[Task_Status] = @Task_Status,                    

[Entered_Date] = @Entered_Date,                    

[Remarks] = @Remarks,                    

[Entered_By] = @Entered_By,                    

[Entered_Unit] = @Entered_Unit,                    

[Task_Configuration_Id]=@Task_Configuration_Id,                  

[Process_Id] = @Process_Id,                  

[Parent_TaskId] = @Parent_TaskId ,       

[Sub_Task_Id ]= @Sub_Task_Id                  

WHERE [Task_Id]=@Task_Id           

    

END  

                  

 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      

 BEGIN      

  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      

  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      

 END               

 ELSE      

 BEGIN     

  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  

  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      



 END 





      SELECT @Task_Id AS Task_Id              

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Task_Master2]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Project_Task_Master2]                    



 @Task_Id  int,                    



 @Project_Name  int,                    



 @Task_Name  varchar(300),                    



 @Task_Description  varchar(1000),                    



 @Start_Date  datetime,                    



 @End_Date  datetime,                    



 @Department_Name  int,                    



 @Team_Name  int,                    



 @Designation_Name  int,                    



 @Resource  int =null,                    



 @Task_Status  int,                    



 @Entered_Date  datetime,                    



 @Remarks  varchar(1000),                    



 @Entered_By  int,                    



 @Entered_Unit  int,                    



 @Task_Configuration_Id int,                  



 @Process_Id int,                  



 @Parent_TaskId  INT   ,    



 @Sub_Task_Id INT,  



@IsResourceAllocated bit                 



AS                    



BEGIN                    



  DECLARE @Task_Identity INT      



IF NOT EXISTS( SELECT * FROM [Project_Task_Master] WHERE [Task_Id]=@Task_Id )                    



BEGIN                    



INSERT INTO  [Project_Task_Master]                    



(                    



 [Project_Name],                    



 [Task_Name],                    



 [Task_Description],                    



 [Start_Date],                    



 [End_Date],                    



 [Department_Name],                    



 [Team_Name],                    



 [Designation_Name],                    



 [Task_Status],                    



 [Entered_Date],                    



 [Remarks],                    



 [Entered_By],                    



 [Entered_Unit],                    



 [Task_Configuration_Id],                  



 [Process_Id],                  



 [Parent_TaskId]  ,    



 [Sub_Task_Id]  ,                 



 [Planned_Start_Date],



 [Planned_End_Date]



)                    



VALUES                    



(                    



 @Project_Name,                    



 @Task_Name,                    



 @Task_Description,                    



 @Start_Date,                    



 @End_Date,                    



 @Department_Name,                    



 @Team_Name,                    



 @Designation_Name,                    



 @Task_Status,                    



 @Entered_Date,                    



 @Remarks,                    



 @Entered_By,                    



 @Entered_Unit,                    



 @Task_Configuration_Id,                  



 @Process_Id,                    



 @Parent_TaskId  ,    



 @Sub_Task_Id,



 @Start_Date, 



 @End_Date              



)                    



            



SET @Task_Id = @@IDENTITY     



     



SELECT @Task_Id AS Task_Id         



EXEC SP_Task_Order @Project_Name, @Process_Id, NULL, NULL,NULL          



 IF (@IsResourceAllocated=1)  



 BEGIN      



  EXEC SP_TASK_MASTER  NULL, @Project_Name,                  



   @Task_Name,                  



   @Task_Description,                  



   @Start_Date,                  



   @End_Date,                  



   @Department_Name,                  



   @Team_Name,                  



   @Designation_Name,                  



   @Entered_By,                  



   @Task_Status,                  



   @Entered_Date,                  



   @Remarks,                  



   @Entered_By,                  



   @Entered_Unit,                  



   @Task_Configuration_Id,                



   @Process_Id,                  



   @Task_Id   ,    



   @Sub_Task_Id,   



   NULL      



 END    



  IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      



 BEGIN      



  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      



 END               



 ELSE      



 BEGIN     



  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      







 END 



          



 RETURN              



END                    



ELSE                    



BEGIN           



              



UPDATE [Project_Task_Master] SET                    



[Project_Name] = @Project_Name,                    



[Task_Name] = @Task_Name,                    



[Task_Description] = @Task_Description,                    



[Start_Date] = @Start_Date,                    



[End_Date] = @End_Date,                    



[Department_Name] = @Department_Name,                    



[Team_Name] = @Team_Name,      



[Designation_Name] = @Designation_Name,   



[Task_Status] = @Task_Status,                    



[Entered_Date] = @Entered_Date,                    



[Remarks] = @Remarks,                    



[Entered_By] = @Entered_By,                    



[Entered_Unit] = @Entered_Unit,                    



[Task_Configuration_Id]=@Task_Configuration_Id,                  



[Process_Id] = @Process_Id,                  



[Parent_TaskId] = @Parent_TaskId ,       



[Sub_Task_Id ]= @Sub_Task_Id                  



WHERE [Task_Id]=@Task_Id           



    



END  



                  



 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      



 BEGIN      



  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      



 END               



 ELSE      



 BEGIN     



  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      







 END 











      SELECT @Task_Id AS Task_Id              



END
GO
/****** Object:  StoredProcedure [dbo].[SP_Project_Task_Master3]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Project_Task_Master3]                    



 @Task_Id  int,                    



 @Project_Name  int,                    



 @Task_Name  varchar(300),                    



 @Task_Description  varchar(1000),                    



 @Start_Date  datetime,                    



 @End_Date  datetime,                    



 @Department_Name  int,                    



 @Team_Name  int,                    



 @Designation_Name  int,                    



 @Resource  int =null,                    



 @Task_Status  int,                    



 @Entered_Date  datetime,                    



 @Remarks  varchar(1000),                    



 @Entered_By  int,                    



 @Entered_Unit  int,                    



 @Task_Configuration_Id int,                  



 @Process_Id int,                  



 @Parent_TaskId  INT   ,    



 @Sub_Task_Id INT,  



@IsResourceAllocated bit,



@Task_Map_Id int                 



AS                    



BEGIN                    



  DECLARE @Task_Identity INT      



IF NOT EXISTS( SELECT * FROM [Project_Task_Master] WHERE [Task_Id]=@Task_Id )                    



BEGIN                    



INSERT INTO  [Project_Task_Master]                    



(                    



 [Project_Name],                    



 [Task_Name],                    



 [Task_Description],                    



 [Start_Date],                    



 [End_Date],                    



 [Department_Name],                    



 [Team_Name],                    



 [Designation_Name],                    



 [Task_Status],                    



 [Entered_Date],                    



 [Remarks],                    



 [Entered_By],                    



 [Entered_Unit],                    



 [Task_Configuration_Id],                  



 [Process_Id],                  



 [Parent_TaskId]  ,    



 [Sub_Task_Id]  ,                 



 [Planned_Start_Date],



 [Planned_End_Date],



 [Task_Map_Id]



)                    



VALUES                    



(                    



 @Project_Name,                    



 @Task_Name,                    



 @Task_Description,                    



 @Start_Date,                    



 @End_Date,                    



 @Department_Name,                    



 @Team_Name,                    



 @Designation_Name,                    



 @Task_Status,                    



 @Entered_Date,                    



 @Remarks,                    



 @Entered_By,                    



 @Entered_Unit,                    



 @Task_Configuration_Id,                  



 @Process_Id,                    



 @Parent_TaskId  ,    



 @Sub_Task_Id,



 @Start_Date, 



 @End_Date,



 @Task_Map_Id              



)                    



            



SET @Task_Id = @@IDENTITY     



     



SELECT @Task_Id AS Task_Id         



EXEC SP_Task_Order @Project_Name, @Process_Id, NULL, NULL,NULL          



 IF (@IsResourceAllocated=1)  



 BEGIN      



  EXEC SP_TASK_MASTER  NULL, @Project_Name,                  



   @Task_Name,                  



   @Task_Description,                  



   @Start_Date,                  



   @End_Date,                  



   @Department_Name,                  



   @Team_Name,                  



   @Designation_Name,                  



   @Entered_By,                  



   @Task_Status,                  



   @Entered_Date,                  



   @Remarks,                  



   @Entered_By,                  



   @Entered_Unit,                  



   @Task_Configuration_Id,                



   @Process_Id,                  



   @Task_Id   ,    



   @Sub_Task_Id, 

   

 

   NULL,



   @Task_Map_Id      



 END    



  IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      



 BEGIN      



  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      



 END               



 ELSE      



 BEGIN     



  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      







 END 



          



 RETURN              



END                    



ELSE                    



BEGIN           



              



UPDATE [Project_Task_Master] SET                    



[Project_Name] = @Project_Name,                    



[Task_Name] = @Task_Name,                    



[Task_Description] = @Task_Description,                    



[Start_Date] = @Start_Date,                    



[End_Date] = @End_Date,                    



[Department_Name] = @Department_Name,                    



[Team_Name] = @Team_Name,      



[Designation_Name] = @Designation_Name,   



[Task_Status] = @Task_Status,                    



[Entered_Date] = @Entered_Date,                    



[Remarks] = @Remarks,                    



[Entered_By] = @Entered_By,                    



[Entered_Unit] = @Entered_Unit,                    



[Task_Configuration_Id]=@Task_Configuration_Id,                  



[Process_Id] = @Process_Id,                  



[Parent_TaskId] = @Parent_TaskId ,       



[Sub_Task_Id ]= @Sub_Task_Id   ,



[Task_Map_Id] = @Task_Map_Id               



WHERE [Task_Id]=@Task_Id           



    



END  



                  



 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      



 BEGIN      



  UPDATE [Project_Task_Master] SET [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Task_Id= @Task_Id      



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status, [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE Parent_TaskId = @Task_Id      



 END               



 ELSE      



 BEGIN     



  UPDATE [Project_Task_Master] SET [Completed_Date] = NULL WHERE Task_Id= @Task_Id  



  UPDATE [Task_Master] SET [Task_Status] = @Task_Status,  [Completed_Date] = NULL WHERE Parent_TaskId = @Task_Id      







 END 











      SELECT @Task_Id AS Task_Id              



END

GO
/****** Object:  StoredProcedure [dbo].[SP_Purpose_Code_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Purpose_Code_Master]

@Purpose_Code_Id  int,

@Purpose_Name  varchar(150),

@Purpose_Code  varchar(25),

@Remarks  varchar(500),

@Entered_By  int,

@Entered_Date  datetime,

@TimeAllotted int

AS

BEGIN

IF NOT EXISTS( SELECT * FROM [Purpose_Code_Master] WHERE [Purpose_Code_Id]=@Purpose_Code_Id )

BEGIN

INSERT INTO  [Purpose_Code_Master]

(

[Purpose_Name],

[Purpose_Code],

[Remarks],

[Entered_By],

[Entered_Date],

[TimeAllotted]

)

VALUES

(

@Purpose_Name,

@Purpose_Code,

@Remarks,

@Entered_By,

@Entered_Date,

@TimeAllotted

)

END

ELSE

BEGIN

UPDATE [Purpose_Code_Master] SET

[Purpose_Name] = @Purpose_Name,

[Purpose_Code] = @Purpose_Code,

[Remarks] = @Remarks,

[Entered_By] = @Entered_By,

[Entered_Date] = @Entered_Date,

[TimeAllotted]= @TimeAllotted

WHERE [Purpose_Code_Id]=@Purpose_Code_Id

END

END



GO
/****** Object:  StoredProcedure [dbo].[SP_Purpose_Mapping]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Purpose_Mapping]
@Mapping_Id  int,
@Purpose_Code_Name  int,
@Department_Name  int,
@Entered_By  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Purpose_Mapping] WHERE [Purpose_Code_Name]=@Purpose_Code_Name AND [Department_Name]=@Department_Name)
BEGIN
INSERT INTO  [Purpose_Mapping]
(
[Purpose_Code_Name],
[Department_Name],
[Entered_By],
[Entered_Date]
)
VALUES
(
@Purpose_Code_Name,
@Department_Name,
@Entered_By,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Purpose_Mapping] SET
[Purpose_Code_Name] = @Purpose_Code_Name,
[Department_Name] = @Department_Name,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date
WHERE [Purpose_Code_Name]=@Purpose_Code_Name AND [Department_Name]=@Department_Name
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Reporting_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Reporting_Master]
@Department_Name  int,
@Responsible_Staff  int,
@Reporting_Staff  int,
@Entered_By  int,
@Entered_Date  datetime
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Reporting_Master] WHERE [Responsible_Staff] = @Responsible_Staff AND [Reporting_Staff] = @Reporting_Staff )
BEGIN
INSERT INTO  [Reporting_Master]
(
[Department_Name],
[Responsible_Staff],
[Reporting_Staff],
[Entered_By],
[Entered_Date]
)
VALUES
(
@Department_Name,
@Responsible_Staff,
@Reporting_Staff,
@Entered_By,
@Entered_Date
)
END
ELSE
BEGIN
UPDATE [Reporting_Master] SET
[Department_Name] = @Department_Name,
[Responsible_Staff] = @Responsible_Staff,
[Reporting_Staff] = @Reporting_Staff,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date
WHERE [Responsible_Staff] = @Responsible_Staff AND [Reporting_Staff] = @Reporting_Staff
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Resource_Allocation_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Resource_Allocation_Master]
	@Allocation_Id  int,
	@Staff_Name  int,
	@Task_Name  int
AS
BEGIN

	IF NOT EXISTS( SELECT * FROM [Resource_Allocation_Master] WHERE [Staff_Name]=@Staff_Name AND [Task_Name]= @Task_Name )
	BEGIN
		INSERT INTO  [Resource_Allocation_Master]
		(
			[Staff_Name],
			[Task_Name]
		)
		VALUES
		(
			@Staff_Name,
			@Task_Name
		)
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Resource_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Resource_Master]
@Resource_Id  int,
@Project_Name  int,
@Staff_Name  int,
@Is_Active  bit,
@Roles  varchar(1000),
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Resource_Master] WHERE  [Project_Name]=@Project_Name AND [Staff_Name]= @Staff_Name)
BEGIN
INSERT INTO  [Resource_Master]
(
[Project_Name],
[Staff_Name],
[Is_Active],
[Roles],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Project_Name,
@Staff_Name,
@Is_Active,
@Roles,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Resource_Master] SET
[Project_Name] = @Project_Name,
[Staff_Name] = @Staff_Name,
[Is_Active] = @Is_Active,
[Roles] = @Roles,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE  [Project_Name]=@Project_Name AND [Staff_Name]= @Staff_Name
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Staff_Based_Points]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Staff_Based_Points]  
    @Staff_Id INT =NULL,  
    @Project_Id INT =NULL,  
    @Company_Unit_Id INT =NULL,  
    @Process_Id INT =NULL,  
    @DateFrom DATETIME =NULL,  
    @DateTo DATETIME =NULL,  
    @Engineers_Id INT =NULL,  
    @Designation_Id INT =NULL  
AS  
BEGIN        
     
   SELECT staff.Staff_Name,Staff.Staff_Id,TempPoints.Points,TempPoints.Task_Count,  
   TempPoints.Process_Name,TempPoints.Process_Id,Point_Index FROM VW_ACtive_STAFF_Master As staff  
   LEFT OUTER JOIN(  
   SELECT DISTINCT c.Staff_Name,c.Staff_Id, d.Process_Id,  
   d.Process_Name,  
   Case  WHEN ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)THEN 'A'  ELSE 'B' END As Point_Index,   
   Sum(DISTINCT  ISNULL(ISNULL(g.difficulty,e.difficulty),d.difficulty)) * Sum(DISTINCT ISNULL(ISNULL(g.Points,e.Points),d.Points)) * Sum(DISTINCT ISNULL(f.Incentive_Points,1))  As Points,  
   Count( DISTINCT b.Task_Name) AS Task_Count FROM   
    Staff_Master c  
   INNER JOIN Project_Resource_Master b ON  c.Staff_Id = b.Staff_Name    
   INNER JOIN  Project_Task_Master a  ON a.Task_Id=b.Task_Name   
   INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id   
   INNER JOIN Designation_Master f ON f.Designation_Id = c.Designation_Name   
   INNER JOIN VW_Resource_Count r ON a.Task_Id=b.Task_Name    
   LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id   
   LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name  
   WHERE   
   (@DateFrom between Start_Date and End_Date  
    OR  
    @DateTo between Start_Date and End_Date)  
   AND  
   ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)  
   AND a.Project_Name=CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE a.Project_Name END  
   AND a.Process_Id=CASE WHEN @Process_Id IS NOT NULL THEN @Process_Id ELSE a.Process_Id END  
   AND a.Entered_By=CASE WHEN @Engineers_Id IS NOT NULL THEN @Engineers_Id ELSE a.Entered_By END  
   GROUP BY c.Staff_Name, d.Process_Id, d.Process_Name,c.Staff_Id,  
   Case  WHEN ( DateDiff(dd,Start_Date,End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (Completed_Date BETWEEN Start_Date AND End_Date)THEN 'A'  ELSE 'B' END ) as TempPoints  
   ON TempPoints.Staff_Id = staff.Staff_Id        
   WHERE staff.Staff_Id=CASE WHEN @Staff_Id IS NOT NULL THEN @Staff_Id ELSE staff.Staff_Id  END      
   AND staff.Company_Unit_Name= @Company_Unit_Id   
   AND staff.Staff_Id IN ( SELECT Staff_Name FROM Project_Resource_Master)
   AND staff.Designation_Name=CASE WHEN @Designation_Id IS NOT NULL THEN @Designation_Id ELSE staff.Designation_Name  END  
   ORDER BY staff.Staff_Name ASC  
     
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Staff_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Staff_Master]
@Staff_Id  int,
@Staff_Name  varchar(100),
@Employee_Code  int,
@Password  varchar(50),
@Gender  int,
@Date_of_Birth  datetime,
@Higher_Qualification  varchar(100),
@Department_Name  int,
@Team_Name  int,
@Designation_Name  int,
@Salary  numeric,
@Email_Id  varchar(75),
@Address  varchar(1500),
@Contact_No  varchar(20),
@Entered_By  int,
@Company_Name  int,
@Company_Unit_Name  int,
@Entered_Date  datetime,
@Skills_Details  varchar(1000),
@Entered_Unit  int,
@Employee_Status varchar(20)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Staff_Master] WHERE [Staff_Id]=@Staff_Id )
BEGIN
INSERT INTO  [Staff_Master]
(
[Staff_Name],
[Employee_Code],
[Password],
[Gender],
[Date_of_Birth],
[Higher_Qualification],
[Department_Name],
[Team_Name],
[Designation_Name],
[Salary],
[Email_Id],
[Address],
[Contact_No],
[Entered_By],
[Company_Name],
[Company_Unit_Name],
[Entered_Date],
[Skills_Details],
[Entered_Unit],
[Employee_Status]
)
VALUES
(
@Staff_Name,
@Employee_Code,
@Password,
@Gender,
@Date_of_Birth,
@Higher_Qualification,
@Department_Name,
@Team_Name,
@Designation_Name,
@Salary,
@Email_Id,
@Address,
@Contact_No,
@Entered_By,
@Company_Name,
@Company_Unit_Name,
@Entered_Date,
@Skills_Details,
@Entered_Unit,
@Employee_Status
)
END
ELSE
BEGIN
UPDATE [Staff_Master] SET
[Staff_Name] = @Staff_Name,
[Employee_Code] = @Employee_Code,
[Password] = @Password,
[Gender] = @Gender,
[Date_of_Birth] = @Date_of_Birth,
[Higher_Qualification] = @Higher_Qualification,
[Department_Name] = @Department_Name,
[Team_Name] = @Team_Name,
[Designation_Name] = @Designation_Name,
[Salary] = @Salary,
[Email_Id] = @Email_Id,
[Address] = @Address,
[Contact_No] = @Contact_No,
[Entered_By] = @Entered_By,
[Company_Name] = @Company_Name,
[Company_Unit_Name] = @Company_Unit_Name,
[Entered_Date] = @Entered_Date,
[Skills_Details] = @Skills_Details,
[Entered_Unit] = @Entered_Unit,
[Employee_Status] = @Employee_Status
WHERE [Staff_Id]=@Staff_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_StockAmount]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[Sp_StockAmount]
 @BillNo VARCHAR(15),
 @SupplierId  INT,
 @TotalAmount as FLOAT,
 @Tax as FLOAT,
 @OtherTax as FLOAT,
 @Remarks as VARCHAR(150),
 @Entered_Unit INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		-- Insert statements for procedure here
		
		INSERT INTO StockAmount 
		(BillNo,
		 SupplierId,
		 TotalAmount,
		 Tax,
		 OtherTax,
		 Remarks,
		 Entered_Unit
		 )
		 Values
		 (
		  @BillNo,
		  @SupplierId,
		  @TotalAmount,
		  @Tax,
		  @OtherTax,
		  @Remarks,
		  @Entered_Unit
		  )
		 
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_stockdelivery]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Sp_stockdelivery]    
   @Id  INT,    
   @Request_Id INT,    
   @Supply_By Varchar(100),    
   @ContactNo VARCHAR(30),  
   @BillNo INT,    
   @ReceivedBy INT,    
   @EnteredBy INT,    
   @EneteredDate Date,
   @Entered_Unit INT    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    -- Insert statements for procedure here    
     
 INSERT Into tbl_stockdelivery     
 (    
	Request_Id,    
	Supply_By,    
	ConductNo,    
	BillNo,  
	Received_By,    
	Entered_By,    
	Entered_Date,
	Entered_Unit 
 )    
 VALUES    
 (    
    @Request_Id,    
    @Supply_By,    
    @ContactNo,  
    @BillNo,    
    @ReceivedBy,    
    @EnteredBy,    
    GETDATE(),
    @Entered_Unit
  )    
    SET @Id = @@Identity    
    SELECT @Id As Id    
END

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[Sp_StockSupplier]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Sp_StockSupplier]  
@Id INT,  
@RequestedId INT,  
@StockId INT,  
@SupplierId INT,  
@Quantity DeCIMAL(18,0),  
@Units VARCHAR(50),  
@EnteredDate INT,  
@EnteredBy INT,  
@Entered_Unit INT    
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
   
 INSERT INTO SuppliersMaster   
  (  
	RequestId ,  
	StockId ,  
	SupplierId,  
	EnteredDate,  
	EnteredBy,  
	Quantity,  
	Unit,
    Entered_Unit 
  )  
  values  
  (  
	@RequestedId,  
	@StockId,  
	@SupplierId,  
	GETDATE(),  
	@EnteredBy,  
	@Quantity,  
	@Units,
	@Entered_Unit
  )  
END  


GO
/****** Object:  StoredProcedure [dbo].[Sp_StocksupplierRequest]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[Sp_StocksupplierRequest]  
	@Id INT,  
	@Category INT,  
	@EnetereDate DATE,  
	@EneteredBy INT,
	@Entered_Unit INT  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 INSERT INTO Tbl_SupplierRequest  
  (  
  CategoryId,  
  EneteredBy,  
  EneteredDate,Entered_Unit)  
  Values(  
  @Category,  
  @EneteredBy,  
  GETDATE(),
  @Entered_Unit)  
 SET @Id = @@Identity  
 Select @Id as Id  
END  


GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Module]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Sub_Module]
@SubModule_Id  int,
@Module_Name  int,
@Sub_Module_Name  varchar(100),
@File_Name  varchar(500),
@Is_Active  bit,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Sub_Module] WHERE [SubModule_Id]=@SubModule_Id )
BEGIN
INSERT INTO  [Sub_Module]
(
[Module_Name],
[Sub_Module_Name],
[File_Name],
[Is_Active],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Module_Name,
@Sub_Module_Name,
@File_Name,
@Is_Active,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Sub_Module] SET
[Module_Name] = @Module_Name,
[Sub_Module_Name] = @Sub_Module_Name,
[File_Name] = @File_Name,
[Is_Active] = @Is_Active,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [SubModule_Id]=@SubModule_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Product_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Sub_Product_Master]  
 @Product_Task_Id  int,  
 @Company_Name  int,  
 @Company_Unit_Name  int,  
 @Product_Name  int,  
 @Process_Name  int,  
 @Task_Name varchar(200),  
 @Remarks  varchar(1000),  
 @Entered_By  int,  
 @Entered_Date  datetime ,
 @Difficulty	decimal(7,2),
 @Points	decimal(7,2),
 @Email_Configuration	varchar(1000),
 @No_Of_Days decimal(7,2),
 @No_Of_Staffs int  
AS  
BEGIN  
 IF NOT EXISTS( SELECT * FROM [Sub_Product_Master] WHERE [Product_Task_Id]=@Product_Task_Id )  
 BEGIN  
  INSERT INTO  [Sub_Product_Master]  
  (  
   [Company_Name],  
   [Company_Unit_Name],  
   [Product_Name], 
   [Process_Name], 
   [Task_Name], 
   [Remarks],  
   [Entered_By],  
   [Entered_Date] ,
   [Difficulty],
   [Points]	,
   [Email_Configuration],
   [No_Of_Days],
   [No_Of_Staffs]   
  )  
  VALUES  
  (  
   @Company_Name,  
   @Company_Unit_Name,  
   @Product_Name, 
   @Process_Name,
   @Task_Name,  
   @Remarks,  
   @Entered_By,  
   @Entered_Date ,
   @Difficulty,
   @Points	,
   @Email_Configuration,
   @No_Of_Days,
   @No_Of_Staffs   
  )  
 END  
 ELSE  
 BEGIN  
  UPDATE [Sub_Product_Master] SET  
   [Company_Name] = @Company_Name,  
   [Company_Unit_Name] = @Company_Unit_Name,  
   [Product_Name] = @Product_Name,  
   [Process_Name] = @Process_Name, 
   [Task_Name] = @Task_Name,  
   [Remarks] = @Remarks,  
   [Entered_By] = @Entered_By,  
   [Entered_Date] = @Entered_Date  ,
   [Difficulty] = @Difficulty ,
   [Points]	=@Points,
   [Email_Configuration]=@Email_Configuration,
   [No_Of_Days]=@No_Of_Days,
   [No_Of_Staffs]= @No_Of_Staffs
   WHERE [Product_Task_Id]=@Product_Task_Id  
 END  
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Product_Master_2015-05-27]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Sub_Product_Master_2015-05-27]  
 @Product_Task_Id  int,  
 @Company_Name  int,  
 @Company_Unit_Name  int,  
 @Product_Name  int,  
 @Task_Name varchar(200),  
 @Remarks  varchar(1000),  
 @Entered_By  int,  
 @Entered_Date  datetime ,
 @Difficulty	decimal(7,2),
 @Points	decimal(7,2),
 @Email_Configuration	varchar(1000),
 @No_Of_Days decimal(7,2),
 @No_Of_Staffs int  
AS  
BEGIN  
 IF NOT EXISTS( SELECT * FROM [Sub_Product_Master] WHERE [Product_Task_Id]=@Product_Task_Id )  
 BEGIN  
  INSERT INTO  [Sub_Product_Master]  
  (  
   [Company_Name],  
   [Company_Unit_Name],  
   [Product_Name], 
   [Task_Name], 
   [Remarks],  
   [Entered_By],  
   [Entered_Date] ,
   [Difficulty],
   [Points]	,
   [Email_Configuration],
   [No_Of_Days],
   [No_Of_Staffs]   
  )  
  VALUES  
  (  
   @Company_Name,  
   @Company_Unit_Name,  
   @Product_Name, 
   @Task_Name,  
   @Remarks,  
   @Entered_By,  
   @Entered_Date ,
   @Difficulty,
   @Points	,
   @Email_Configuration,
   @No_Of_Days,
   @No_Of_Staffs   
  )  
 END  
 ELSE  
 BEGIN  
  UPDATE [Sub_Product_Master] SET  
   [Company_Name] = @Company_Name,  
   [Company_Unit_Name] = @Company_Unit_Name,  
   [Product_Name] = @Product_Name,  
   [Task_Name] = @Task_Name,  
   [Remarks] = @Remarks,  
   [Entered_By] = @Entered_By,  
   [Entered_Date] = @Entered_Date  ,
   [Difficulty] = @Difficulty ,
   [Points]	=@Points,
   [Email_Configuration]=@Email_Configuration,
   [No_Of_Days]=@No_Of_Days,
   [No_Of_Staffs]= @No_Of_Staffs
   WHERE [Product_Task_Id]=@Product_Task_Id  
 END  
END



GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Project_Product_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Sub_Project_Product_Master]  
 @Product_Task_Id  int,  
 @Company_Name  int,  
 @Company_Unit_Name  int,  
 @Project_Name int,
 @Product_Name  int,  
 @Process_Name  int,  
 @Task_Name varchar(200),  
 @Remarks  varchar(1000),  
 @Entered_By  int,  
 @Entered_Date  datetime ,
 @Difficulty	decimal(7,2),
 @Points	decimal(7,2),
 @Email_Configuration	varchar(1000),
 @No_Of_Days decimal(7,2),
 @No_Of_Staffs int  
AS  
BEGIN  
 IF NOT EXISTS( SELECT * FROM [Sub_Project_Product_Master] WHERE [Product_Task_Id]=@Product_Task_Id )  
 BEGIN  
  INSERT INTO  [Sub_Project_Product_Master]  
  (  
   [Company_Name],  
   [Company_Unit_Name],  
   [Project_Name], 
   [Product_Name], 
   [Process_Name], 
   [Task_Name], 
   [Remarks],  
   [Entered_By],  
   [Entered_Date] ,
   [Difficulty],
   [Points]	,
   [Email_Configuration],
   [No_Of_Days],
   [No_Of_Staffs]   
  )  
  VALUES  
  (  
   @Company_Name,  
   @Company_Unit_Name,  
   @Project_Name,   
   @Product_Name, 
   @Process_Name,
   @Task_Name,  
   @Remarks,  
   @Entered_By,  
   @Entered_Date ,
   @Difficulty,
   @Points	,
   @Email_Configuration,
   @No_Of_Days,
   @No_Of_Staffs   
  )  
 END  
 ELSE  
 BEGIN  
  UPDATE [Sub_Project_Product_Master] SET  
   [Company_Name] = @Company_Name,  
   [Company_Unit_Name] = @Company_Unit_Name,  
   [Project_Name] = @Project_Name,
   [Product_Name] = @Product_Name,  
   [Process_Name] = @Process_Name, 
   [Task_Name] = @Task_Name,  
   [Remarks] = @Remarks,  
   [Entered_By] = @Entered_By,  
   [Entered_Date] = @Entered_Date  ,
   [Difficulty] = @Difficulty ,
   [Points]	=@Points,
   [Email_Configuration]=@Email_Configuration,
   [No_Of_Days]=@No_Of_Days,
   [No_Of_Staffs]= @No_Of_Staffs
   WHERE [Product_Task_Id]=@Product_Task_Id  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Task_Entry]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Sub_Task_Entry]
@Sub_Task_Id  int,
@Project_Name  int,
@Task_Name  int,
@Sub_Task_Name  varchar(150),
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Sub_Task_Entry] WHERE [Sub_Task_Id]=@Sub_Task_Id )
BEGIN
INSERT INTO  [Sub_Task_Entry]
(
[Project_Name],
[Task_Name],
[Sub_Task_Name],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Project_Name,
@Task_Name,
@Sub_Task_Name,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Sub_Task_Entry] SET
[Project_Name] = @Project_Name,
[Task_Name] = @Task_Name,
[Sub_Task_Name] = @Sub_Task_Name,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Sub_Task_Id]=@Sub_Task_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Sub_Task_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Sub_Task_Master]  
 @Process_Task_Id  int,  
 @Company_Name  int,  
 @Company_Unit_Name  int,  
 @Process_Name  int,  
 @Task_Name  varchar(200),  
 @Remarks  varchar(1000),  
 @Entered_By  int,  
 @Entered_Date  datetime ,
 @Difficulty	decimal(7,2),
 @Points	decimal(7,2),
 @Email_Configuration	varchar(1000),
 @No_Of_Days decimal(7,2),
 @No_Of_Staffs int  
AS  
BEGIN  
 IF NOT EXISTS( SELECT * FROM [Sub_Task_Master] WHERE [Process_Task_Id]=@Process_Task_Id )  
 BEGIN  
  INSERT INTO  [Sub_Task_Master]  
  (  
   [Company_Name],  
   [Company_Unit_Name],  
   [Process_Name],  
   [Task_Name],  
   [Remarks],  
   [Entered_By],  
   [Entered_Date] ,
   [Difficulty],
   [Points]	,
   [Email_Configuration],
   [No_Of_Days],
   [No_Of_Staffs]   
  )  
  VALUES  
  (  
   @Company_Name,  
   @Company_Unit_Name,  
   @Process_Name,  
   @Task_Name,  
   @Remarks,  
   @Entered_By,  
   @Entered_Date ,
   @Difficulty,
   @Points	,
   @Email_Configuration,
   @No_Of_Days,
   @No_Of_Staffs   
  )  
 END  
 ELSE  
 BEGIN  
  UPDATE [Sub_Task_Master] SET  
   [Company_Name] = @Company_Name,  
   [Company_Unit_Name] = @Company_Unit_Name,  
   [Process_Name] = @Process_Name,  
   [Task_Name] = @Task_Name,  
   [Remarks] = @Remarks,  
   [Entered_By] = @Entered_By,  
   [Entered_Date] = @Entered_Date  ,
   [Difficulty] = @Difficulty ,
   [Points]	=@Points,
   [Email_Configuration]=@Email_Configuration,
   [No_Of_Days]=@No_Of_Days,
   [No_Of_Staffs]= @No_Of_Staffs
   WHERE [Process_Task_Id]=@Process_Task_Id  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SubCategory_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SubCategory_Master]
@SubCategory_Id  int,
@Category_Name  int,
@Sub_Category_Name  varchar(100),
@Description  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [SubCategory_Master] WHERE [SubCategory_Id]=@SubCategory_Id )
BEGIN
INSERT INTO  [SubCategory_Master]
(
[Category_Name],
[Sub_Category_Name],
[Description],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Category_Name,
@Sub_Category_Name,
@Description,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [SubCategory_Master] SET
[Category_Name] = @Category_Name,
[Sub_Category_Name] = @Sub_Category_Name,
[Description] = @Description,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [SubCategory_Id]=@SubCategory_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SuppliersMaster_StoreUpdate]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[Sp_SuppliersMaster_StoreUpdate]    
       
   @StockId INT,    
   @Total_Quantity decimal(7,2),    
   @Unit VARCHAR(10),    
   @EnteredBy INT,    
   @HFID INT,
   @Actual_Qty decimal(7,2),
   @Actual_Unit VARCHAR(10),    
   @Entered_Unit INT     
   --@EnteredDate DATETIME     
       
AS    
BEGIN    
     
 UPDATE SuppliersMaster SET Store_Status=1,Store_EnteredBy=@EnteredBy,Store_EnteredDate=GetDate()     
        where StockId=@StockId ANd Id=@HFID    
   If NOT EXISTS(select * from Store_Master where StockId=@StockId )    
   BEGIN      
    INSERT INTO Store_Master (StockId,Total_Quantity,Unit,EnteredBy,EnteredDate,[Status],actual_qty,actual_unit,Entered_Unit ) Values(    
       @StockId,    
       @Total_Quantity,    
       @Unit,    
       @EnteredBy,    
       GETDATE(),  
       1,
       @Actual_Qty,
       @Actual_Unit,  
       @Entered_Unit   
       )    
   END    
   ELSE    
   Begin    
       Update Store_Master set Total_Quantity=@Total_Quantity,Unit=@Unit,EnteredBy=@EnteredBy ,EnteredDate=GETDATE(), actual_qty=@Actual_Qty,actual_unit=@Actual_Unit  where StockId=@StockId     
   ENd    
END    


GO
/****** Object:  StoredProcedure [dbo].[Sp_Task_Assign_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Task_Assign_Master]
@DateFrom datetime
AS
BEGIN
SELECT Staff_Master.Staff_Id,Staff_Master.Staff_Name,Task_Master.Task_Description,
Project_Master.Project_Name,Task_Master.Task_Name,Task_Master.Start_Date,
Task_Master.End_Date,Task_Status
FROM Staff_Master
LEFT OUTER JOIN Resource_Allocation_master ON Resource_Allocation_master.Staff_Name = Staff_Master.Staff_Id
LEFT OUTER JOIN Task_Master ON Resource_Allocation_master.Task_Name = Task_Master.Task_Id AND Cast(Convert(varchar(20),@DateFrom,101) as datetime) BETWEEN Task_Master.Start_Date AND Task_Master.End_Date
LEFT OUTER JOIN Project_Master ON Project_Master.ProjectId = Task_Master.Project_Name

ORDER BY CASE WHEN Task_Master.Task_Name IS NULL THEN 1 ELSE 0 END DESC
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Configuration]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Task_Configuration]
@Task_Configuration_Id  int,
@Task_Name  varchar(500),
@Task_Instruction  varchar(2000),
@Entered_By  int,
@Entered_Date  datetime,
@CategoryId  int,
@UnitId  int,
@Price	int,
@Entered_Unit int,
@Pic  varchar(150),
@CostPrice int

AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Task_Configuration] WHERE [Task_Configuration_Id]=@Task_Configuration_Id )
BEGIN
INSERT INTO  [Task_Configuration]
(

[Task_Name],
[Task_Instruction],
[Entered_By],
[Entered_Date],
[CategoryId],
[UnitId],
[Price],
[Entered_Unit],
[Pic],
[CostPrice]
)
VALUES
(
@Task_Name,
@Task_Instruction,
@Entered_By,
@Entered_Date,
@CategoryId,
@UnitId,
@Price,
@Entered_Unit,
@Pic,
@CostPrice

)

END
ELSE
BEGIN
UPDATE [Task_Configuration] SET
[Task_Name] = @Task_Name,
[Task_Instruction] = @Task_Instruction,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[CategoryId] = @CategoryId,
[UnitId] = @UnitId,
[Price] = @Price,
[pic] = @Pic,
[CostPrice]=@CostPrice
WHERE [Task_Configuration_Id]=@Task_Configuration_Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Delink]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Delink]  
@Staff_Name INT,  
@DelinkFrom DateTime,  
@DelinkTo DateTime,  
@Entered_By INT  
AS  
BEGIN  
  
DECLARE  
@Task_Name INT,  
@Start_Date DATETIME,  
@End_Date DATETIME,  
@Task_Identity INT  
  
DECLARE Task_Cursor CURSOR LOCAL FOR  
SELECT [Task_Id],[Start_Date] ,[End_Date] FROM Task_Master  
WHERE [Start_Date] <=@DelinkFrom AND [End_Date]>=@DelinkTo  
AND [Task_Id] IN (SELECT Task_Name FROM Resource_Allocation_Master WHERE Staff_Name = @Staff_Name )  
OPEN Task_Cursor  
FETCH NEXT FROM Task_Cursor INTO  @Task_Name,@Start_Date, @End_Date  
WHILE(@@FETCH_STATUS=0)  
BEGIN  
IF @Start_Date< @DelinkFrom AND @End_Date > @DelinkTo  
BEGIN  
/* Replan for existing task */  
INSERT INTO Task_Master  
(  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
End_Date,  
Resource,  
Task_Status,  
Remarks,  
Entered_By,  
Entered_Date,  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_RefId,  
Task_Configuration_Id,
Process_Id ,
Parent_TaskId 
)  
SELECT  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
DATEADD(dd,-1,@DelinkFrom),  
Resource,  
Task_Status,  
Remarks,  
@Entered_By,  
GetDate(),  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_ID,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
FROM Task_Master WHERE Task_ID=@Task_Name  
  
SET @Task_Identity = @@IDENTITY  
  
UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity  
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name  
  
INSERT INTO Task_Master  
(  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
End_Date,  
Resource,  
Task_Status,  
Remarks,  
Entered_By,  
Entered_Date,  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_RefId,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
)  
SELECT  
Project_Name,  
Task_Name,  
Task_Description,  
DATEADD(dd,1,@DelinkTo),  
@End_Date,  
Resource,  
Task_Status,  
Remarks,  
@Entered_By,  
GetDate(),  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_ID,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
FROM Task_Master WHERE Task_ID=@Task_Name  
  
SET @Task_Identity = @@IDENTITY  
EXEC SP_Resource_Allocation_Master NULL, @Staff_Name,@Task_Identity  
END  
ELSE IF @Start_Date= @DelinkFrom AND  @End_Date>@DelinkTo  
BEGIN  
  
INSERT INTO Task_Master  
(  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
End_Date,  
Resource,  
Task_Status,  
Remarks,  
Entered_By,  
Entered_Date,  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_RefId,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
)  
SELECT  
Project_Name,  
Task_Name,  
Task_Description,  
DATEADD(dd,1,@DelinkTo),  
@End_Date,  
Resource,  
Task_Status,  
Remarks,  
@Entered_By,  
GetDate(),  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_ID,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
FROM Task_Master WHERE Task_ID=@Task_Name  
  
SET @Task_Identity = @@IDENTITY  
  
UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity  
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name  
  
END  
ELSE IF @Start_Date< @DelinkFrom AND  @End_Date >= @DelinkTo  
BEGIN  
INSERT INTO Task_Master  
(  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
End_Date,  
Resource,  
Task_Status,  
Remarks,  
Entered_By,  
Entered_Date,  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_RefId,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
)  
SELECT  
Project_Name,  
Task_Name,  
Task_Description,  
Start_Date,  
DATEADD(dd,-1,@DelinkFrom),  
Resource,  
Task_Status,  
Remarks,  
@Entered_By,  
GetDate(),  
Entered_unit,  
Department_Name,  
Team_Name,  
Designation_Name,  
Task_ID,  
Task_Configuration_Id ,
Process_Id ,
Parent_TaskId 
FROM Task_Master WHERE Task_ID=@Task_Name  
  
SET @Task_Identity = @@IDENTITY  
  
UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity  
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name  
END  
ELSE IF(@Start_Date = @DelinkFrom AND  @End_Date = @DelinkTo)  
BEGIN  
IF ( (SELECT Count(*) From Resource_Allocation_Master WHERE Task_Name = @Task_Name )>1)  
BEGIN  
DELETE FROM Resource_Allocation_Master WHERE Task_Name = @Task_Name  
AND Staff_Name = @Staff_Name  
END  
ELSE  
BEGIN  
IF EXISTS (SELECT * FROM Task_Master WHERE Task_RefId = @Task_Name)  
BEGIN  
SELECT @Task_Identity  = Task_Id FROM Task_Master WHERE Task_RefId = @Task_Name  
UPDATE Task_Master SET Task_RefId = @Task_Identity WHERE Task_RefId = @Task_Name  
END  
DELETE FROM Resource_Allocation_Master WHERE Task_Name = @Task_Name  
DELETE FROM Task_Master WHERE Task_Id = @Task_Name  
END  
END  
FETCH NEXT FROM Task_Cursor INTO  @Task_Name,@Start_Date, @End_Date  
END  
CLOSE Task_Cursor;  
DEALLOCATE Task_Cursor;  
  
END  
  
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Delink1]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Delink1]
@Staff_Name INT,
@DelinkFrom DateTime,
@DelinkTo DateTime,
@Entered_By INT
AS
BEGIN

DECLARE
@Task_Name INT,
@Start_Date DATETIME,
@End_Date DATETIME,
@Task_Identity INT

DECLARE Task_Cursor CURSOR LOCAL FOR
SELECT [Task_Id],[Start_Date] ,[End_Date] FROM Task_Master
WHERE [Start_Date] <=@DelinkFrom AND [End_Date]>=@DelinkTo
AND [Task_Id] IN (SELECT Task_Name FROM Resource_Allocation_Master WHERE Staff_Name = @Staff_Name )
OPEN Task_Cursor
FETCH NEXT FROM Task_Cursor INTO  @Task_Name,@Start_Date, @End_Date
WHILE(@@FETCH_STATUS=0)
BEGIN
IF @Start_Date< @DelinkFrom AND @End_Date > @DelinkTo
BEGIN
/* Replan for existing task */
INSERT INTO Task_Master
(
Project_Name,
Task_Name,
Task_Description,
Start_Date,
End_Date,
Resource,
Task_Status,
Remarks,
Entered_By,
Entered_Date,
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_RefId
)
SELECT
Project_Name,
Task_Name,
Task_Description,
Start_Date,
DATEADD(dd,-1,@DelinkFrom),
Resource,
Task_Status,
Remarks,
@Entered_By,
GetDate(),
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_ID
FROM Task_Master WHERE Task_ID=@Task_Name

SET @Task_Identity = @@IDENTITY

UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name

INSERT INTO Task_Master
(
Project_Name,
Task_Name,
Task_Description,
Start_Date,
End_Date,
Resource,
Task_Status,
Remarks,
Entered_By,
Entered_Date,
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_RefId
)
SELECT
Project_Name,
Task_Name,
Task_Description,
DATEADD(dd,1,@DelinkTo),
@End_Date,
Resource,
Task_Status,
Remarks,
@Entered_By,
GetDate(),
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_ID
FROM Task_Master WHERE Task_ID=@Task_Name

SET @Task_Identity = @@IDENTITY
EXEC SP_Resource_Allocation_Master NULL, @Staff_Name,@Task_Identity
END
ELSE IF @Start_Date= @DelinkFrom AND  @End_Date>@DelinkTo
BEGIN

INSERT INTO Task_Master
(
Project_Name,
Task_Name,
Task_Description,
Start_Date,
End_Date,
Resource,
Task_Status,
Remarks,
Entered_By,
Entered_Date,
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_RefId
)
SELECT
Project_Name,
Task_Name,
Task_Description,
DATEADD(dd,1,@DelinkTo),
@End_Date,
Resource,
Task_Status,
Remarks,
@Entered_By,
GetDate(),
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_ID
FROM Task_Master WHERE Task_ID=@Task_Name

SET @Task_Identity = @@IDENTITY

UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name

END
ELSE IF @Start_Date< @DelinkFrom AND  @End_Date >= @DelinkTo
BEGIN
INSERT INTO Task_Master
(
Project_Name,
Task_Name,
Task_Description,
Start_Date,
End_Date,
Resource,
Task_Status,
Remarks,
Entered_By,
Entered_Date,
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_RefId
)
SELECT
Project_Name,
Task_Name,
Task_Description,
Start_Date,
DATEADD(dd,-1,@DelinkFrom),
Resource,
Task_Status,
Remarks,
@Entered_By,
GetDate(),
Entered_unit,
Department_Name,
Team_Name,
Designation_Name,
Task_ID
FROM Task_Master WHERE Task_ID=@Task_Name

SET @Task_Identity = @@IDENTITY

UPDATE Resource_Allocation_Master Set Task_Name = @Task_Identity
WHERE Task_Name = @Task_Name AND Staff_Name = @Staff_Name
END
ELSE IF(@Start_Date = @DelinkFrom AND  @End_Date = @DelinkTo)
BEGIN
IF ( (SELECT Count(*) From Resource_Allocation_Master WHERE Task_Name = @Task_Name )>1)
BEGIN
DELETE FROM Resource_Allocation_Master WHERE Task_Name = @Task_Name
AND Staff_Name = @Staff_Name
END
ELSE
BEGIN
IF EXISTS (SELECT * FROM Task_Master WHERE Task_RefId = @Task_Name)
BEGIN
SELECT @Task_Identity  = Task_Id FROM Task_Master WHERE Task_RefId = @Task_Name
UPDATE Task_Master SET Task_RefId = @Task_Identity WHERE Task_RefId = @Task_Name
END
DELETE FROM Resource_Allocation_Master WHERE Task_Name = @Task_Name
DELETE FROM Task_Master WHERE Task_Id = @Task_Name
END
END
FETCH NEXT FROM Task_Cursor INTO  @Task_Name,@Start_Date, @End_Date
END
CLOSE Task_Cursor;
DEALLOCATE Task_Cursor;

END



GO
/****** Object:  StoredProcedure [dbo].[SP_Task_EmailSending]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_EmailSending]        
@Task_Id INT ,       
@Type INT      
As        
BEGIN        
SET NOCOUNT Off    
 IF @Type =1       
 BEGIN      
       
   SELECT ISNULL(g.Email_Configuration , ISNULL(e.Email_Configuration ,d.Email_Configuration)) As Email_Configuration ,      
   b.Project_Name,d.Process_Name , a.Task_Name, c.Status_Value,a.Task_Description,a.Completed_Date,
   Case When a.start_date < GETDATE() AND a.Task_Status =2 Then
			'Not Yet Started'
		When a.End_date < GETDATE() AND Completed_Date IS NULL Then
			'Not Yet Completed'	
		Else
			Status_Value	
		End As Task_Subject, a.Task_Id
   FROM         
   Project_Task_Master a           
   INNER JOIN Project_Master b ON b.ProjectId = a.Project_Name      
   INNER JOIN Task_Status_Master c ON c.Status_Id = a.Task_Status      
   INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id          
   LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id          
   LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name          
   WHERE  Task_Id = @Task_Id      
        
 END        
 ELSE IF (@Type=2)      
 BEGIN      
         
   SELECT TOP 1 ISNULL(g.Email_Configuration , ISNULL(e.Email_Configuration ,d.Email_Configuration)) As Email_Configuration ,      
   b.Project_Name,d.Process_Name , a.Task_Name, c.Status_Value,a.Task_Description, a.Completed_Date,
     Case When a.start_date < GETDATE() AND a.Task_Status =2 Then
			'Not Yet Started'
		When a.End_date < GETDATE() AND Completed_Date IS NULL Then
			'Not Yet Completed'	
		Else
			Status_Value	
		End As Task_Subject,a.Task_Id
   FROM         
   Project_Task_Master a           
   INNER JOIN Project_Master b ON b.ProjectId = a.Project_Name      
   INNER JOIN Task_Status_Master c ON c.Status_Id = a.Task_Status      
   INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id          
   LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id          
   LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name          
   WHERE Completed_Date IS NULL  AND Task_Id > @Task_Id ORDER BY a.End_Date DESC      
      
 END      
 ELSE IF (@Type=3)      
 BEGIN      
  SELECT * FROM VW_ACtive_STAFF_Master      
  WHERE Staff_Id IN 
  (
   SELECT Staff_Name FROM Project_Resource_Master WHERE Task_Name = @Task_Id
   UNION
   SELECT Entered_By FROM Project_Task_Master WHERE Task_Id = @Task_Id
  )      
 END      
SET NOCOUNT On    
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Engineering_Status]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Task_Engineering_Status]
@Status_Value  int,
@Status  varchar(100),
@Color_Code  varchar(10),
@Remarks  varchar(1000),
@Entered_Unit  int,
@Entered_Date  datetime,
@Entered_By  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Task_Engineering_Status] WHERE [Status_Value]=@Status_Value )
BEGIN
INSERT INTO  [Task_Engineering_Status]
(
[Status],
[Color_Code],
[Remarks],
[Entered_Unit],
[Entered_Date],
[Entered_By]
)
VALUES
(
@Status,
@Color_Code,
@Remarks,
@Entered_Unit,
@Entered_Date,
@Entered_By
)
END
ELSE
BEGIN
UPDATE [Task_Engineering_Status] SET
[Status] = @Status,
[Color_Code] = @Color_Code,
[Remarks] = @Remarks,
[Entered_Unit] = @Entered_Unit,
[Entered_Date] = @Entered_Date,
[Entered_By] = @Entered_By
WHERE [Status_Value]=@Status_Value
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Hours]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Hours]
@Year INT,
@Month INT,
@Staff_Id INT
AS
BEGIN
DECLARE @Late_Coming TIME,
@Early_leaving TIME,
@No_Of_Late tinyint,
@Loss_Of_Pay decimal(5,2)


SELECT TOP 1 @Late_Coming = Late_Coming, @Early_leaving = Early_leaving,
@No_Of_Late = No_Of_Late,@Loss_Of_Pay= Loss_Of_Pay
FROM [Attendance_Configuration]

IF  @Month =0
BEGIN
SELECT Staff_Name,CAST(CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))/60 AS  VARCHAR) +'.'+
CASE WHEN (Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60)<10 Then
'0'+CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)
ELSE
CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)
END
AS DECIMAL(7,2)) AS Total,
0 As AryPosition
FROM Time_Sheet_Master
WHERE YEAR(Task_Date) = @year
AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL
GROUP BY Staff_Name
UNION
SELECT Staff_Name,Count(*),1
FROM Time_Sheet_Master
WHERE YEAR(Task_Date) = @year
AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL
GROUP BY Staff_Name
END
ELSE
BEGIN

SELECT Staff_Name,CAST(CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))/60 AS  VARCHAR) +'.'+
CASE WHEN (Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60)<10 Then
'0'+CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)
ELSE
CAST(Sum(datediff(N,Cast(Start_Time as datetime),CAST ( End_Time as Datetime)))% 60 AS  VARCHAR)
END
AS DECIMAL(7,2)) AS Total,
0 As AryPosition
FROM Time_Sheet_Master
WHERE YEAR(Task_Date) = @year and MONTH(Task_Date) = @Month
AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL
GROUP BY Staff_Name
UNION
SELECT Staff_Name,Count(*),1
FROM Time_Sheet_Master
WHERE YEAR(Task_Date) = @year and MONTH(Task_Date) = @Month
AND Staff_Name=@Staff_Id AND Start_Time IS NOT NULL AND End_Time IS NOT NULL
GROUP BY Staff_Name

END

END


GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Mapping]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Task_Mapping]
@Project_Name  int,
@Task_Configuration_Id  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Task_Mapping] WHERE [Project_Name]=@Project_Name AND [Task_Configuration_Id]=@Task_Configuration_Id)
BEGIN
INSERT INTO  [Task_Mapping]
(
[Project_Name],
[Task_Configuration_Id]
)
VALUES
(
@Project_Name,
@Task_Configuration_Id
)
END
SELECT @Task_Configuration_Id AS Task_Configuration_Id
END



GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Master]                  



@Task_Id  int,                  



@Project_Name  int,                  



@Task_Name  varchar(300),                  



@Task_Description  varchar(1000),                  



@Start_Date  datetime,                  



@End_Date  datetime,                  



@Department_Name  int,                  



@Team_Name  int,                  



@Designation_Name  int,                  



@Resource  int =null,                  



@Task_Status  int,                  



@Entered_Date  datetime,                  



@Remarks  varchar(1000),                  



@Entered_By  int,                  



@Entered_Unit  int,                  



@Task_Configuration_Id int,        



@Process_Id INT = NULL,        



@Parent_TaskId INT = NULL ,  



@Sub_Task_Id INT = NULL ,



@Location varchar(500),

@Task_Map_Id INT =NULL        



AS                  



BEGIN             



IF (@Parent_TaskId IS NOT NULL)



BEGIN



SELECT @Task_Configuration_Id=Task_Configuration_Id,



			@Process_Id=Process_Id,



			 @Sub_Task_Id = Sub_Task_Id 



 FROM Project_Task_Master WHERE Task_Id =@Parent_TaskId     



END 



    



IF NOT EXISTS( SELECT * FROM [Task_Master] WHERE [Task_Id]=@Task_Id )                  



BEGIN                  



INSERT INTO  [Task_Master]                  



(                  



[Project_Name],                  



[Task_Name],                  



[Task_Description],                  



[Start_Date],                  



[End_Date],                  



[Department_Name],                  



[Team_Name],                  



[Designation_Name],                  



[Resource],                  



[Task_Status],                  



[Entered_Date],                  



[Remarks],                  



[Entered_By],                  



[Entered_Unit],                  



[Task_Configuration_Id],        



[Process_Id]  ,              



[Parent_TaskId] ,  



[Sub_Task_Id] ,



[Location],

[Task_Map_Id]

              



)                  



VALUES                  



(                  



@Project_Name,                  



@Task_Name,                  



@Task_Description,                  



@Start_Date,                  



@End_Date,                  



@Department_Name,                  



@Team_Name,                  



@Designation_Name,                  



@Resource,                  



@Task_Status,                  



@Entered_Date,                  



@Remarks,                  



@Entered_By,                  



@Entered_Unit,                  



@Task_Configuration_Id,        



@Process_Id,        



@Parent_TaskId ,  



 @Sub_Task_Id,



 @Location,
 
 @Task_Map_Id      



)                  



SET @Task_Id = @@IDENTITY                  



END                  



ELSE                  



BEGIN                  



UPDATE [Task_Master] SET                  



[Project_Name] = @Project_Name,                  



[Task_Name] = @Task_Name,                  



[Task_Description] = @Task_Description,                  



[Start_Date] = @Start_Date,                  



[End_Date] = @End_Date,                  



[Department_Name] = @Department_Name,                  



[Team_Name] = @Team_Name,                  



[Designation_Name] = @Designation_Name,                  



[Resource] = @Resource,                  



[Task_Status] = @Task_Status,                  



[Entered_Date] = @Entered_Date,                  



[Remarks] = @Remarks,                  



[Entered_By] = @Entered_By,                  



[Entered_Unit] = @Entered_Unit,                  



[Task_Configuration_Id]=@Task_Configuration_Id ,



[Location]=@Location,

[Task_Map_Id]=@Task_Map_Id         



WHERE [Task_Id]=@Task_Id                  



                  



   



                   



      



                  



END   







 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      



 BEGIN      



  UPDATE [Project_Task_Master] SET  [Task_Status] = @Task_Status ,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE  Task_Id IN      



       (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )            



   



        UPDATE Task_Master SET [Task_Status] = @Task_Status,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)   WHERE Task_RefId = @Task_Id                  



                  



  UPDATE Task_Master SET [Task_Status] = @Task_Status , [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)                  



  WHERE Project_Name= @Project_Name AND                  



  Task_Configuration_Id =@Task_Configuration_Id         



               



  UPDATE Task_Master SET [Task_Status] = @Task_Status, [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)  WHERE Task_Id IN(                  



  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)        



      



 END               



 ELSE      



 BEGIN      



        



  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_RefId = @Task_Id                  



                  



  UPDATE Task_Master SET [Task_Status] = @Task_Status                  



  WHERE Project_Name= @Project_Name AND                  



  Task_Configuration_Id =@Task_Configuration_Id         



               



  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_Id IN(                  



  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)       



      



  UPDATE Project_Task_Master SET     [Task_Status] = @Task_Status  WHERE Task_Id IN      



  (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )              



 END   



                



SELECT @Task_Id AS Task_Id                  



END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Master_2015-06-08]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Master_2015-06-08]                  
@Task_Id  int,                  
@Project_Name  int,                  
@Task_Name  varchar(300),                  
@Task_Description  varchar(1000),                  
@Start_Date  datetime,                  
@End_Date  datetime,                  
@Department_Name  int,                  
@Team_Name  int,                  
@Designation_Name  int,                  
@Resource  int =null,                  
@Task_Status  int,                  
@Entered_Date  datetime,                  
@Remarks  varchar(1000),                  
@Entered_By  int,                  
@Entered_Unit  int,                  
@Task_Configuration_Id int,        
@Process_Id INT = NULL,        
@Parent_TaskId INT = NULL ,  
@Sub_Task_Id INT = NULL ,
@Location varchar(500)        
AS                  
BEGIN             
IF (@Parent_TaskId IS NOT NULL)
BEGIN
SELECT @Task_Configuration_Id=Task_Configuration_Id,
			@Process_Id=Process_Id,
			 @Sub_Task_Id = Sub_Task_Id 
 FROM Project_Task_Master WHERE Task_Id =@Parent_TaskId     
END 
    
IF NOT EXISTS( SELECT * FROM [Task_Master] WHERE [Task_Id]=@Task_Id )                  
BEGIN                  
INSERT INTO  [Task_Master]                  
(                  
[Project_Name],                  
[Task_Name],                  
[Task_Description],                  
[Start_Date],                  
[End_Date],                  
[Department_Name],                  
[Team_Name],                  
[Designation_Name],                  
[Resource],                  
[Task_Status],                  
[Entered_Date],                  
[Remarks],                  
[Entered_By],                  
[Entered_Unit],                  
[Task_Configuration_Id],        
[Process_Id]  ,              
[Parent_TaskId] ,  
[Sub_Task_Id] ,
[Location]              
)                  
VALUES                  
(                  
@Project_Name,                  
@Task_Name,                  
@Task_Description,                  
@Start_Date,                  
@End_Date,                  
@Department_Name,                  
@Team_Name,                  
@Designation_Name,                  
@Resource,                  
@Task_Status,                  
@Entered_Date,                  
@Remarks,                  
@Entered_By,                  
@Entered_Unit,                  
@Task_Configuration_Id,        
@Process_Id,        
@Parent_TaskId ,  
 @Sub_Task_Id,
 @Location      
)                  
SET @Task_Id = @@IDENTITY                  
END                  
ELSE                  
BEGIN                  
UPDATE [Task_Master] SET                  
[Project_Name] = @Project_Name,                  
[Task_Name] = @Task_Name,                  
[Task_Description] = @Task_Description,                  
[Start_Date] = @Start_Date,                  
[End_Date] = @End_Date,                  
[Department_Name] = @Department_Name,                  
[Team_Name] = @Team_Name,                  
[Designation_Name] = @Designation_Name,                  
[Resource] = @Resource,                  
[Task_Status] = @Task_Status,                  
[Entered_Date] = @Entered_Date,                  
[Remarks] = @Remarks,                  
[Entered_By] = @Entered_By,                  
[Entered_Unit] = @Entered_Unit,                  
[Task_Configuration_Id]=@Task_Configuration_Id ,
[Location]=@Location         
WHERE [Task_Id]=@Task_Id                  
                  
   
                   
      
                  
END   

 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      
 BEGIN      
  UPDATE [Project_Task_Master] SET   [Task_Status] = @Task_Status ,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE  Task_Id IN      
       (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )            
               
        UPDATE Task_Master SET [Task_Status] = @Task_Status,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)   WHERE Task_RefId = @Task_Id                  
                  
  UPDATE Task_Master SET [Task_Status] = @Task_Status , [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)                  
  WHERE Project_Name= @Project_Name AND                  
  Task_Configuration_Id =@Task_Configuration_Id         
               
  UPDATE Task_Master SET [Task_Status] = @Task_Status, [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)  WHERE Task_Id IN(                  
  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)        
      
 END               
 ELSE      
 BEGIN      
        
  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_RefId = @Task_Id                  
                  
  UPDATE Task_Master SET [Task_Status] = @Task_Status                  
  WHERE Project_Name= @Project_Name AND                  
  Task_Configuration_Id =@Task_Configuration_Id         
               
  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_Id IN(                  
  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)       
      
  UPDATE Project_Task_Master SET     [Task_Status] = @Task_Status  WHERE Task_Id IN      
  (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )              
 END   
                
SELECT @Task_Id AS Task_Id                  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Master_21072014]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Master_21072014]                  

@Task_Id  int,                  

@Project_Name  int,                  

@Task_Name  varchar(300),                  

@Task_Description  varchar(1000),                  

@Start_Date  datetime,                  

@End_Date  datetime,                  

@Department_Name  int,                  

@Team_Name  int,                  

@Designation_Name  int,                  

@Resource  int =null,                  

@Task_Status  int,                  

@Entered_Date  datetime,                  

@Remarks  varchar(1000),                  

@Entered_By  int,                  

@Entered_Unit  int,                  

@Task_Configuration_Id int,        

@Process_Id INT = NULL,        

@Parent_TaskId INT = NULL ,  

@Sub_Task_Id INT = NULL         

AS                  

BEGIN             

IF (@Parent_TaskId IS NOT NULL)

BEGIN

SELECT @Task_Configuration_Id=Task_Configuration_Id,

			@Process_Id=Process_Id,

			 @Sub_Task_Id = Sub_Task_Id 

 FROM Project_Task_Master WHERE Task_Id =@Parent_TaskId     

END 

    

IF NOT EXISTS( SELECT * FROM [Task_Master] WHERE [Task_Id]=@Task_Id )                  

BEGIN                  

INSERT INTO  [Task_Master]                  

(                  

[Project_Name],                  

[Task_Name],                  

[Task_Description],                  

[Start_Date],                  

[End_Date],                  

[Department_Name],                  

[Team_Name],                  

[Designation_Name],                  

[Resource],                  

[Task_Status],                  

[Entered_Date],                  

[Remarks],                  

[Entered_By],                  

[Entered_Unit],                  

[Task_Configuration_Id],        

[Process_Id]  ,              

[Parent_TaskId] ,  

[Sub_Task_Id]               

)                  

VALUES                  

(                  

@Project_Name,                  

@Task_Name,                  

@Task_Description,                  

@Start_Date,                  

@End_Date,                  

@Department_Name,                  

@Team_Name,                  

@Designation_Name,                  

@Resource,                  

@Task_Status,                  

@Entered_Date,                  

@Remarks,                  

@Entered_By,                  

@Entered_Unit,                  

@Task_Configuration_Id,        

@Process_Id,        

@Parent_TaskId ,  

 @Sub_Task_Id      

)                  

SET @Task_Id = @@IDENTITY                  

END                  

ELSE                  

BEGIN                  

UPDATE [Task_Master] SET                  

[Project_Name] = @Project_Name,                  

[Task_Name] = @Task_Name,                  

[Task_Description] = @Task_Description,                  

[Start_Date] = @Start_Date,                  

[End_Date] = @End_Date,                  

[Department_Name] = @Department_Name,                  

[Team_Name] = @Team_Name,                  

[Designation_Name] = @Designation_Name,                  

[Resource] = @Resource,                  

[Task_Status] = @Task_Status,                  

[Entered_Date] = @Entered_Date,                  

[Remarks] = @Remarks,                  

[Entered_By] = @Entered_By,                  

[Entered_Unit] = @Entered_Unit,                  

[Task_Configuration_Id]=@Task_Configuration_Id          

WHERE [Task_Id]=@Task_Id                  

                  

   

                   

      

                  

END   



 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      

 BEGIN      

  UPDATE [Project_Task_Master] SET   [Task_Status] = @Task_Status ,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE  Task_Id IN      

       (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )            

               

        UPDATE Task_Master SET [Task_Status] = @Task_Status,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)   WHERE Task_RefId = @Task_Id                  

                  

  UPDATE Task_Master SET [Task_Status] = @Task_Status , [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)                  

  WHERE Project_Name= @Project_Name AND                  

  Task_Configuration_Id =@Task_Configuration_Id         

               

  UPDATE Task_Master SET [Task_Status] = @Task_Status, [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)  WHERE Task_Id IN(                  

  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)        

      

 END               

 ELSE      

 BEGIN      

        

  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_RefId = @Task_Id                  

                  

  UPDATE Task_Master SET [Task_Status] = @Task_Status                  

  WHERE Project_Name= @Project_Name AND                  

  Task_Configuration_Id =@Task_Configuration_Id         

               

  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_Id IN(                  

  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)       

      

  UPDATE Project_Task_Master SET     [Task_Status] = @Task_Status  WHERE Task_Id IN      

  (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )              

 END   

                

SELECT @Task_Id AS Task_Id                  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Master2]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_Task_Master2]                  

@Task_Id  int,                  

@Project_Name  int,                  

@Task_Name  varchar(300),                  

@Task_Description  varchar(1000),                  

@Start_Date  datetime,                  

@End_Date  datetime,                  

@Department_Name  int,                  

@Team_Name  int,                  

@Designation_Name  int,                  

@Resource  int =null,                  

@Task_Status  int,                  

@Entered_Date  datetime,                  

@Remarks  varchar(1000),                  

@Entered_By  int,                  

@Entered_Unit  int,                  

@Task_Configuration_Id int,        

@Process_Id INT = NULL,        

@Parent_TaskId INT = NULL ,  

@Sub_Task_Id INT = NULL ,

@Location varchar(500) ,

@Task_Map_Id int       

AS                  

BEGIN             

IF (@Parent_TaskId IS NOT NULL)

BEGIN

SELECT @Task_Configuration_Id=Task_Configuration_Id,

			@Process_Id=Process_Id,

			 @Sub_Task_Id = Sub_Task_Id 

 FROM Project_Task_Master WHERE Task_Id =@Parent_TaskId     

END 

    

IF NOT EXISTS( SELECT * FROM [Task_Master] WHERE [Task_Id]=@Task_Id )                  

BEGIN                  

INSERT INTO  [Task_Master]                  

(                  

[Project_Name],                  

[Task_Name],                  

[Task_Description],                  

[Start_Date],                  

[End_Date],                  

[Department_Name],                  

[Team_Name],                  

[Designation_Name],                  

[Resource],                  

[Task_Status],                  

[Entered_Date],                  

[Remarks],                  

[Entered_By],                  

[Entered_Unit],                  

[Task_Configuration_Id],        

[Process_Id]  ,              

[Parent_TaskId] ,  

[Sub_Task_Id] ,

[Location],

[Task_Map_Id]              

)                  

VALUES                  

(                  

@Project_Name,                  

@Task_Name,                  

@Task_Description,                  

@Start_Date,                  

@End_Date,                  

@Department_Name,                  

@Team_Name,                  

@Designation_Name,                  

@Resource,                  

@Task_Status,                  

@Entered_Date,                  

@Remarks,                  

@Entered_By,                  

@Entered_Unit,                  

@Task_Configuration_Id,        

@Process_Id,        

@Parent_TaskId ,  

 @Sub_Task_Id,

 @Location,

 @Task_Map_Id      

)                  

SET @Task_Id = @@IDENTITY                  

END                  

ELSE                  

BEGIN                  

UPDATE [Task_Master] SET                  

[Project_Name] = @Project_Name,                  

[Task_Name] = @Task_Name,                  

[Task_Description] = @Task_Description,                  

[Start_Date] = @Start_Date,                  

[End_Date] = @End_Date,                  

[Department_Name] = @Department_Name,                  

[Team_Name] = @Team_Name,                  

[Designation_Name] = @Designation_Name,                  

[Resource] = @Resource,                  

[Task_Status] = @Task_Status,                  

[Entered_Date] = @Entered_Date,                  

[Remarks] = @Remarks,                  

[Entered_By] = @Entered_By,                  

[Entered_Unit] = @Entered_Unit,                  

[Task_Configuration_Id]=@Task_Configuration_Id ,

[Location]=@Location,

[Task_Map_Id]=@Task_Map_Id         

WHERE [Task_Id]=@Task_Id                  

                  

   

                   

      

                  

END   



 IF EXISTS (SELECT * FROM Task_Status_Master WHERE Status_Id = @Task_Status AND Status_Value='Completed')      

 BEGIN      

  UPDATE [Project_Task_Master] SET   [Task_Status] = @Task_Status ,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime) WHERE  Task_Id IN      

       (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )            

               

        UPDATE Task_Master SET [Task_Status] = @Task_Status,[Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)   WHERE Task_RefId = @Task_Id                  

                  

  UPDATE Task_Master SET [Task_Status] = @Task_Status , [Completed_Date] =CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)                  

  WHERE Project_Name= @Project_Name AND                  

  Task_Configuration_Id =@Task_Configuration_Id         

               

  UPDATE Task_Master SET [Task_Status] = @Task_Status, [Completed_Date] = CAST(CONVERT(VARCHAR(20),GETDATE(),101) As dateTime)  WHERE Task_Id IN(                  

  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)        

      

 END               

 ELSE      

 BEGIN      

        

  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_RefId = @Task_Id                  

                  

  UPDATE Task_Master SET [Task_Status] = @Task_Status                  

  WHERE Project_Name= @Project_Name AND                  

  Task_Configuration_Id =@Task_Configuration_Id         

               

  UPDATE Task_Master SET [Task_Status] = @Task_Status  WHERE Task_Id IN(                  

  SELECT Task_RefId FROM Task_Master WHERE Task_Id = @Task_Id AND Task_RefId IS NULL)       

      

  UPDATE Project_Task_Master SET     [Task_Status] = @Task_Status  WHERE Task_Id IN      

  (SELECT Parent_TaskId FROM Task_Master Where Task_Id=@Task_Id )              

 END   

                

SELECT @Task_Id AS Task_Id                  

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Order]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Order]    
 @Project_Id INT,    
 @Process_Id INT,    
 @Task_Id INT,    
 @IntStart INT OUTPUT,    
 @Task_Version VARCHAR(20)OUTPUT    
As     
BEGIN    
    
 DECLARE @Task_Name INT,    
   @Task_Order_No INT,    
   @Task_ParentId INT,    
   @Is_Parent INT,    
   @TVersion VARCHAR(20),    
   @intSNo int    
 SET @intSNo =1    
     
 SET @IntStart= ISNULL(@IntStart,1)    
 If @Task_Id IS NOT NULL    
 BEGIN    
    
 DECLARE Task_Order_Cursor CURSOR LOCAL FOR      
 SELECT [Task_Id],[Parent_TaskId],    
 CASE WHEN EXISTS (SELECT * FROM Project_Task_Master  WHERE Parent_TaskId=a.Task_Id) THEN    
  1    
 ELSE    
  0    
 END AS Is_Parent    
 FROM Project_Task_Master a     
 WHERE [Project_Name] =@Project_Id AND [Process_Id]=@Process_Id  AND     
 Parent_TaskId=@Task_Id    
 ORDER BY ISNULL(Task_Order,Task_Id) ASC    
   
 END    
 ELSE    
 BEGIN    
   
     DECLARE Task_Order_Cursor CURSOR LOCAL FOR      
  SELECT [Task_Id],[Parent_TaskId],    
  CASE WHEN EXISTS (SELECT * FROM Project_Task_Master  WHERE Parent_TaskId=a.Task_Id) THEN    
   1    
   ELSE    
   0    
   END AS Is_Parent    
   FROM Project_Task_Master a     
  WHERE [Project_Name] =@Project_Id AND [Process_Id]=@Process_Id  AND     
  Parent_TaskId IS NULL    
  ORDER BY ISNULL(Task_Order,Task_Id) ASC    
    
 END    
 OPEN Task_Order_Cursor      
 FETCH NEXT FROM Task_Order_Cursor INTO  @Task_Name,@Task_ParentId,@Is_Parent     
 WHILE(@@FETCH_STATUS=0)      
 BEGIN      
          
  SET  @TVersion = CASE WHEN @Task_Version IS NOT  NULL  THEN    
        @Task_Version +'.'+CAST(@intSNo  AS VARCHAR)    
       ELSE    
        CAST(@intSNo AS VARCHAR)    
       END    
         
  UPDATE Project_Task_Master     
  SET Task_Order = @IntStart,    
   Task_Version = @TVersion    
  WHERE Task_Id = @Task_Name    
      
  IF @Is_Parent =1     
  BEGIN    
 SET @Task_Order_No= @IntStart +1    
 EXEC SP_Task_Order @Project_Id,@Process_Id,@Task_Name,@Task_Order_No OUTPUT,@TVersion OUTPUT    
 SET @IntStart = @Task_Order_No    
  END    
  ELSE    
  BEGIN    
 SET @IntStart = @IntStart+1    
  END    
  SET @intSNo = @intSNo +1    
  FETCH NEXT FROM Task_Order_Cursor INTO  @Task_Name ,@Task_ParentId,@Is_Parent    
 END    
 CLOSE Task_Order_Cursor;      
 DEALLOCATE Task_Order_Cursor;     
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Process_Entry]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Task_Process_Entry]
@Progress_Id  int,
@Task_Date  date,
@Project_Name  int,
@Task_Name  int,
@Sub_Task_Name  int,
@Component_Name  int,
@Start_Time  datetime,
@End_Time  datetime,
@Staff_Name  int,
@Task_Status  int,
@Remarks  varchar(1000),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Task_Process_Entry] WHERE [Progress_Id]=@Progress_Id )
BEGIN
INSERT INTO  [Task_Process_Entry]
(
[Task_Date],
[Project_Name],
[Task_Name],
[Sub_Task_Name],
[Component_Name],
[Start_Time],
[End_Time],
[Staff_Name],
[Task_Status],
[Remarks],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Task_Date,
@Project_Name,
@Task_Name,
@Sub_Task_Name,
@Component_Name,
@Start_Time,
@End_Time,
@Staff_Name,
@Task_Status,
@Remarks,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Task_Process_Entry] SET
[Task_Date] = @Task_Date,
[Project_Name] = @Project_Name,
[Task_Name] = @Task_Name,
[Sub_Task_Name] = @Sub_Task_Name,
[Component_Name] = @Component_Name,
[Start_Time] = @Start_Time,
[End_Time] = @End_Time,
[Staff_Name] = @Staff_Name,
[Task_Status] = @Task_Status,
[Remarks] = @Remarks,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Progress_Id]=@Progress_Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Process_Information]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Task_Process_Information]            
 @TaskId INT ,            
 @Start_Date DATETIME = NULL,            
 @End_Date DATETIME = NULL          
 As            
BEGIN             
 
 DECLARE @Process_Id INT,
		 @Project_Id INT,
		 @Process_TaskId INT
		 
 SELECT @Process_Id = Process_Id, @Project_Id=Project_Name,
 @Process_TaskId = Sub_Task_Id
 FROM Project_Task_Master Where Task_Id = @TaskId
 IF @Process_TaskId IS NOT  NULL       
 BEGIN
	SELECT a.Process_Name, ISNULL(a.Difficulty,1) AS DiffiCulty, ISNULL(a.Points,1) AS Points,            
	CAST(CASE WHEN DATEDIFF(DD,@Start_Date,@End_Date )+1 <=ISNULL(a.No_Of_Days,1) THEN 1 ELSE 0 END AS BIT) AS Task_Check  ,        
	ISNULL(a.No_Of_Days,1) As No_Of_Days   ,      
	ISNULL(a.No_Of_Staffs,1) As No_Of_Staffs           
	FROM Sub_Task_Master a   WHERE Process_Task_Id=@Process_TaskId   
	         
 END	
 ELSE
 BEGIN
	   
	SELECT a.Process_Id,a.Process_Name, ISNULL(b.Difficulty ,ISNULL(a.Difficulty,1)) AS DiffiCulty, ISNULL(b.Points,ISNULL(a.Points,1)) AS Points,            
	CAST(CASE WHEN DATEDIFF(DD,@Start_Date,@End_Date )+1 <= ISNULL(b.No_Of_Days ,ISNULL(a.No_Of_Days,1)) THEN 1 ELSE 0 END AS BIT) AS Task_Check  ,        
	ISNULL(b.No_Of_Days ,ISNULL(a.No_Of_Days,1)) As No_Of_Days   ,      
	ISNULL(b.No_Of_Staffs,ISNULL(a.No_Of_Staffs,1)) As No_Of_Staffs,  
	ISNULL(b.Email_Configuration,a.Email_Configuration) As Email_Configuration            
	FROM Process_Master a            
	LEFT OUTER JOIN Project_Process_Master b ON a.Process_Id= b.Process_Name AND Project_Name=@Project_Id            
	WHERE a.Company_Unit_Name IN (SELECT Entered_Unit FROM Project_Master WHERE ProjectId=@Project_Id )            
	AND a.Process_Id= CASE WHEN @Process_Id IS NULL THEN a.Process_Id ELSE @Process_Id END     
 
 END	
       
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Task_Status_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Task_Status_Master]
@Status_Id  int,
@Status_Value  varchar(50),
@Color_Code  varchar(10)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Task_Status_Master] WHERE [Status_Id]=@Status_Id )
BEGIN
INSERT INTO  [Task_Status_Master]
(
[Status_Value],
[Color_Code]
)
VALUES
(
@Status_Value,
@Color_Code
)
END
ELSE
BEGIN
UPDATE [Task_Status_Master] SET
[Status_Value] = @Status_Value,
[Color_Code] = @Color_Code
WHERE [Status_Id]=@Status_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Tbl_StockMaster]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_Tbl_StockMaster]      

@StockID int,      

@StockName varchar(50),      

@EnteredBy varchar(50),  

@CategoryId int,

@Is_Liquid BIT,

@Entered_Unit INT  ,

@StockPrice FLOAT ,
@Unit VARCHAR(50)

As      

BEGIN      

 IF NOT EXISTS ( SELECT * FROM Tbl_StockMaster WHERE StockID=@StockID)      

 BEGIN      

 IF(NOT EXISTS ( SELECT * FROM Tbl_StockMaster WHERE  StockName=@StockName))  

  BEGIN  

   INSERT INTO Tbl_StockMaster      

   (      

    StockName,      

    EnteredBy,      

    EnteredDate,  

    cat_id,

    Is_Liquid,

    [Entered_Unit],

	Price  ,
	Unit   

   )      

   VALUES      

   (      

    @StockName,      

    @EnteredBy,      

    GetDate() ,  

    @CategoryId,

    @Is_Liquid ,

    @Entered_Unit ,

	@StockPrice  ,
	@Unit  

   )     

   SET @StockID = @@Identity   

 END     

 END      

 ELSE      

 BEGIN      

  UPDATE Tbl_StockMaster SET      

  StockName=@StockName,      

  EnteredBy=@EnteredBy,      

  EnteredDate=GetDate(),  

  cat_id=@CategoryId,

  Is_Liquid=@Is_Liquid,

  [Entered_Unit] = @Entered_Unit    ,

  Price=@StockPrice  ,
  Unit=@Unit 

  WHERE StockID=@StockID      

 END      

 Select @StockID as ID  

END





GO
/****** Object:  StoredProcedure [dbo].[SP_Tbl_Suppliers]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Tbl_Suppliers]    
 @SupplierId  INT,    
 @SupplierName  VARCHAR(50),    
 @CompanyName  VARCHAR(100),    
 @ContactNo  VARCHAR(50),    
 @EmailId  VARCHAR(100),    
 @Address  VARCHAR(500),    
 @City  VARCHAR(100),    
 @PostalCode  VARCHAR(50),    
 @Country  VARCHAR(50),    
 @Fax  VARCHAR(50),    
 @EnteredBy VARCHAR(50) ,
 @Entered_Unit INT   
 --@EnteredDate DateTime    
AS    
BEGIN    
 IF NOT EXISTS( SELECT * FROM [Tbl_Suppliers] WHERE [SupplierId]=@SupplierId )    
 BEGIN    
  INSERT INTO  [Tbl_Suppliers]    
  (    
   [SupplierName],    
   [CompanyName],    
   [ContactNo],    
   [EmailId],    
   [Address],    
   [City],    
   [PostalCode],    
   [Country],    
   [Fax],    
   [EnteredBy],
   Entered_Unit,    
   [EnteredDate]    
  )    
  VALUES    
  (    
   @SupplierName,    
   @CompanyName,    
   @ContactNo,    
   @EmailId,    
   @Address,    
   @City,    
   @PostalCode,    
   @Country,    
   @Fax,    
   @EnteredBy,   
   @Entered_Unit, 
   Getdate()    
       
  )    
 END    
 ELSE    
 BEGIN    
  UPDATE [Tbl_Suppliers] SET    
       
   [SupplierName] = @SupplierName,    
   [CompanyName] = @CompanyName,    
   [ContactNo] = @ContactNo,    
   [EmailId] = @EmailId,    
   [Address] = @Address,    
   [City] = @City,    
   [PostalCode] = @PostalCode,    
   [Country] = @Country,    
   [Fax] = @Fax,    
   [EnteredBy]=@EnteredBy, 
   Entered_Unit =@Entered_Unit, 
   [EnteredDate]=Getdate()    
   WHERE [SupplierId]=@SupplierId    
 END    
END




GO
/****** Object:  StoredProcedure [dbo].[SP_Team_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Team_Master]
@Team_Id  int,
@Department_Name  int,
@Team_Name  varchar(50),
@Rolse_and_Response  varchar(1500),
@Entered_By  int,
@Entered_Date  datetime,
@Entered_Unit  int
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Team_Master] WHERE [Team_Id]=@Team_Id )
BEGIN
INSERT INTO  [Team_Master]
(
[Department_Name],
[Team_Name],
[Rolse_and_Response],
[Entered_By],
[Entered_Date],
[Entered_Unit]
)
VALUES
(
@Department_Name,
@Team_Name,
@Rolse_and_Response,
@Entered_By,
@Entered_Date,
@Entered_Unit
)
END
ELSE
BEGIN
UPDATE [Team_Master] SET
[Department_Name] = @Department_Name,
[Team_Name] = @Team_Name,
[Rolse_and_Response] = @Rolse_and_Response,
[Entered_By] = @Entered_By,
[Entered_Date] = @Entered_Date,
[Entered_Unit] = @Entered_Unit
WHERE [Team_Id]=@Team_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Time_Sheet_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Time_Sheet_Master]







@Time_Sheet_Id  int,







@Task_Date  date,







@Staff_Name  int,







@Purpose_Name  int,







@Start_Time  time,







@End_Time  time,







@Status  INT,







@Remarks  varchar(1000),







@Entered_By  int,







@Modified_By  int,







@Entered_Date  datetime,







@Modified_Date  datetime,







@Entered_Unit  int,







@Location varchar(100),

@End_Location varchar(100),







@Is_Mobile bit,







@Task_Id INT,







@Pending_Task INT,







@Emails varchar(1000)







AS







BEGIN















DECLARE @Status_Value VARCHAR(200),







@Current_Date DATETIME,







@SDateTime DATETIME,







@EDateTime DATETIME,







@Status_Id INT,







@ServerDate DATETIME,







@Pending_Task_Id INT,







@Task_identity INT,







@Task_Type VARCHAR(30)















SET @ServerDate = DATEADD(N,30,DATEADD(HH,5,GETUTCDATE()))







SET @Current_Date = CAST(CONVERT(VARCHAR(20),@ServerDate,101) AS DATETIME)







SET @SDateTime = CAST(@Start_Time As DATETIME) +  @Task_Date







SET @EDateTime = CAST(@End_Time As DATETIME) +  @Task_Date























IF @Pending_Task IS NOT NULL







BEGIN















SELECT @Purpose_Name = CASE WHEN Task_Type = 'P' Then Task_Identity End,







@Task_Id = CASE WHEN Task_Type = 'T' Then Task_Identity End







FROM Pending_Task_Mapping WHERE Pending_Task_Id = @Pending_Task















END























SET @Task_identity = CASE WHEN @Task_Id IS NULL THEN @Purpose_Name ELSE @Task_Id END







SET @Task_Type = CASE WHEN @Task_Id IS NULL THEN 'P' ELSE 'T' END















IF ( @Task_Date>= @ServerDate AND ( @Start_Time IS NULL OR @End_Time IS NULL ))







BEGIN







SET @Status_Value = 'Planned'







END







ELSE IF( @Task_Date > @Current_Date )







BEGIN







SET @Status_Value = 'Planned'







END







ELSE IF ( @Task_Date = @Current_Date AND @SDateTime>@ServerDate)







BEGIN







SET @Status_Value = 'Planned'







END







ELSE IF (@Task_Date = @Current_Date AND @SDateTime<=@ServerDate AND @EDateTime>@ServerDate)







BEGIN







SET @Status_Value = 'Running'







END







ELSE IF (@Task_Date = @Current_Date AND @SDateTime<=@ServerDate AND @EDateTime IS NULL)







BEGIN







SET @Status_Value = 'Running'







END







ELSE IF(@Task_Date = @Current_Date AND @SDateTime IS NOT NULL AND @EDateTime IS NOT NULL)







BEGIN







SET @Status_Value = 'Completed'







END







ELSE IF(@SDateTime IS NOT NULL AND @EDateTime IS NOT NULL)







BEGIN







SET @Status_Value = 'Completed'







END







ELSE IF(@SDateTime IS NULL AND @EDateTime IS NULL)







BEGIN







SET @Status_Value = 'Planned'







END















IF @Status_Value = 'Completed'







BEGIN















DELETE FROM Pending_Task_Mapping WHERE Task_identity= @Task_identity AND Task_Type= @Task_Type AND Staff_Name = @Staff_Name







SELECT @Status_Id = Status_Id FROM Time_Sheet_Status WHERE Status_Name = 'Completed'







If @Task_Type = 'P'







BEGIN















UPDATE Time_Sheet_Master SET Status = @Status_Id WHERE Purpose_Name = @Task_identity







AND Staff_Name = @Staff_Name







AND Status in(SELECT Status_Id FROM Time_Sheet_Status WHERE Status_Name = 'Pending' )







END







ELSE







BEGIN







UPDATE Time_Sheet_Master SET Status = @Status_Id WHERE Task_Id = @Task_identity







AND Staff_Name = @Staff_Name







AND Status in(SELECT Status_Id FROM Time_Sheet_Status WHERE Status_Name = 'Pending' )







END















END























If EXISTS( SELECT Status_Id FROM Time_Sheet_Status WHERE Status_Name = 'Pending'  AND Status_Id=@Status)







BEGIN







SELECT @Status_Id=Status_Id FROM Time_Sheet_Status WHERE Status_Name = 'Pending'







SET @Status = @Status_Id







EXEC SP_Pending_Task_Mapping @Pending_Task_Id OUTPUT,@Task_identity, @Task_Type,@Staff_Name







END







ELSE







BEGIN







SELECT @Status_Id = Status_Id FROM Time_Sheet_Status WHERE Status_Name = @Status_Value







SET @Status = @Status_Id







END































IF NOT EXISTS( SELECT * FROM [Time_Sheet_Master] WHERE [Time_Sheet_Id]=@Time_Sheet_Id )







BEGIN







INSERT INTO  [Time_Sheet_Master]







(







[Task_Date],







[Staff_Name],







[Purpose_Name],







[Start_Time],







[End_Time],







[Status],







[Remarks],







[Entered_By],







[Entered_Date],







[Entered_Unit],







[Location],

[End_Location],







[Is_Mobile],







[Task_Id],







[Emails]







)







VALUES







(







@Task_Date,







@Staff_Name,







@Purpose_Name,







@Start_Time,







@End_Time,







@Status,







@Remarks,







@Entered_By,







@Entered_Date,







@Entered_Unit,







@Location,

@End_Location,







@Is_Mobile,







@Task_Id,







@Emails







)







UPDATE [Time_Sheet_Master] SET Approve_Status = NULL WHERE [Task_Date]=@Task_Date AND Staff_Name = @Staff_Name







END







ELSE







BEGIN







UPDATE [Time_Sheet_Master] SET







[Task_Date] = @Task_Date,







[Staff_Name] = @Staff_Name,







[Purpose_Name] = @Purpose_Name,







[Start_Time] = @Start_Time,







[End_Time] = @End_Time,







[Status] = @Status,







[Remarks] = @Remarks,







[Modified_By] = @Modified_By,







[Modified_Date] = @Modified_Date,







[Entered_Unit] = @Entered_Unit,







[Location]= @Location,

[End_Location]= @End_Location,







[Is_Mobile]= @Is_Mobile,







[Task_Id] =@Task_Id,







[Emails] =@Emails







WHERE [Time_Sheet_Id]=@Time_Sheet_Id







END















/*IF @Task_Id IS NOT NULL THEN







DELETE FROM Time_Sheet_Master WHERE  Status in(select Status_Id FROM Time_Sheet_Status where Status_Name ='Planned')







AND Task_Id = @Task_Id*/







/*UPDATE [Time_Sheet_Master] SET Status=@Status_Id Where Task_Date< @ServerDate







AND [Staff_Name] = @Staff_Name







AND Status IN (select Status_Id from Time_Sheet_Status  where Status_Name = 'Planned')  */















END









GO
/****** Object:  StoredProcedure [dbo].[SP_Time_Sheet_Status]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Time_Sheet_Status]
@Status_Id  int,
@Color_Code  varchar(10),
@Status_Name  varchar(30)
AS
BEGIN
IF NOT EXISTS( SELECT * FROM [Time_Sheet_Status] WHERE [Status_Id]=@Status_Id )
BEGIN
INSERT INTO  [Time_Sheet_Status]
(
[Color_Code],
[Status_Name]
)
VALUES
(
@Color_Code,
@Status_Name
)
END
ELSE
BEGIN
UPDATE [Time_Sheet_Status] SET
[Color_Code] = @Color_Code,
[Status_Name] = @Status_Name
WHERE [Status_Id]=@Status_Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_User_Log_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_User_Log_Master]
@User_Log_Id  INT = NULL,
@SessionId  VARCHAR(50)= NULL,
@IP_Address  VARCHAR(50)= NULL,
@SignInTime  DATETIME= NULL,
@SignOutTime  DATETIME= NULL,
@AccessTime  DATETIME = NULL,
@User_Id  INT = NULL,
@Latitude varchar(50)= NULL,
@Longitude varchar(50) = NULL,
@Location varchar(500) = NULL

AS
BEGIN
IF NOT EXISTS( SELECT * FROM [User_Log_Master] WHERE [User_Log_Id]=@User_Log_Id )
BEGIN
INSERT INTO  [User_Log_Master]
(
[SessionId],
[IP_Address],
[SignInTime],
[SignOutTime],
[AccessTime],
[User_Id],
[Latitude],
[Longitude],
[Location]

)
VALUES
(
@SessionId,
@IP_Address,
@SignInTime,
@SignOutTime,
@AccessTime,
@User_Id,
@Latitude,
@Longitude,
@Location
)

SET @User_Log_Id = @@IDENTITY
END
ELSE
BEGIN
UPDATE [User_Log_Master] SET
[SessionId] = ISNULL(@SessionId,[SessionId]),
[IP_Address] = ISNULL(@IP_Address,[IP_Address]),
[SignInTime] = ISNULL(@SignInTime,[SignInTime]),
[SignOutTime] = ISNULL(@SignOutTime,[SignOutTime]),
[AccessTime] = ISNULL(@AccessTime,[AccessTime]),
[User_Id] = ISNULL(@User_Id,[User_Id]),
[Latitude]= ISNULL(@Latitude,[Latitude]),
[Longitude]= ISNULL(@Longitude,[Longitude]),
[Location]= ISNULL(@Location,[Location])
WHERE [User_Log_Id]=@User_Log_Id
END
SELECT @User_Log_Id AS User_Log_Id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Work_Project_Master]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Work_Project_Master]
	@Project_Name  int,
	@Work_Start_Date  datetime,
	@Work_End_Date  datetime
AS
BEGIN
	
		UPDATE [Project_Master] SET
			[Expected_Start_Date] = @Work_Start_Date,
			[Expected_End_Date] = @Work_End_Date
		 WHERE [ProjectId]=@Project_Name 
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Workers_Based_Points]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Workers_Based_Points]  
    @Staff_Id INT =NULL,  
    @Project_Id INT =NULL,  
    @Company_Unit_Id INT =NULL,  
    @Process_Id INT =NULL,  
    @DateFrom DATETIME =NULL,  
    @DateTo DATETIME =NULL,  
    @Engineers_Id INT =NULL,  
    @Designation_Id INT =NULL  
AS  
BEGIN        
     
   SELECT staff.Staff_Name,staff.Staff_Id,TempPoints.Points,TempPoints.Task_Count,  
   TempPoints.Process_Name,TempPoints.Process_Id,Point_Index FROM VW_ACtive_STAFF_Master As staff  
   LEFT OUTER JOIN(  
   SELECT DISTINCT c.Staff_Name,c.Staff_Id, d.Process_Id,  
   d.Process_Name,  
   Case  WHEN ( DateDiff(dd,tw.Start_Date,tw.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (tw.Completed_Date BETWEEN tw.Start_Date AND tw.End_Date)THEN 'A'  ELSE 'B' END As Point_Index,   
   Sum(DISTINCT  ISNULL(ISNULL(g.difficulty,e.difficulty),d.difficulty)) * Sum(DISTINCT ISNULL(ISNULL(g.Points,e.Points),d.Points)) * Sum(DISTINCT ISNULL(f.Incentive_Points,1))  As Points,  
   Count( DISTINCT b.Task_Name) AS Task_Count FROM   
   Staff_Master c  
   INNER JOIN Task_Master tw  ON tw.Entered_By= c.Staff_Id 
   INNER JOIN Project_Task_Master a  ON a.Entered_By= c.Staff_Id
   INNER JOIN Project_Resource_Master b ON  a.Task_Id = b.Task_Name    
   INNER JOIN Process_Master d ON d.Process_Id = a.Process_Id   
   INNER JOIN Designation_Master f ON f.Designation_Id = c.Designation_Name   
   INNER JOIN VW_Resource_Count r ON a.Task_Id=b.Task_Name    
   LEFT OUTER JOIN Sub_Task_Master g ON g.Process_Task_Id=a.Sub_Task_Id   
   LEFT OUTER JOIN Project_Process_Master e ON e.Process_Name=d.Process_Id AND e.Project_Name = a.Project_Name  
   WHERE   
   (@DateFrom between tw.Start_Date and tw.End_Date  
    OR  
    @DateTo between tw.Start_Date and tw.End_Date)  
   AND  
   ( DateDiff(dd,tw.Start_Date,tw.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (tw.Completed_Date BETWEEN tw.Start_Date AND tw.End_Date)  
   AND a.Project_Name=CASE WHEN @Project_Id IS NOT NULL THEN @Project_Id ELSE a.Project_Name END  
   AND a.Process_Id=CASE WHEN @Process_Id IS NOT NULL THEN @Process_Id ELSE a.Process_Id END  
   AND a.Entered_By=CASE WHEN @Engineers_Id IS NOT NULL THEN @Engineers_Id ELSE a.Entered_By END  
   GROUP BY c.Staff_Name, d.Process_Id, d.Process_Name,c.Staff_Id,  
   Case  WHEN ( DateDiff(dd,tw.Start_Date,tw.End_Date) <= ISNULL(ISNULL(g.No_Of_Days,e.No_Of_Days),d.No_Of_Days) )   
   AND (r.Resource_Count<= ISNULL(ISNULL(g.No_Of_Staffs,e.No_Of_Staffs),d.No_Of_Staffs) )  
   AND (tw.Completed_Date BETWEEN tw.Start_Date AND tw.End_Date)THEN 'A'  ELSE 'B' END ) as TempPoints  
   ON TempPoints.Staff_Id = staff.Staff_Id        
   WHERE staff.Staff_Id=CASE WHEN @Staff_Id IS NOT NULL THEN @Staff_Id ELSE staff.Staff_Id  END      
   AND staff.Company_Unit_Name= @Company_Unit_Id
    AND staff.Staff_Id IN ( SELECT Entered_By  FROM Task_Master)   
   AND staff.Designation_Name=CASE WHEN @Designation_Id IS NOT NULL THEN @Designation_Id ELSE staff.Designation_Name  END  
   ORDER BY staff.Staff_Name ASC  
     
END  

GO
/****** Object:  StoredProcedure [dbo].[Task_Process_Report]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Task_Process_Report]    
 @Date DATETIME,    
 @ProjectId INT,
 @Company_Unit_Id INT  
AS    
BEGIN   
 SELECT   
 [Task_Process_Entry].Progress_Id,
 [Task_Master].Task_Id,  
 [Project_Master].ProjectId,  
 [Project_Master].Project_Name,  
 [Sub_Task_Entry].Sub_Task_Id,  
 [Component_Entry].Component_Id ,  
 [Task_Process_Entry].Progress_Id,  
 ISNULL([Task_Master].Task_Name,'') AS Task_Name ,     
 ISNULL([Sub_Task_Entry].Sub_Task_Name,'') AS Sub_Task_Name,    
 ISNULL([Component_Entry].Component_Name,'') AS Component_Name,  
 Task_Process_Entry.Start_Time AS Start_Time,  
 Task_Process_Entry.End_Time AS End_Time    
 FROM [Project_Master]  
 LEFT OUTER JOIN[Task_Master] ON [Project_Master].ProjectId = [Task_Master].Project_Name  
 LEFT OUTER JOIN  [Sub_Task_Entry] ON [Sub_Task_Entry].Task_Name = [Task_Master].Task_Id    
 LEFT OUTER JOIN [Task_Process_Entry] ON [Task_Process_Entry].Task_Name = [Task_Master].Task_Id    
 AND [Task_Process_Entry].Task_Date = @Date   
 LEFT OUTER JOIN [Component_Entry] ON Component_Entry.Component_Id = [Task_Process_Entry].Component_Name    
 WHERE CAST(CONVERT(VARCHAR(20),@Date,101) AS DATETIME)BETWEEN Task_Master.[Start_Date] AND Task_Master.[End_Date]    
 AND CASE WHEN @ProjectId IS NULL THEN [Project_Master].ProjectId ELSE @ProjectId END = [Project_Master].ProjectId
 AND CASE WHEN @Company_Unit_Id IS NULL THEN [Project_Master].Entered_Unit ELSE @Company_Unit_Id END = [Project_Master].Entered_Unit    
 AND [Task_Master].Task_Name IS NOT NULL  
 AND Project_Master.Is_Active =1
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRemark]    Script Date: 3/5/2019 8:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateRemark]
			   @Remarks nvarchar(max),		 
			   @TimeSheetID int

			
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

				Declare  @PurposeId int
    -- Insert statements for procedure here
 
              update Time_Sheet_Master set  Remarks =@Remarks where Time_Sheet_Id = @TimeSheetID

			 
			 
			  end


			  

		



 
GO
USE [master]
GO
ALTER DATABASE [IndiaProjects] SET  READ_WRITE 
GO
