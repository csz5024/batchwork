USE [master]
GO
/****** Object:  Database [ADVaT_2.0]    Script Date: 7/8/2019 1:08:13 PM ******/
CREATE DATABASE [ADVaT_2.0]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ADVaT_2.0', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ADVaT_2.0.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ADVaT_2.0_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ADVaT_2.0_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ADVaT_2.0] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ADVaT_2.0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
CREATE LOGIN ADVaTUser WITH PASSWORD=N'ADVaTUser!@#456', CHECK_POLICY=OFF, DEFAULT_DATABASE=MASTER, DEFAULT_LANGUAGE=US_ENGLISH
GO
ALTER LOGIN ADVaTUser ENABLE
GO
USE [ADVaT_2.0]
GO
CREATE USER ADVaTUser FOR LOGIN ADVaTUser WITH DEFAULT_SCHEMA=[DBO]
GO
ALTER DATABASE [ADVaT_2.0] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET ARITHABORT OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ADVaT_2.0] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ADVaT_2.0] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ADVaT_2.0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ADVaT_2.0] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ADVaT_2.0] SET  MULTI_USER 
GO
ALTER DATABASE [ADVaT_2.0] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ADVaT_2.0] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ADVaT_2.0] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ADVaT_2.0] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ADVaT_2.0] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ADVaT_2.0]
GO
/****** Object:  Table [dbo].[ARINC_ARPT]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_ARPT](
	[ImportHistoryID] [int] NOT NULL,
	[AirportId] [char](4) NOT NULL,
	[ICAOCode] [char](2) NOT NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ATADesignator] [char](3) NULL,
	[ContinuationRecordNumber] [char](1) NULL,
	[SpeedLimitAlt] [char](5) NULL,
	[LongestRwy] [int] NULL,
	[IFRCapability] [char](1) NULL,
	[LongestRwySurface] [char](1) NULL,
	[Latitude] [char](9) NULL,
	[Longitude] [char](10) NULL,
	[MagneticVariation] [char](5) NULL,
	[Elevation] [char](5) NULL,
	[SpeedLimit] [int] NULL,
	[RecNavaid] [char](4) NULL,
	[TransitionAlt] [int] NULL,
	[TransitionLevel] [int] NULL,
	[PublicIndicator] [char](1) NULL,
	[TimeZone] [char](3) NULL,
	[DaylightIndicator] [char](1) NULL,
	[MagneticIndicator] [char](1) NULL,
	[DatumCode] [char](3) NULL,
	[AirportName] [char](30) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
	[RawString] [char](150) NOT NULL,
 CONSTRAINT [PK_ARINC_ARPT] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[AirportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARINC_NDB_NAVAID]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_NDB_NAVAID](
	[ImportHistoryID] [int] NOT NULL,
	[AirportId] [char](4) NOT NULL,
	[SectionType] [char](2) NOT NULL,
	[ICAOCode] [char](2) NOT NULL,
	[NDBIdent] [char](4) NOT NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ContinuationRecordNumber] [char](1) NULL,
	[NDBFrequency] [int] NULL,
	[NDBClass] [char](5) NULL,
	[NDBLatitude] [char](9) NULL,
	[NDBLongitude] [char](10) NULL,
	[MagneticVariation] [char](5) NULL,
	[DatumCode] [char](3) NULL,
	[NDBName] [char](30) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
	[RawString] [char](150) NOT NULL,
 CONSTRAINT [PK_ARINC_NDB_NAVAID] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[AirportId] ASC,
	[SectionType] ASC,
	[ICAOCode] ASC,
	[NDBIdent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARINC_RWY]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_RWY](
	[ImportHistoryID] [int] NOT NULL,
	[AirportId] [char](4) NOT NULL,
	[RunwayId] [char](5) NOT NULL,
	[ICAOCode] [char](2) NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ContinuationRecordNumber] [char](1) NULL,
	[RunwayLength] [int] NULL,
	[RunwayBearing] [int] NULL,
	[Latitude] [char](9) NULL,
	[Longitude] [char](10) NULL,
	[RunwayGradient] [char](5) NULL,
	[EllipsoidHeight] [char](6) NULL,
	[LandingThresholdElevation] [char](5) NULL,
	[DisplacedThresholdDistance] [int] NULL,
	[ThresholdCrossingHeight] [int] NULL,
	[RunwayWidth] [int] NULL,
	[TCHValueIndicator] [char](1) NULL,
	[LocalizerMLS_GLSIdentifier] [char](4) NULL,
	[LocalizerMLS_GLSCategory] [char](1) NULL,
	[Stopway] [int] NULL,
	[SecondLocalizerMLS_GLSIdentifier] [char](4) NULL,
	[SecondLocalizer] [char](1) NULL,
	[RunwayDescription] [char](22) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
	[RawString] [char](150) NOT NULL,
 CONSTRAINT [PK_ARINC_RWY] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[AirportId] ASC,
	[RunwayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARINC_TRM_SEG]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_TRM_SEG](
	[ImportHistoryID] [int] NOT NULL,
	[AirportId] [char](4) NOT NULL,
	[ProcedureType] [char](2) NOT NULL,
	[SID_STAR_ApprId] [char](6) NOT NULL,
	[SequenceNum] [int] NOT NULL,
	[RouteType] [char](1) NOT NULL,
	[TransitionId] [char](5) NOT NULL,
	[ICAOCode] [char](2) NOT NULL,
	[PathTermination] [char](2) NULL,
	[FixId] [char](5) NULL,
	[FixType] [char](2) NULL,
	[FixICAO] [char](2) NULL,
	[WaypointDescription] [char](4) NULL,
	[Latitude] [char](9) NULL,
	[Longitude] [char](10) NULL,
	[MagVar_StationDeclination] [char](5) NULL,
	[MagneticIndicator] [char](1) NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ContRecordNumber] [char](1) NULL,
	[TurnDirection] [char](1) NULL,
	[RNP] [int] NULL,
	[TurnDirectionValid] [char](1) NULL,
	[RecNavaid] [char](4) NULL,
	[ARCRadius] [int] NULL,
	[Theta] [int] NULL,
	[Rho] [int] NULL,
	[MagneticCourse] [char](4) NULL,
	[RouteDistance] [char](4) NULL,
	[RECDNAVSection] [char](1) NULL,
	[RECDNAVSubsection] [char](1) NULL,
	[AltitudeDesc] [char](1) NULL,
	[ATCIndicator] [char](1) NULL,
	[AltitudeOne] [char](5) NULL,
	[AltitudeTwo] [char](5) NULL,
	[TransitionAltitude] [int] NULL,
	[SpeedLimit] [int] NULL,
	[VerticalAngle] [char](4) NULL,
	[TAAProcedureTurn] [char](5) NULL,
	[TAASectorId] [char](1) NULL,
	[GNSS_FMSIndication] [char](1) NULL,
	[SpeedLimitDescription] [char](1) NULL,
	[ApchRouteQualifier1] [char](1) NULL,
	[ApchRouteQualifier2] [char](1) NULL,
	[Copter] [char](1) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
	[RawString] [char](150) NOT NULL,
 CONSTRAINT [PK_ARINC_TRM_SEG] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[AirportId] ASC,
	[ProcedureType] ASC,
	[SID_STAR_ApprId] ASC,
	[SequenceNum] ASC,
	[RouteType] ASC,
	[TransitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARINC_VHF_NAVAID]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_VHF_NAVAID](
	[ImportHistoryID] [int] NOT NULL,
	[ICAOCode] [char](2) NOT NULL,
	[VORIdent] [char](4) NOT NULL,
	[AirportId] [char](4) NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ContinuationRecordNumber] [char](1) NULL,
	[VORFrequency] [int] NULL,
	[NAVAIDClass] [char](5) NULL,
	[VORLatitude] [char](9) NULL,
	[VORLongitude] [char](10) NULL,
	[DMEIdent] [char](4) NULL,
	[DMELatitude] [char](9) NULL,
	[DMELongitude] [char](10) NULL,
	[StationDeclination] [char](5) NULL,
	[DMEElevation] [char](5) NULL,
	[FigureOfMerit] [int] NULL,
	[ILS_DMEBias] [int] NULL,
	[FrequencyProtection] [char](3) NULL,
	[DatumCode] [char](3) NULL,
	[VORName] [char](30) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
	[RawString] [char](150) NOT NULL,
 CONSTRAINT [PK_ARINC_VHF_NAVAID] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[ICAOCode] ASC,
	[VORIdent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARINC_WPT]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARINC_WPT](
	[ImportHistoryID] [int] NOT NULL,
	[RegionCode] [char](4) NOT NULL,
	[SectionType] [char](2) NOT NULL,
	[ICAOCode] [char](2) NOT NULL,
	[WaypointId] [char](5) NOT NULL,
	[AreaCode] [char](3) NULL,
	[SectionCode] [char](1) NOT NULL,
	[SubsectionCode] [char](1) NOT NULL,
	[ContinuationRecordNumber] [char](1) NULL,
	[WaypointType] [char](3) NULL,
	[WaypointUsage] [char](2) NULL,
	[WaypointLatitude] [char](9) NULL,
	[WaypointLongitude] [char](10) NULL,
	[MagneticVariation] [char](5) NULL,
	[DatumCode] [char](3) NULL,
	[NameFormatIndicator] [char](3) NULL,
	[WaypointName] [char](25) NULL,
	[FileRecordNumber] [int] NULL,
	[CycleDate] [int] NULL,
 CONSTRAINT [PK_ARINC_WPT] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[RegionCode] ASC,
	[SectionType] ASC,
	[ICAOCode] ASC,
	[WaypointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAFIF_ARPT]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAFIF_ARPT](
	[ImportHistoryID] [int] NOT NULL,
	[ARPT_IDENT] [char](7) NOT NULL,
	[ARPT_NAME] [char](38) NULL,
	[STATE_PROV] [int] NULL,
	[ICAO] [char](4) NULL,
	[FAA_HOST_ID] [char](4) NULL,
	[LOC_HDATUM] [char](3) NULL,
	[WGS_DATUM] [char](3) NULL,
	[WGS_LAT] [char](9) NULL,
	[WGS_DLAT] [float] NULL,
	[WGS_LONG] [char](10) NULL,
	[WGS_DLONG] [float] NULL,
	[ELEV] [int] NULL,
	[ARPT_TYPE] [char](1) NULL,
	[MAG_VAR] [char](12) NULL,
	[WAC] [char](4) NULL,
	[BEACON] [char](1) NULL,
	[SECOND_ARPT] [char](1) NULL,
	[OPR_AGY] [char](2) NULL,
	[SEC_NAME] [char](38) NULL,
	[SEC_ICAO] [char](4) NULL,
	[SEC_FAA] [char](4) NULL,
	[SEC_OPR_AGY] [char](2) NULL,
	[CYCLE_DATE] [int] NULL,
	[TERRAIN] [char](1) NULL,
	[HYDRO] [char](1) NULL,
	[COORD_PRCN] [int] NULL,
	[MV_RECORD] [char](8) NULL,
	[RawString] [char](150) NULL,
 CONSTRAINT [PK_DAFIF_ARPT] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[ARPT_IDENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAFIF_RWY]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAFIF_RWY](
	[ImportHistoryID] [int] NOT NULL,
	[ARPT_IDENT] [char](7) NOT NULL,
	[HIGH_IDENT] [char](3) NOT NULL,
	[LOW_IDENT] [char](3) NOT NULL,
	[ICAO] [char](4) NULL,
	[FAA_HOST_ID] [char](4) NULL,
	[SEC_ICAO] [char](4) NULL,
	[HIGH_HDG] [float] NULL,
	[LOW_HDG] [float] NULL,
	[RWY_LENGTH] [int] NULL,
	[RWY_WIDTH] [int] NULL,
	[SURFACE] [char](3) NULL,
	[PCN] [char](7) NULL,
	[HE_WGS_LAT] [char](9) NULL,
	[HE_WGS_DLAT] [float] NULL,
	[HE_WGS_LONG] [char](10) NULL,
	[HE_WGS_DLONG] [float] NULL,
	[HE_ELEV] [char](7) NULL,
	[HE_SLOPE] [char](4) NULL,
	[HE_TDZE] [char](7) NULL,
	[HE_DT] [int] NULL,
	[HE_DT_ELEV] [char](7) NULL,
	[HLGT_SYS_1] [int] NULL,
	[HLGT_SYS_2] [int] NULL,
	[HLGT_SYS_3] [int] NULL,
	[HLGT_SYS_4] [int] NULL,
	[HLGT_SYS_5] [int] NULL,
	[HLGT_SYS_6] [int] NULL,
	[HLGT_SYS_7] [int] NULL,
	[HLGT_SYS_8] [int] NULL,
	[LE_WGS_LAT] [char](9) NULL,
	[LE_WGS_DLAT] [float] NULL,
	[LE_WGS_LONG] [char](10) NULL,
	[LE_WGS_DLONG] [float] NULL,
	[LE_ELEV] [char](7) NULL,
	[LE_SLOPE] [char](4) NULL,
	[LE_TDZE] [char](7) NULL,
	[LE_DT] [int] NULL,
	[LE_DT_ELEV] [char](7) NULL,
	[LLGT_SYS_1] [int] NULL,
	[LLGT_SYS_2] [int] NULL,
	[LLGT_SYS_3] [int] NULL,
	[LLGT_SYS_4] [int] NULL,
	[LLGT_SYS_5] [int] NULL,
	[LLGT_SYS_6] [int] NULL,
	[LLGT_SYS_7] [int] NULL,
	[HE_TRUE_HDG] [float] NULL,
	[LE_TRUE_HDG] [float] NULL,
	[CLD_RWY] [char](1) NULL,
	[HELAND_DIS] [int] NULL,
	[HE_TORA] [int] NULL,
	[HE_ASDA] [int] NULL,
	[LE_TORA] [int] NULL,
	[LE_ASDA] [int] NULL,
	[CYCLE_DATE] [int] NULL,
	[COORD_PRCN] [int] NULL,
	[RawString] [int] NULL,
 CONSTRAINT [PK_DAFIF_RWY] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[ARPT_IDENT] ASC,
	[HIGH_IDENT] ASC,
	[LOW_IDENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAFIF_TRM_PAR]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAFIF_TRM_PAR](
	[ImportHistoryID] [int] NOT NULL,
	[ARPT_IDENT] [char](7) NOT NULL,
	[TRM_PROC] [int] NOT NULL,
	[TRM_IDENT] [char](28) NOT NULL,
	[ICAO] [char](4) NOT NULL,
	[ES_ALT] [int] NULL,
	[JULIAN_DATE] [int] NULL,
	[AMDT_NO] [char](3) NULL,
	[OPR] [char](4) NULL,
	[HOST_CTRY_AUTH] [char](10) NULL,
	[CYCLE_DATE] [int] NULL,
	[ALT_MIN] [char](4) NULL,
	[TRAN_ALT] [int] NULL,
	[TRAN_LVL] [int] NULL,
	[PROC_CRITERIA] [char](15) NULL,
	[PROC_DATE] [char](7) NULL,
	[APCH_RTE_QUAL1] [char](1) NULL,
	[APCH_RTE_QUAL2] [char](1) NULL,
	[LOS1] [char](1) NULL,
	[LOS_NAME1] [char](10) NULL,
	[LOS2] [char](1) NULL,
	[LOS_NAME2] [char](10) NULL,
	[LOS3] [char](1) NULL,
	[LOS_NAME3] [char](10) NULL,
	[PROC_DSGN_MVAR] [char](7) NULL,
	[RawString] [char](150) NULL,
 CONSTRAINT [PK_DAFIF_TRM_PAR] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[ARPT_IDENT] ASC,
	[TRM_PROC] ASC,
	[TRM_IDENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAFIF_TRM_SEG]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAFIF_TRM_SEG](
	[ImportHistoryID] [int] NOT NULL,
	[ARPT_IDENT] [char](7) NOT NULL,
	[TRM_PROC] [int] NOT NULL,
	[TRM_IDENT] [char](28) NOT NULL,
	[SEQ_NBR] [int] NOT NULL,
	[TRM_TYPE] [char](1) NOT NULL,
	[TRANSITION] [char](5) NOT NULL,
	[ICAO] [char](4) NOT NULL,
	[FAA_HOST_ID] [char](4) NULL,
	[SEC_ICAO] [char](4) NULL,
	[TRACK_CD] [char](2) NULL,
	[WPT_ID] [char](5) NULL,
	[WPT_CTRY] [char](2) NULL,
	[WPT_DESC_1] [char](1) NULL,
	[WPT_DESC_2] [char](1) NULL,
	[WPT_DESC_3] [char](1) NULL,
	[WPT_DESC_4] [char](1) NULL,
	[TURN_DIR] [char](1) NULL,
	[NAV1_IDENT] [char](4) NULL,
	[NAV1_TYPE] [char](4) NULL,
	[NAV1_CTRY] [char](2) NULL,
	[NAV1_KEY_CD] [int] NULL,
	[NAV1_BEAR] [float] NULL,
	[NAV1_DIST] [float] NULL,
	[NAV2_IDENT] [char](4) NULL,
	[NAV2_TYPE] [char](4) NULL,
	[NAV2_DIST] [float] NULL,
	[MAG_CRS] [char](5) NULL,
	[DISTANCE] [float] NULL,
	[ALT_DESC] [char](1) NULL,
	[ALT_ONE] [char](5) NULL,
	[AL_TWO] [char](5) NULL,
	[RNP] [int] NULL,
	[CYCLE_DATE] [int] NULL,
	[WPT_WGS_LAT] [char](9) NULL,
	[WPT_WGS_DLAT] [float] NULL,
	[WPT_WGS_LONG] [char](10) NULL,
	[WPT_WGS_DLONG] [float] NULL,
	[WPT_MVAR] [float] NULL,
	[NAV1_WGS_LAT] [char](9) NULL,
	[NAV1_WGS_DLAT] [float] NULL,
	[NAV1_WGS_LONG] [char](10) NULL,
	[NAV1_WGS_DLONG] [float] NULL,
	[NAV2_MVAR] [float] NULL,
	[NAV2_DME_WGS_LAT] [char](9) NULL,
	[NAV2_DME_WGS_DLAT] [float] NULL,
	[NAV2_DME_WGS_LONG] [char](10) NULL,
	[NAV2_DME_WGS_DLONG] [float] NULL,
	[NAV2_WGS_LAT] [char](9) NULL,
	[NAV2_WGS_DLAT] [float] NULL,
	[NAV2_WGS_LONG] [char](10) NULL,
	[NAV2_WGS_DLONG] [float] NULL,
	[SPEED] [int] NULL,
	[SPEED_AC] [char](1) NULL,
	[SPEED_ALT] [char](5) NULL,
	[SPEED_2] [int] NULL,
	[SPEED_AC_2] [char](1) NULL,
	[SPEED_ALT_2] [char](5) NULL,
	[VNAV] [float] NULL,
	[TCH] [int] NULL,
	[ARC_WPT_ID] [char](5) NULL,
	[ARC_WPT_CTRY] [char](2) NULL,
	[ARC_RADIUS] [float] NULL,
	[RawString] [char](150) NULL,
 CONSTRAINT [PK_DAFIF_TRM_SEG] PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC,
	[ARPT_IDENT] ASC,
	[TRM_PROC] ASC,
	[TRM_IDENT] ASC,
	[SEQ_NBR] ASC,
	[TRM_TYPE] ASC,
	[TRANSITION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_History]    Script Date: 7/8/2019 1:08:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_History](
	[ImportHistoryID] [int] NOT NULL,
	[Databasetype] [char](10) NOT NULL,
	[Cycle] [char](4) NOT NULL,
	[VersionId] [char](2) NULL,
	[ImportDate] [datetime] NOT NULL,
	[UserID] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImportHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARINC_ARPT]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[ARINC_NDB_NAVAID]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[ARINC_RWY]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[ARINC_TRM_SEG]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[ARINC_VHF_NAVAID]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[ARINC_WPT]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[DAFIF_ARPT]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[DAFIF_RWY]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[DAFIF_TRM_PAR]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
ALTER TABLE [dbo].[DAFIF_TRM_SEG]  WITH CHECK ADD FOREIGN KEY([ImportHistoryID])
REFERENCES [dbo].[Import_History] ([ImportHistoryID])
GO
USE [master]
GO
ALTER DATABASE [ADVaT_2.0] SET  READ_WRITE 
GO
