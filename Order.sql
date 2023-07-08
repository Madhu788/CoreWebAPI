USE [POC]
GO

/****** Object:  Table [dbo].[Order]    Creation ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[OrderStatus] [int] NULL,
	[OrderType] [int] NULL,
	[OrderBy] [uniqueidentifier] NOT NULL,
	[OrderedOn] [datetime] NOT NULL,
	[ShippedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ProductId]  FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_UserId]  FOREIGN KEY([OrderBy])
REFERENCES [dbo].[Customer] ([UserId])
GO

ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_OrderId]  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_OrderedOn]  DEFAULT (getdate()) FOR [OrderedOn]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_ShippedOn]  DEFAULT (getdate()) FOR [ShippedOn]
GO

--Insert [Order] Data
USE [POC]
GO
INSERT INTO [dbo].[Order]
           ([ProductId]
           ,[OrderStatus]
           ,[OrderType]
           ,[OrderBy]
           ,[IsActive])
     VALUES
	       ('837D4A24-8F4B-4E50-BE11-02D7C3F46B84'
           ,1
           ,1
           ,'2FA85F64-5717-4562-B3FC-2C963F66AFA0'      
           ,1)
		   ,('948582DF-0469-4A6B-AE5A-27013B56343F'
           ,1
           ,1
           ,'2FA85F64-5717-4562-B3FC-2C963F66AFA0'      
           ,0)
		   ,('F441564F-49A3-4961-AB73-E8B6A6162C0A'
           ,1
           ,1
           ,'9FA85F64-5717-4562-B3FC-2C963F66AFA0'      
           ,1)
		   ,('F441564F-49A3-4961-AB73-E8B6A6162C0A'
           ,1
           ,1
           ,'3FA85F64-5717-4562-B3FC-2C963F66AFA6'      
           ,1)
		   ,('F441564F-49A3-4961-AB73-E8B6A6162C0A'
           ,1
           ,1
           ,'4B33BCCC-CA6B-4DF3-BFAC-09D25FE6F50B'      
           ,1)
GO

--SELECT * FROM [dbo].[Order] 

--Create Stored procedure for 6.E to get required data from SQL.
CREATE PROCEDURE GetActiveOrders
@Active bit
AS BEGIN
SELECT o.* , c.[Username], p.[ProductName], s.[SupplierName]
FROM [dbo].[Order] o, [dbo].[Customer] c, [dbo].Supplier s, [dbo].Product p
WHERE o.IsActive = @Active AND o.[OrderBy] = c.[UserId] AND o.[ProductId] = p.[ProductId]
AND p.[SupplierId] = s.[SupplierId]
order by c.[Username]
END

--EXEC GetActiveOrders @Active = 1;