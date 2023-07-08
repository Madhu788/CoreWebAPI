USE [POC]
GO

/****** Object:  Table [dbo].[Supplier]    Creation******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supplier](
	[SupplierId] [uniqueidentifier] NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_SupplierId]  DEFAULT (newid()) FOR [SupplierId]
GO

ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_CreatedOnSuplier]  DEFAULT (getdate()) FOR [CreatedOn]
GO



--Insert [Supplier] Data
USE [POC]
GO

INSERT INTO [dbo].[Supplier]
           ([SupplierName]
           ,[IsActive])
     VALUES
	      ('MD'
           ,1),
           ('DSI'
           ,1)
		   ,('CMS'
           ,0)
GO


--SELECT * FROM [dbo].[Supplier]