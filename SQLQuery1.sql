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

CREATE TABLE [dbo].[Products] (
    [ProductID]   INT IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [Category]    NVARCHAR (50)  NULL,
    [Price]       DECIMAL (10, 2) NOT NULL,
    [Stock]       INT NOT NULL DEFAULT 0,
    [ImageUrl]    NVARCHAR (200) NULL,
    [Description] NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

INSERT INTO Products (Name, Category, Price, Stock, ImageUrl, Description) VALUES
('木塔模型摆件', '模型摆件', 88.00, 50, 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=600&q=80', '应县木塔经典造型，适合书桌陈列。'),
('木塔剪影帆布包', '生活周边', 59.00, 120, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=600&q=80', '简约剪影设计，日常出行百搭。'),
('木塔纹样保温杯', '文创杯具', 79.00, 80, 'https://images.unsplash.com/photo-1517705008128-361805f42e86?auto=format&fit=crop&w=600&q=80', '木塔纹样环绕杯身，保温保冷皆宜。');
