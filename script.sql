USE [master]
GO
/****** Object:  Database [WebManagement]    Script Date: 3/23/2022 10:24:46 PM ******/
CREATE DATABASE [WebManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RauCuManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\RauCuManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RauCuManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\RauCuManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WebManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebManagement] SET QUERY_STORE = OFF
GO
USE [WebManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](15) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NULL,
	[productID] [nvarchar](50) NULL,
	[subtotal] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[image] [nvarchar](1000) NULL,
	[price] [float] NULL,
	[categoryID] [nvarchar](15) NULL,
	[description] [nvarchar](4000) NULL,
	[sizeID] [nchar](5) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSize]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSize](
	[sizeID] [nchar](5) NOT NULL,
	[quantity] [int] NOT NULL,
	[productID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSize] PRIMARY KEY CLUSTERED 
(
	[sizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/23/2022 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'1', N'Jackets')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'2', N'Shirts')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'3', N'Sweeters and Cardigans')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'4', N'Jeans')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'5', N'Trousers')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'6', N'T-shirts')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'7', N'Sunglasses')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'8', N'Wallets')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'1', N'Denim Jacket', N'https://bestchineseproducts.com/wp-content/uploads/2019/04/denim-jackets.png', 1999000, N'1', N'Cool and fresh', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'10', N'Stylish Shirt
', N'https://i.pinimg.com/564x/2e/41/47/2e4147c28c008ad1f1c581c1c503f7fb.jpg', 799000, N'2', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'11', N'Fancy Shirt
', N'https://i.pinimg.com/564x/c7/a5/44/c7a54440cc59a470790f0a2488c9d47e.jpg', 999000, N'2', N'Fancy but gentle', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'12', N'Unique Shirt
', N'https://i.pinimg.com/564x/40/c8/47/40c84775a9716e2eb6473c6d64dba15e.jpg', 699000, N'2', N'The one and only ', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'13', N'Cardigan ', N'https://media.gq.com/photos/5fd9413a3ba3b9b9739db38e/master/w_2000,h_1333,c_limit/Entireworld-fisherman''s-cardigan.jpg', 799000, N'3', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'14', N'Cardigan ', N'https://media.gq-magazine.co.uk/photos/61260098490f4d231bbe62ce/master/w_1920,h_1280,c_limit/Caridgans_0005_H&m.jpg', 1999000, N'3', N'Warm and comfortable', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'15', N'Fluffy Yarn Fleece Full-Zip Jacket', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1627312128-screen-shot-2021-07-26-at-11-08-21-am-1627312112.png?crop=0.989xw:0.986xh;0.00801xw,0.00799xh&resize=768:*', 999000, N'1', N'Best selling Winter 2021', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'16', N'Journeyman Shirt Jacket
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1627322976-514wsPytZNL._SL500_.jpg?crop=1xw:1xh;center,top&resize=768:*', 2999000, N'1', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'17', N'Trucker Jacket
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1600394889-denim-1600394880.jpg?crop=1xw:1xh;center,top&resize=768:*', 3999000, N'1', N'Young but still mature', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'18', N'Flannel-Lined Waxed Hudson Jacket', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1627312755-oXlNB7iSxL_flint-and-tinder_flannel-lined_waxed_hudson_jacket_waxed-jackets_0_original.jpg?crop=1xw:1xh;center,top&resize=768:*', 1999000, N'1', N'High quality and cool', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'19', N'Bonobos Tech Button-Down Shirt', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1566927496-button-down-4-1566927485.jpg?crop=1xw:1xh;center,top&resize=768:*', 599000, N'2', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'2', N'Blue Jackets', N'https://images-na.ssl-images-amazon.com/images/I/91h9-Li8FZL._AC_UL1500_.jpg', 2999000, N'1', N'High quality jacket', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'20', N'Taylor Stitch The Jack Button-Down Shirt', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1609348497-1566929014-button-down-7-1566929007.jpg?crop=1xw:1xh;center,top&resize=768:*', 599000, N'2', N'Wear this shirrt will make your crush fall in love with you', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'21', N'Polo Ralph Lauren Slim-Fit Cotton Oxford Shirt', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1566928415-button-down-10-1566928349.jpg?crop=1xw:1xh;center,top&resize=768:*', 499000, N'2', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'22', N'Everlane The Heavyweight Overshirt', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1566928935-button-down-1-1566928930.jpg?crop=1xw:1xh;center,top&resize=768:*', 499000, N'2', N'Luxurious and noble', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'23', N'Soft Cotton Shawl Cardigan', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632403750-screen-shot-2021-09-23-at-9-28-02-am-1632403693.png?crop=0.939xw:1.00xh;0.00321xw,0&resize=768:*', 1999000, N'3', N'Warm and comfortable', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'24', N'Extra Fine Merino V-Neck Long-Sleeve Cardigan', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632407603-screen-shot-2021-09-23-at-10-32-53-am-1632407582.png?crop=0.9986244841815681xw:1xh;center,top&resize=768:*', 1999000, N'3', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'25', N'Cotton Cardigan Sweater', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632404745-screen-shot-2021-09-23-at-9-44-01-am-1632404652.png?crop=0.949xw:0.734xh;0,0.135xh&resize=768:*', 799000, N'3', N'The most fashion clothes of all time', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'26', N'Supima Cotton V-Neck Cardigan', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632405919-screen-shot-2021-09-23-at-10-04-39-am-1632405889.png?crop=0.949xw:0.915xh;0,0.0368xh&resize=768:*', 2999000, N'3', N'Beauty and energetic clothes', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'27', N'Honeycomb Cardigan Sweater', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632408832-screen-shot-2021-09-23-at-10-52-53-am-1632408801.png?crop=1.00xw:0.876xh;0,0.0670xh&resize=768:*', 2999000, N'3', N'Sweet and sour', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'28', N'Cotton Cardigan', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632419913-screen-shot-2021-09-23-at-1-57-07-pm-1632419837.png?crop=1.00xw:0.663xh;0,0.174xh&resize=768:*', 899000, N'3', N'Sweet and sour', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'29', N'Reverse Seam Cardigan
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1631121981-MW075-1665-GOLDEN-KHAKI-61731_1024x1024.jpg?crop=0.946xw:0.709xh;0.0256xw,0.133xh&resize=768:*', 799000, N'3', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'3', N'Leather Jackets', N'https://cf.shopee.vn/file/d65dafc07638c71e20220ade57604e9a', 3999000, N'1', N'High quality jacket', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'30', N'Washable Cashmere V-Neck Cardigan
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1632418099-s7-1396763_lifestyle.jpg?crop=0.715xw:0.715xh;0.140xw,0.142xh&resize=768:*', 499000, N'3', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'31', N'ASKET', N'https://media.gq-magazine.co.uk/photos/5fd9e3aaf29da2e6a725ad2c/master/w_1920%2Cc_limit/JEANSUPDATE_1612_ASKET.jpg', 399000, N'4', N'Wear this shirrt will make your crush fall in love with you', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'32', N'A.P.C.
', N'https://media.gq-magazine.co.uk/photos/61e68e94bfbaf7cbb88df2b2/master/w_1920%2Cc_limit/18012021_J_01.jpg', 799000, N'4', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'33', N'PS PAUL SMITH
', N'https://media.gq-magazine.co.uk/photos/621d33cb9c02050e132ba6f6/master/w_1920%2Cc_limit/Jeans_0002_Paul%2520smith.jpg', 799000, N'4', N'Luxurious and noble', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'34', N'LEVI''S', N'https://media.gq-magazine.co.uk/photos/621d33c75360fdaea34263d6/master/w_1920%2Cc_limit/Jeans_0006_Levis.jpg', 899000, N'4', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'35', N'PAIGE', N'https://media.gq-magazine.co.uk/photos/621d33c69c02050e132ba6f2/master/w_1920%2Cc_limit/Jeans_0007_Reiss.jpg', 899000, N'4', N'Warm and comfortable', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'36', N'CALVIN KLEIN
', N'https://media.gq-magazine.co.uk/photos/621d33cc5360fdaea34263da/master/w_1920%2Cc_limit/Jeans_0001_CK.jpg', 999000, N'4', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'37', N'PANGAIA', N'https://media.gq-magazine.co.uk/photos/61e68e95c0c45810f3fde0ec/master/w_1920%2Cc_limit/18012021_J_07.jpg', 999000, N'4', N'Luxurious and noble', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'38', N'UNIQLO', N'https://media.gq-magazine.co.uk/photos/61e68e95bfbaf7cbb88df2b5/master/w_1920%2Cc_limit/18012021_J_06.jpg', 999000, N'4', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'39', N'UNIQLO U
', N'https://media.gq-magazine.co.uk/photos/620221dcbbe049203057641b/master/w_1920%2Cc_limit/07022022_U_03.jpeg', 1999000, N'4', N'Luxurious and noble', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'4', N'Breitman Jacket', N'https://www.chapi.vn/img/article/2021/7/15/ao-jacket-la-gi-tim-hieu-ve-ao-jacket-500x500.jpg', 1999000, N'1', NULL, NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'40', N'EDWIN', N'https://media.gq-magazine.co.uk/photos/5f74577a77e6f091ec170ce3/master/w_1920%2Cc_limit/20200930-jeans-02.jpg', 1999000, N'4', N'Warm and comfortable', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'41', N'Perry Ellis', N'https://looksgud.com/blog/wp-content/uploads/2016/10/perry-ellis-formal-trouser-pants.jpg', 599000, N'5', N'Warm and comfortable', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'42', N'Haggar', N'https://looksgud.com/blog/wp-content/uploads/2016/10/haggar-black-trouser-pants.jpg', 599000, N'5', N'Luxurious and noble', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'43', N'Goodthreads', N'https://looksgud.com/blog/wp-content/uploads/2016/10/goodthreads-sky-blue-trouser-pants.jpg', 599000, N'5', N'Wear this shirrt will make your crush fall in love with you', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'44', N'Dockers', N'https://looksgud.com/blog/wp-content/uploads/2016/10/dockers-khaki-trouser-pants.jpg', 599000, N'5', N'Beauty and energetic clothes', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'45', N'Hugo Boss', N'https://looksgud.com/blog/wp-content/uploads/2016/10/hugo-boss-blue-formal-trouser-pants.jpg', 799000, N'5', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'46', N'Calvin Klein', N'https://looksgud.com/blog/wp-content/uploads/2016/10/calvin-klain-trouser-pants.jpg', 599000, N'5', N'Elegant and youthful', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'47', N'Polo Ralph Lauren', N'https://looksgud.com/blog/wp-content/uploads/2021/12/polo-ralph-lauren-trouser-pants.jpg', 499000, N'5', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'48', N'Kenneth Cole Reaction', N'https://looksgud.com/blog/wp-content/uploads/2016/10/kenneth-cole-reaction-grey-trouser-pants.jpg', 399000, N'5', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'49', N'Brooks Brothers', N'https://looksgud.com/blog/wp-content/uploads/2016/10/brooks-brothers-black-trouser-pants.jpg', 899000, N'5', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'5', N'Bomber Jackets', N'https://kickztaste.com/wp-content/uploads/2021/10/BAPE-Shark-Bomber-Jacket-Olive.jpg', 1999000, N'1', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'50', N'Nordstrom Pima Cotton Lounge Pants', N'https://img.dtcn.com/image/themanual/nordstrom-pima-cotton-lounge-pants-768x511.jpg', 899000, N'5', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'51', N'Silver Crew Neck T-Shirt', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1641486732-M01T12-BLLT_Front_05c8ee59-bb38-4aed-acca-af5b685c8eeb.png?crop=0.826xw:1xh;center,top&resize=768:*', 399000, N'6', N'Best selling Summer 2020', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'52', N'Strato Tech Tee
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1641487324-V126HCC_0_2048x.jpg?crop=1xw:1.00xh;center,top&resize=768:*', 399000, N'6', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'53', N'Pima Curved Hem Tee
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1589483689-buck-mason-faded-black-vencie-wash-pima-curved-hem-tee-1-bde2595b-5d42-409e-bf78-5e1eda1fe80d-1589483677.jpg?crop=1.00xw:0.751xh;0,0.136xh&resize=768:*', 399000, N'6', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'54', N'Slub Pocket Tee
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1621997912-bY0vXvwxdG_forty-five_slub_pocket_tee_0_original.jpg?crop=1xw:1.00xh;center,top&resize=768:*', 599000, N'6', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'55', N'Clothing Curve Hem Tee
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1589484734-screen-shot-2020-05-14-at-3-31-39-pm-1589484719.png?crop=0.9102822580645161xw:1xh;center,top&resize=768:*', 499000, N'6', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'56', N'Basic Jersey Tee in Black
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1616441115-KN021051-BK01_400x.jpg?crop=1.00xw:0.835xh;0,0.0896xh&resize=768:*', 399000, N'6', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'57', N'Men''s Cotton Classics
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1641487506-31TKwgmVERS._SL500_.jpg?crop=1.00xw:0.736xh;0,0&resize=768:*', 299000, N'6', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'58', N'Essential Crew
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1621620747-screen-shot-2021-05-21-at-2-12-13-pm-1621620739.png?crop=1.00xw:0.773xh;0,0.135xh&resize=768:*', 699000, N'6', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'59', N'Classic Cotton T-Shirt
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1589484325-sunspel-t-shirt-1589484310.jpg?crop=1xw:1xh;center,top&resize=768:*', 199000, N'6', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'6', N'Brown Leather Jacket', N'https://m.media-amazon.com/images/I/81WmLdTTjaS._AC_UY1000_.jpg', 2999000, N'1', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'60', N'Second Skin Moroccan Tee
', N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1646167498-screen-shot-2022-03-01-at-3-44-21-pm-1646167470.png?crop=1.00xw:0.838xh;0,0.135xh&resize=768:*', 199000, N'6', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'61', N'Gucci Aviator', N'https://cdn.luxe.digital/media/20220218153432/best-sunglasses-men-gucci-luxe-digital-900x600.jpg.webp', 2999000, N'7', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'62', N'Randolph Aviator', N'https://cdn.luxe.digital/media/20220218153508/best-sunglasses-men-randolph-aviator-luxe-digital-900x600.jpg.webp', 3999000, N'7', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'63', N'Yesglasses Sheldon', N'https://cdn.luxe.digital/media/20220218153558/best-sunglasses-men-yesglasses-luxe-digital-900x600.jpg.webp', 1999000, N'7', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'64', N'Tomahawk The Hamptons', N'https://cdn.luxe.digital/media/20220218153542/best-sunglasses-men-tomahawk-luxe-digital-900x600.jpg.webp', 1999000, N'7', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'65', N'Vincero The Villa', N'https://cdn.luxe.digital/media/20220218153550/best-sunglasses-men-vincero-luxe-digital-900x600.jpg.webp', 2999000, N'7', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'66', N'Axel Arigato Jet Square', N'https://cdn.luxe.digital/media/20220218153402/best-sunglasses-men-axel-arigato-luxe-digital-900x600.jpg.webp', 3999000, N'7', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'67', N'Warby Parker Durand:', N'https://cdn.luxe.digital/media/20220218153554/best-sunglasses-men-warby-parker-luxe-digital-900x600.jpg.webp', 1999000, N'7', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'68', N'Ray-Ban Aviator Classic', N'https://cdn.luxe.digital/media/20220218153516/best-sunglasses-men-ray-ban-luxe-digital-900x600.jpg.webp', 1999000, N'7', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'69', N'Ermenegildo Zegna', N'https://cdn.luxe.digital/media/20220218153423/best-sunglasses-men-ermenegildo-zegna-luxe-digital-900x600.jpg.webp', 1999000, N'7', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'7', N'White Shirts', N'https://velourstore.com/us/pub_images/original/VBN_38022_Standard_Button_Shirt_White.jpg', 1999000, N'2', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'70', N'Tom Ford Eyewear Dunning Sunglasses', N'https://cdn.luxe.digital/media/20220218153539/best-sunglasses-men-tom-ford-luxe-digital-900x600.jpg.webp', 4999000, N'7', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'71', N'Gucci Ophidia GG Supreme Wallet', N'https://i.pinimg.com/564x/f9/69/80/f969802162edd679635c3f0f7b69d33a.jpg', 1999000, N'8', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'72', N'Zitahli Minimalist Slim Bifold', N'https://i.pinimg.com/564x/9b/14/4d/9b144d99efa7091ba2ce1d7e2acf7e68.jpg', 2999000, N'8', N'Style and energetic', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'73', N'Columbia Men’s RFID Trifold', N'https://i.pinimg.com/564x/b8/f6/78/b8f678d4def4464938067698b0d45fe9.jpg', 2999000, N'8', N'The best shirt in the world', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'74', N'Saint Laurent Square', N'https://i.pinimg.com/564x/fc/9f/6e/fc9f6e9e385601af54dc351cae545114.jpg', 4999000, N'8', N'Fancy but gentle', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'75', N'Timberland Men’s Leather Trifold', N'https://i.pinimg.com/564x/87/09/a5/8709a52929c2e32fbe0342e5c3428a44.jpg', 4999000, N'8', N'Fancy but gentle', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'76', N'Hissimo Men’s Slim', N'https://i.pinimg.com/564x/61/99/c5/6199c5f1f178c4af27ea45810c10db42.jpg', 1999000, N'8', N'Wear this shirrt will make your crush fall in love with you', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'77', N'Tommy Hilfiger', N'https://i.pinimg.com/564x/96/1c/85/961c8576e08d2e72f37883bc40ad001f.jpg', 1999000, N'8', N'Cool and fresh', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'78', N'Carhartt Men’s Billfold', N'https://i.pinimg.com/564x/13/33/25/133325cf9626760b15269ff440ed4bb9.jpg', 2999000, N'8', N'Stylish and extremely trendy', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'79', N'BOSS Crosstown Bifold', N'https://i.pinimg.com/564x/3b/fa/8b/3bfa8b5ed422dc8dad57c040d15be0f3.jpg', 5999000, N'8', N'Fit for young generation', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'8', N'Checked Shirt', N'https://www.childrensalonoutlet.com/media/catalog/product/d/i/diesel-grey-black-checked-shirt-295643-438bc1f4053241c340945a3f01a878a4589e156b.jpg', 499000, N'2', N'Fancy but gentle', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'80', N'Comme Des Garcons Classic', N'https://i.pinimg.com/564x/92/0c/d4/920cd4d437f3a1e251928001a6f81275.jpg', 4999000, N'8', N'Fancy but gentle', NULL)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [categoryID], [description], [sizeID]) VALUES (N'9', N'Blue Shirts', N'https://res.cloudinary.com/fictive-kin/image/upload/v1/verygoods/prod/71f5d4ee3854bd4dde2955941acef45dd40e708c', 1999000, N'2', N'Style and energetic', NULL)
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUser] ([userID], [name], [address], [phone], [password], [roleID]) VALUES (N'admin', N'Admin', N'HCM', N'09123232031', N'1', N'AD')
INSERT [dbo].[tblUser] ([userID], [name], [address], [phone], [password], [roleID]) VALUES (N'tan', N'TAN', N'HCM', N'023923123', N'1', N'US')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory1] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory1]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblSize] FOREIGN KEY([sizeID])
REFERENCES [dbo].[tblSize] ([sizeID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblSize]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [WebManagement] SET  READ_WRITE 
GO
