CREATE TABLE [dbo].[Users] (
    [UserID]   INT            IDENTITY (1, 1) NOT NULL,
    [UserName] NVARCHAR (50)  NOT NULL,
    [Password] NVARCHAR (100) NOT NULL,
    [Email]    NVARCHAR (100) NULL,
    [Phone]    NVARCHAR (20)  NULL,
    [IDCard]   NVARCHAR (18)  NULL,
    [Address]  NVARCHAR (200) NULL,
    [ZipCode]  NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    UNIQUE NONCLUSTERED ([UserName] ASC)
);

CREATE TABLE [dbo].[SiteStats] (
    [TotalViews] INT DEFAULT 0 NOT NULL
);
-- 插入初始数据
INSERT INTO SiteStats (TotalViews) VALUES (0);