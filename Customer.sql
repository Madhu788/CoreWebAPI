USE [POC]
GO

/****** Object:  Table [dbo].[Customer]    Creation ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[UserId] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_UserId]  DEFAULT (newid()) FOR [UserId]
GO

ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO


--Insert Customer Data
USE [POC]
GO

INSERT INTO [dbo].[Customer]
           ([Username]
           ,[Email]
           ,[FirstName]
           ,[LastName]     
           ,[IsActive])
     VALUES
	 ('madhuabe'
           ,'madhuabe@gmail.com'
           ,'madhu'
           ,'abe' 
           ,1),
           ('hashi'
           ,'hashi@gmail.com'
           ,'hashi'
           ,'Wije' 
           ,1),('sachi'
           ,'sachi@gmail.com'
           ,'sachi'
           ,'bodi' 
           ,1)
GO

--SELECT * FROM [dbo].[Customer]