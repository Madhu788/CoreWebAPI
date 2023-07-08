USE [POC]
GO

/****** Object:  Table [dbo].[Product]    Creation ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[SupplierId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SupplierId]  FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_ProductId]  DEFAULT (newid()) FOR [ProductId]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_CreatedOnProduct]  DEFAULT (getdate()) FOR [CreatedOn]
GO

USE [UMBRACOPOC]
GO

INSERT INTO [dbo].[Product]
           ([ProductName]
           ,[UnitPrice]
           ,[SupplierId]           
           ,[IsActive])
     VALUES
           ('Shoes'
           ,2000
           ,'83576EE1-CAD8-4FB5-96B8-DD91900D7596'      
           ,1),
		     ('Bag'
           ,1800
           ,'83576EE1-CAD8-4FB5-96B8-DD91900D7596'      
           ,1),
		   ('Jam'
           ,500
           ,'827ACA96-4666-4366-B1B2-1A89D5F36778'      
           ,1),
		     ('Sauces'
           ,900
           ,'827ACA96-4666-4366-B1B2-1A89D5F36778'      
           ,1),
		   ('Book'
           ,120
           ,'257CBF07-1D4B-4BE9-8A21-325AD3AC4493'      
           ,1)
GO


SELECT * FROM [dbo].[Product]