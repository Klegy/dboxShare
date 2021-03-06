USE [master]
GO
/****** Object:  Database [dboxshare] ******/
CREATE DATABASE [dboxshare] ON  PRIMARY 
( NAME = N'dboxshare', FILENAME = N'D:\dboxshare.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dboxshare_log', FILENAME = N'D:\dboxshare_log.ldf' , SIZE = 16576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dboxshare] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dboxshare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dboxshare] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dboxshare] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dboxshare] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dboxshare] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dboxshare] SET ARITHABORT OFF
GO
ALTER DATABASE [dboxshare] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dboxshare] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dboxshare] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dboxshare] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dboxshare] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dboxshare] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dboxshare] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dboxshare] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dboxshare] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dboxshare] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dboxshare] SET  DISABLE_BROKER
GO
ALTER DATABASE [dboxshare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dboxshare] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dboxshare] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dboxshare] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dboxshare] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dboxshare] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dboxshare] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dboxshare] SET  READ_WRITE
GO
ALTER DATABASE [dboxshare] SET RECOVERY FULL
GO
ALTER DATABASE [dboxshare] SET  MULTI_USER
GO
ALTER DATABASE [dboxshare] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dboxshare] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'dboxshare', N'ON'
GO
USE [dboxshare]
GO
/****** Object:  Table [dbo].[dbs_user] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_user](
    [dbs_id] [smallint] IDENTITY(1,1) NOT NULL,
    [dbs_departmentid] [varchar](50) NOT NULL,
    [dbs_roleid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_password] [varchar](32) COLLATE Chinese_PRC_CS_AS NOT NULL,
    [dbs_code] [varchar](16) NOT NULL,
    [dbs_position] [nvarchar](32) NOT NULL,
    [dbs_email] [varchar](50) NOT NULL,
    [dbs_phone] [varchar](20) NOT NULL,
    [dbs_tel] [varchar](32) NOT NULL,
    [dbs_admin] [tinyint] NOT NULL,
    [dbs_status] [tinyint] NOT NULL,
    [dbs_recycle] [tinyint] NOT NULL,
    [dbs_time] [datetime] NOT NULL,
    [dbs_loginip] [varchar](16) NOT NULL,
    [dbs_logintime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbs_user] PRIMARY KEY CLUSTERED 
(
    [dbs_id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_departmentid] ON [dbo].[dbs_user] 
(
    [dbs_departmentid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_email] ON [dbo].[dbs_user] 
(
    [dbs_email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_password] ON [dbo].[dbs_user] 
(
    [dbs_password] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_phone] ON [dbo].[dbs_user] 
(
    [dbs_phone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_roleid] ON [dbo].[dbs_user] 
(
    [dbs_roleid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_user_username] ON [dbo].[dbs_user] 
(
    [dbs_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT INTO [dbo].[dbs_user] VALUES('/0/', 0, 'admin', '5F4DCC3B5AA765D61D8327DEB882CF99', 'null', 'null', 'null', 'null', 'null', 1, 1, 0, '' + getDate() + '', '0.0.0.0', '1970/1/1 00:00:00')
GO
/****** Object:  Table [dbo].[dbs_task_member] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_task_member](
    [dbs_taskid] [int] NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_reason] [nvarchar](500) NOT NULL,
    [dbs_postscript] [nvarchar](500) NOT NULL,
    [dbs_status] [tinyint] NOT NULL,
    [dbs_acceptedtime] [datetime] NOT NULL,
    [dbs_rejectedtime] [datetime] NOT NULL,
    [dbs_completedtime] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_task_member_taskid] ON [dbo].[dbs_task_member] 
(
    [dbs_taskid] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_task_member_userid] ON [dbo].[dbs_task_member] 
(
    [dbs_userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_task] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_task](
    [dbs_id] [int] IDENTITY(1,1) NOT NULL,
    [dbs_fileid] [int] NOT NULL,
    [dbs_filename] [nvarchar](75) NOT NULL,
    [dbs_fileextension] [varchar](25) NOT NULL,
    [dbs_isfolder] [tinyint] NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_content] [nvarchar](1000) NOT NULL,
    [dbs_level] [tinyint] NOT NULL,
    [dbs_deadline] [datetime] NOT NULL,
    [dbs_revoke] [tinyint] NOT NULL,
    [dbs_cause] [nvarchar](500) NOT NULL,
    [dbs_time] [datetime] NOT NULL,
 CONSTRAINT [PK_dbs_task] PRIMARY KEY CLUSTERED 
(
    [dbs_id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_task_fileid] ON [dbo].[dbs_task] 
(
    [dbs_fileid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_task_time] ON [dbo].[dbs_task] 
(
    [dbs_time] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_task_userid] ON [dbo].[dbs_task] 
(
    [dbs_userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_role] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_role](
    [dbs_id] [smallint] IDENTITY(1,1) NOT NULL,
    [dbs_name] [nvarchar](24) NOT NULL,
    [dbs_sequence] [smallint] NOT NULL,
 CONSTRAINT [PK_dbs_role] PRIMARY KEY CLUSTERED 
(
    [dbs_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_log] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_log](
    [dbs_id] [int] IDENTITY(1,1) NOT NULL,
    [dbs_fileid] [int] NOT NULL,
    [dbs_filename] [nvarchar](75) NOT NULL,
    [dbs_fileextension] [varchar](25) NOT NULL,
    [dbs_fileversion] [smallint] NOT NULL,
    [dbs_isfolder] [tinyint] NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_action] [varchar](16) NOT NULL,
    [dbs_ip] [varchar](16) NOT NULL,
    [dbs_time] [datetime] NOT NULL,
 CONSTRAINT [PK_dbs_log] PRIMARY KEY CLUSTERED 
(
    [dbs_id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_log_action] ON [dbo].[dbs_log] 
(
    [dbs_action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_log_dataid] ON [dbo].[dbs_log] 
(
    [dbs_fileid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_log_time] ON [dbo].[dbs_log] 
(
    [dbs_time] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_log_userid] ON [dbo].[dbs_log] 
(
    [dbs_userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_log_username] ON [dbo].[dbs_log] 
(
    [dbs_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_file_process] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_file_process](
    [dbs_fileid] [int] NOT NULL,
    [dbs_convert] [tinyint] NOT NULL,
    [dbs_index] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_process_fileid] ON [dbo].[dbs_file_process] 
(
    [dbs_fileid] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_file_purview] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_file_purview](
    [dbs_fileid] [int] NOT NULL,
    [dbs_departmentid] [varchar](50) NOT NULL,
    [dbs_roleid] [smallint] NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_purview] [varchar](16) NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_purview_departmentid] ON [dbo].[dbs_file_purview] 
(
    [dbs_departmentid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_purview_fileid] ON [dbo].[dbs_file_purview] 
(
    [dbs_fileid] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_purview_roleid] ON [dbo].[dbs_file_purview] 
(
    [dbs_roleid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_purview_userid] ON [dbo].[dbs_file_purview] 
(
    [dbs_userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_file] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_file](
    [dbs_id] [int] IDENTITY(1,1) NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_version] [smallint] NOT NULL,
    [dbs_versionid] [int] NOT NULL,
    [dbs_folder] [tinyint] NOT NULL,
    [dbs_folderid] [int] NOT NULL,
    [dbs_folderpath] [varchar](100) NOT NULL,
    [dbs_codeid] [varchar](32) NOT NULL,
    [dbs_hash] [varchar](32) NOT NULL,
    [dbs_name] [nvarchar](75) NOT NULL,
    [dbs_extension] [varchar](25) NOT NULL,
    [dbs_size] [int] NOT NULL,
    [dbs_type] [varchar](16) NOT NULL,
    [dbs_remark] [nvarchar](100) NOT NULL,
    [dbs_share] [tinyint] NOT NULL,
    [dbs_lock] [tinyint] NOT NULL,
    [dbs_sync] [tinyint] NOT NULL,
    [dbs_recycle] [tinyint] NOT NULL,
    [dbs_createusername] [nvarchar](16) NOT NULL,
    [dbs_createtime] [datetime] NOT NULL,
    [dbs_updateusername] [nvarchar](16) NOT NULL,
    [dbs_updatetime] [datetime] NOT NULL,
    [dbs_removeusername] [nvarchar](16) NOT NULL,
    [dbs_removetime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbs_file] PRIMARY KEY CLUSTERED 
(
    [dbs_id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_folderid] ON [dbo].[dbs_file] 
(
    [dbs_folderid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_folderpath] ON [dbo].[dbs_file] 
(
    [dbs_folderpath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_userid] ON [dbo].[dbs_file] 
(
    [dbs_userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_file_versionid] ON [dbo].[dbs_file] 
(
    [dbs_versionid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_discuss] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_discuss](
    [dbs_id] [int] IDENTITY(1,1) NOT NULL,
    [dbs_fileid] [int] NOT NULL,
    [dbs_filename] [nvarchar](75) NOT NULL,
    [dbs_fileextension] [varchar](25) NOT NULL,
    [dbs_isfolder] [tinyint] NOT NULL,
    [dbs_userid] [smallint] NOT NULL,
    [dbs_username] [nvarchar](16) NOT NULL,
    [dbs_content] [nvarchar](500) NOT NULL,
    [dbs_revoke] [tinyint] NOT NULL,
    [dbs_time] [datetime] NOT NULL,
 CONSTRAINT [PK_dbs_discuss] PRIMARY KEY CLUSTERED 
(
    [dbs_id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_dbs_discuss_fileid] ON [dbo].[dbs_discuss] 
(
    [dbs_fileid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbs_department] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbs_department](
    [dbs_id] [smallint] IDENTITY(1,1) NOT NULL,
    [dbs_departmentid] [smallint] NOT NULL,
    [dbs_name] [nvarchar](24) NOT NULL,
    [dbs_sequence] [smallint] NOT NULL,
 CONSTRAINT [PK_dbs_department] PRIMARY KEY CLUSTERED 
(
    [dbs_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
