USE [master]
GO
/****** Object:  Database [BTL]    Script Date: 4/30/2021 5:04:35 PM ******/
CREATE DATABASE [BTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KIMLONG\MSSQL\DATA\BTL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BTL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KIMLONG\MSSQL\DATA\BTL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BTL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL] SET RECOVERY FULL 
GO
ALTER DATABASE [BTL] SET  MULTI_USER 
GO
ALTER DATABASE [BTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BTL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BTL', N'ON'
GO
ALTER DATABASE [BTL] SET QUERY_STORE = OFF
GO
USE [BTL]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] NOT NULL,
	[TitleBlog] [nvarchar](4000) NULL,
	[Time] [nchar](30) NULL,
	[ContentBlog] [nvarchar](4000) NULL,
	[ImageBlog] [nchar](30) NULL,
	[NameUser] [nvarchar](50) NULL,
	[Summary] [nchar](2000) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[productID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[TypeStatus] [bit] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] NOT NULL,
	[NameUser] [nvarchar](30) NULL,
	[Job] [nvarchar](50) NULL,
	[CommentContent] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryType]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryType](
	[countryID] [int] NOT NULL,
	[countryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CountryType] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[colorID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[image] [text] NOT NULL,
	[color] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC,
	[productID] ASC
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[createdDate] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nchar](15) NULL,
	[email] [nchar](30) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](20) NULL,
	[state] [nvarchar](20) NULL,
	[paymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymentTypeID] [int] NOT NULL,
	[paymentTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymentTypeID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productPrice] [nchar](20) NULL,
	[productSale] [nchar](20) NULL,
	[productInfor] [nvarchar](2000) NULL,
	[productImage] [nchar](30) NULL,
	[productIntroduce] [nvarchar](4000) NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/30/2021 5:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NULL,
	[Password] [nchar](50) NULL,
	[Email] [nchar](30) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)
) ON [PRIMARY]
GO
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (1, N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn', N'April 07, 2021                ', N'Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".

Nó là một điện thoại thông minh tầm trung tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

ColorOS 11.1 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset là MediaTek Dimensity 800U hỗ trợ 64bit và CPU là tám lõi.

Màn hình được trang bị AMOLED 6,43 inch FHD + (1080 * 2400).

Máy ảnh bao gồm cảm biến hình ảnh CMOS chính khoảng 48 triệu điểm ảnh, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, cảm biến hình ảnh CMOS macro khoảng 2 triệu điểm ảnh và cảm biến đơn sắc cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh . Nó được trang bị một camera quad và cảm biến hình ảnh CMOS với khoảng 16 triệu điểm ảnh ở mặt trước.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2600 (B7) / 2100 (B1) / 1800 (B3) / 900 (B8) / 850 (B5) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) MHz, W-CDMA 2100 (I) / 900 (VIII) / Nó hỗ trợ 850 (V) MHz và GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là một SIM duy nhất và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây (2.4GHz / 5GHz), NFC cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB.

Dung lượng của viên pin là 4310mAh.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay và cảm biến xác thực vân tay sử dụng loại tích hợp màn hình.

Bạn có thể chọn từ hai biến thể màu sắc, Fluid Black và Cosmo Blue.

Nó đã được quyết định bán nó ở Singapore, và giá là 529 đô la Singapore (khoảng 43.000 yên).', N'Blog_01.jpg                   ', N'Tuấn Anh', N'Công bố OPPO Reno5 Z, điện thoại thông minh 5G được trang bị camera bốn. Viễn thông di động OPPO Quảng Đông của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / GSM "OPPO Reno5 Z (CPH2211)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (2, N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera', N'April 09, 2021                ', N'RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

Realme UI 2.0 dựa trên Android 11 được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 1000+ hỗ trợ 64 bit và CPU là một lõi tám.

Màn hình sẽ có kích thước khoảng 6,55 inch FHD + (1080 * 2400) AMOLED với tốc độ làm tươi lên đến 90Hz.

Máy ảnh này là một máy ảnh ba bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu pixel chính ở phía sau, cảm biến hình ảnh CMOS khoảng 8 triệu pixel với ống kính góc siêu rộng, cảm biến hình ảnh CMOS khoảng 2 triệu pixel cho macro và CMOS khoảng 32 triệu pixel ở phía trước. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 1800 (n3) MHz, NR (FR1, TDD) 4500 (n79) / 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD )) 2600 (B7) / 2100 (B1) / 1900 (B2) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B18 / B19 / B26) / 700 (B12 / B17)) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1900 (II) / 1700 ( IV) Nó hỗ trợ / 900 (VIII) / 850 (V) / 800 (VI / XIX) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900/850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng n1 và n3 chỉ hoạt động trong cấu hình SA và n77 chỉ hoạt động trong cấu hình NSA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1, mạng LAN không dây IEEE 802.11a / b / g / n / ac / ax (2.4GHz / 5GHz), NFC có thể được sử dụng.

Mô hình có dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong 128GB (sau đây gọi là mô hình 8GB + 128GB) và mô hình có dung lượng bộ nhớ hệ thống là 12GB và dung lượng lưu trữ trong 256GB (sau đây gọi là kiểu máy 12GB + 256GB) là có sẵn. Có.

Viên pin được tích hợp bên trong có dung lượng 4500mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Có hai biến thể màu sắc, Tenkunojo và Kuro Takumi Forest.

Nó đã được quyết định bán nó ở Trung Quốc và giá được đặt ở mức 2.299 NDT (khoảng 39.000 yên) cho mô hình 8GB + 128GB và 2.599 nhân dân tệ (khoảng 44.000 yên) cho mô hình 12GB + 256GB.', N'Blog_02.jpg                   ', N'Hoàng Thảo', N'Công bố phiên bản tối cao của điện thoại thông minh 5G Realme X7 Pro được trang bị ba camera. RealMe Chongqing Mobile Telecommunications của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "realme X7 Pro Supreme Edition".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (3, N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820', N'April 02, 2021                ', N'Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".

Nó là điện thoại thông minh tương thích với hệ thống thông tin di động thế hệ thứ 5 (5G).

OriginOS 1.0, dựa trên Android 11, sẽ được sử dụng làm hệ điều hành.

Chipset được trang bị MediaTek Dimensity 820 hỗ trợ 64 bit.

CPU là một lõi tám và tần số hoạt động bao gồm lõi tứ với tốc độ tối đa là 2,6 GHz và lõi tứ với tốc độ tối đa là 2,0 GHz.

Màn hình có kích thước khoảng 6,44 inch FHD + (1080 * 2404) AMOLED với tốc độ làm mới lên đến 90Hz.

Máy ảnh này là bộ ba camera bao gồm cảm biến hình ảnh CMOS khoảng 64 triệu điểm ảnh chính ở phía sau, một máy ảnh góc cực rộng cảm biến hình ảnh CMOS khoảng 8 triệu điểm ảnh, một máy ảnh macro cảm biến hình ảnh CMOS khoảng 2 triệu điểm ảnh và mặt trước khoảng 32 CMOS triệu pixel. Được trang bị một cảm biến hình ảnh.

Phương thức giao tiếp là NR (FR1, FDD) 2100 (n1) / 700 (n28A) MHz, NR (FR1, TDD) 3700 (n77) / 3500 (n78) / 2500 (n41) MHz, LTE (FDD) 2100 (B1) / 1800 (B3) / 1700 (B4) / 900 (B8) / 850 (B5) / 800 (B19) / 700 (B28A) MHz, LTE (TDD) 2600 (B38) / 2500 (B41) / 2300 (B40) / 2000 (B34) / 1900 (B39) MHz, W-CDMA 2100 (I) / 1700 (IV) / 900 (VIII) / 850 (V) MHz, CDMA2000 800 (BC0) MHz, GSM 1900/1800/900 / Nó hỗ trợ 850 MHz.

Hệ thống 5G NR là 5G chế độ kép hỗ trợ cả cấu hình độc lập (SA) và không độc lập (NSA), nhưng tần số FDD chỉ hoạt động trong cấu hình SA.

Thẻ SIM là hai SIM và kích thước là kích thước Nano SIM (4FF).

Bluetooth 5.1 và mạng LAN không dây (2.4GHz / 5GHz) cũng có sẵn.

Dung lượng bộ nhớ hệ thống là 8GB và dung lượng lưu trữ trong là 128GB hoặc 256GB.

Viên pin được tích hợp bên trong có dung lượng 4100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Xác thực sinh trắc học hỗ trợ xác thực khuôn mặt và xác thực vân tay, và cảm biến xác thực vân tay là loại tích hợp màn hình.

Bạn có thể chọn từ ba biến thể màu sắc: cực quang đêm đầy sao, pha lê ánh sáng nước và obsidian.

Nó đã được quyết định bán nó ở Trung Quốc và giá sẽ là RMB 2.399 (khoảng 40.000 yên) cho mô hình có bộ nhớ trong 128GB và 2.699 nhân dân tệ (khoảng 45.000 yên) cho mô hình có 256GB.', N'Blog_03.jpg                   ', N'Mai Phú', N'Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 3	Giới thiệu điện thoại thông minh 5G Vivo S9e với Mật độ 820. Thông tin di động vivo của Trung Quốc đã công bố thiết bị đầu cuối NR / LTE / W-CDMA / CDMA2000 / GSM "vivo S9e (V2048A)".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Blog] ([BlogID], [TitleBlog], [Time], [ContentBlog], [ImageBlog], [NameUser], [Summary]) VALUES (4, N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7', N'April 10, 2021                ', N'Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".

Nó là một máy tính bảng sử dụng Magic UI 4.0, dựa trên Android 10 làm hệ điều hành.

Chipset được trang bị MediaTek MT8786.

CPU là một lõi tám và tần số hoạt động bao gồm lõi kép với tối đa 2,0 GHz và lõi sáu với tối đa 1,8 GHz.

Màn hình được trang bị tinh thể lỏng IPS kích thước 10,1 inch WUXGA (1920 * 1200) và mật độ điểm ảnh là 224 ppi.

Máy ảnh được trang bị cảm biến hình ảnh CMOS với khoảng 5 triệu điểm ảnh ở phía sau và cảm biến hình ảnh CMOS với khoảng 2 triệu điểm ảnh ở phía trước.

Về phương thức liên lạc, phiên bản LTE hỗ trợ hệ thống LTE / W-CDMA / CDMA2000 / GSM, và phiên bản Wi-Fi không hỗ trợ mạng di động.

Có thể sử dụng Bluetooth 5.1 và mạng LAN không dây IEEE 802.11a / b / g / n / ac (2.4GHz / 5GHz).

Dung lượng bộ nhớ hệ thống là 4GB và dung lượng lưu trữ trong là 64GB hoặc 128GB.

Nó cũng hỗ trợ việc sử dụng bộ nhớ ngoài.

Viên pin được tích hợp bên trong có dung lượng 5100mAh.

Cổng sạc sử dụng USB Type-C, không yêu cầu phân biệt giữa mặt trước và mặt sau.

Bạn có thể chọn từ hai biến thể màu sắc.

Nó đã được quyết định bán nó ở Trung Quốc và phiên bản Wi-Fi sẽ được phát hành đầu tiên, sau đó phiên bản LTE sẽ được phát hành.

Giá là 1.599 RMB (khoảng 27.000 yên) cho phiên bản LTE với dung lượng lưu trữ trong 64 GB, 1.899 RMB (khoảng 32.000 yên) cho mô hình 128 GB và 1.399 RMB (khoảng 32.000 yên) cho phiên bản Wi-Fi 64 GB. mô hình Mô hình 128GB có giá 1.699 RMB (khoảng 28.000 yên).

Đây là chiếc máy tính bảng đầu tiên được Honor Device công bố sau khi tiếp quản mảng kinh doanh thiết bị đầu cuối di động thương hiệu HONOR từ Huawei Technologies của Trung Quốc.', N'Blog_04.jpg                   ', N'Giang Sơn', N'Thiết bị Honor công bố máy tính bảng đầu tiên HONOR Pad 7. Thiết bị danh dự của Trung Quốc đã công bố thiết bị đầu cuối LTE / W-CDMA / CDMA2000 / GSM "HONOR Pad 7".                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
GO
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (1, N'Điện thoại', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (2, N'Máy tính', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (3, N'Máy tính bảng', 1)
INSERT [dbo].[Category] ([TypeID], [TypeName], [TypeStatus]) VALUES (4, N'Phụ kiện', 1)
GO
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (1, N'Ngọc Hà', N'Nhân viên văn phòng', N'"Mình đã từng mua điện thoại ở rất nhiều cửa hàng, nhưng chỉ có Smart Cellular mới chăm sóc khách hàng có tâm và tầm nhất".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (2, N'Hoàng Minh Tuấn', N'Giảng viên đại học quốc gia Hà Nội', N'"Sản phẩm chất lượng cao, chính sách ưu đãi vô cùng tốt".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (3, N'Ngô Văn Hoàng', N'Nhân viên ngân hàng', N'"Mẫu mã sản phẩm đa dạng, hiện đại, có nhiều lựa chọn cho khách hàng, tư vấn nhiệt tình, thân thiện"')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (4, N'Hoàng Lê Việt Anh', N'Kỹ sư công nghệ thông tin', N'"Sản phẩm chính hãng, chinh sách ưu đãi và bảo hành tốt, giá cả cạnh tranh. Chỉ một vấn đề nhỏ là giao hàng hơi lâu, nhưng nói chung vẫn rất tuyệt vời".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (5, N'Nguyễn Hà Anh', N'Chủ cửa hàng quần áo', N'"Công việc của mình phải sử dụng điện thoại thường xuyên nên rất cần một chiếc điện thoại cấu hình và bảo mật cao, dung lượng bộ nhớ tốt. Smart Cellular rất làm mình an tâm về việc mua sản phẩm tại đây".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (6, N'Hà Anh Tuấn', N'Nhân viên Marketing', N'"Chuyên viên tư vấn nhiệt tình, chu đáo, lại vô cùng dễ thương nữa. Lần đầu tiên mua hàng cảm thấy đáng đồng tiền".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (7, N'Lương Ngọc Quỳnh', N'Thợ chụp ảnh', N'"Mình đã đắn đo, tìm kiếm một chiếc điện thoại Iphone 12, vì trên thị trường giờ bán nhiều mà mình thì cũng không rành về điện thoại cho lắm, nhưng sau khi thấy sản phẩm của cửa hàng và các chính sách thì mình hoàn toàn tin tưởng Smart Cellular".')
INSERT [dbo].[Comment] ([CommentID], [NameUser], [Job], [CommentContent]) VALUES (8, N'Ngô Hoàng Long', N'Nhân viên lập trình', N'"Mình cũng được mấy người bạn giới thiệu qua cửa hàng, ban đầu thì vẫn còn hơi lưỡng lự nhưng sau khi sử dụng được một thời gian thì mình thấy vô cùng yên tâm".')
GO
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (1, 1, N'img_01_den.jpg', N'Màu đen')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (2, 1, N'img_01_trang.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (3, 1, N'img_01_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (4, 2, N'img_02_vang.jpg', N'Màu vàng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (5, 2, N'img_02_trang_.jpg', N'Màu trắng')
INSERT [dbo].[Image] ([colorID], [productID], [image], [color]) VALUES (6, 2, N'img_02_den.jpg', N'Màu đen')
GO
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (1, N'Credit')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (2, N'Cash')
INSERT [dbo].[PaymentType] ([paymentTypeID], [paymentTypeName]) VALUES (3, N'Paypal')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (2, N'Samsung Galaxy A12', N'4290000             ', N'3600000             ', N'Điện thoại Samsung Galaxy A12 – Smartphone giá rẻ cấu hình tốt và pin trâu Samsung A12 là một chiếc smartphone giá rẻ nhưng sở hữu cấu hình ổn định cùng với viên pin 5000mAh cho thời lượng suốt ngày dài. Bên cạnh đó điện thoại cũng sở hữu thiết kế thời trang và phù hợp với xu hướng.', N'product_01.jpg                ', N'Thiết kế đơn giản, 4 phiên bản màu, vân tay cạnh bên
Galaxy A12 có thiết kế đơn giản với bốn góc cạnh được bo tròn mềm mại cùng với hai cạnh bên được vát cong nhẹ nhàng tạo cảm giác cầm thoải mái cho người dùng.

Bên cạnh đó smartphone còn được cho ra mắt với nhiều phiên bản màu Đen, Trắng, Xanh thời trang để bạn có thể lựa chọn màu sắc yêu thích.

Thiết kế đơn giản, 4 phiên bản màu và cảm biến vân tay tích hợp ở mặt lưng

Samsung A12 mặc dù có thiết kế nguyên khối và chỉ sử dụng chất liệu nhựa nhưng lại được hoàn thiện vô cùng tỉ mỉ và chính xác nên vẫn mang đến cảm giác cao cấp khi chạm. Máy được hỗ trợ vân tay cạnh bên giúp người dùng mở khóa điện thoại nhanh chóng.

Màn hình giọt nước  6.5 inch và tấm nền TFT LCD tái tạo màu tốt
Mặc dù là smartphone giá rẻ nhưng Galaxy A12 vẫn sở hữu thiết kế màn hình bắt kịp với xu hướng với màn hình giọt nước và được bo tròn theo kiểu dáng của smartphone. Màn hình 6.5 inch tràn viền cho người dùng góc nhìn rộng, thoải mái tận hưởng không gian hiển thị.

Màn hình đục lỗ 6.4 inch và tấm nền TFT LCD tái tạo màu tốt

Sử dụng tấm nền TFT LCD thay vì các loại màn hình LCD thông thường mang đến khả năng tái tạo màu tốt hơn, cho hình ảnh hiển thị có màu sắc chân thực và sống động.

Smartphone còn có độ phân giải HD+ mặc dù chưa thực sự quá xuất sắc nhưng trên một thiết bị giá rẻ thì màn hình A12 đã đạt chất lượng rất tốt.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productPrice], [productSale], [productInfor], [productImage], [productIntroduce], [TypeID], [Status]) VALUES (3, N'Samsung Galaxy A12', N'4290000             ', N'3600000             ', N'Điện thoại Samsung Galaxy A12 – Smartphone giá rẻ cấu hình tốt và pin trâu Samsung A12 là một chiếc smartphone giá rẻ nhưng sở hữu cấu hình ổn định cùng với viên pin 5000mAh cho thời lượng suốt ngày dài. Bên cạnh đó điện thoại cũng sở hữu thiết kế thời trang và phù hợp với xu hướng.', N'product_01.jpg                ', N'Thiết kế đơn giản, 4 phiên bản màu, vân tay cạnh bên
Galaxy A12 có thiết kế đơn giản với bốn góc cạnh được bo tròn mềm mại cùng với hai cạnh bên được vát cong nhẹ nhàng tạo cảm giác cầm thoải mái cho người dùng.

Bên cạnh đó smartphone còn được cho ra mắt với nhiều phiên bản màu Đen, Trắng, Xanh thời trang để bạn có thể lựa chọn màu sắc yêu thích.

Thiết kế đơn giản, 4 phiên bản màu và cảm biến vân tay tích hợp ở mặt lưng

Samsung A12 mặc dù có thiết kế nguyên khối và chỉ sử dụng chất liệu nhựa nhưng lại được hoàn thiện vô cùng tỉ mỉ và chính xác nên vẫn mang đến cảm giác cao cấp khi chạm. Máy được hỗ trợ vân tay cạnh bên giúp người dùng mở khóa điện thoại nhanh chóng.

Màn hình giọt nước  6.5 inch và tấm nền TFT LCD tái tạo màu tốt
Mặc dù là smartphone giá rẻ nhưng Galaxy A12 vẫn sở hữu thiết kế màn hình bắt kịp với xu hướng với màn hình giọt nước và được bo tròn theo kiểu dáng của smartphone. Màn hình 6.5 inch tràn viền cho người dùng góc nhìn rộng, thoải mái tận hưởng không gian hiển thị.

Màn hình đục lỗ 6.4 inch và tấm nền TFT LCD tái tạo màu tốt

Sử dụng tấm nền TFT LCD thay vì các loại màn hình LCD thông thường mang đến khả năng tái tạo màu tốt hơn, cho hình ảnh hiển thị có màu sắc chân thực và sống động.

Smartphone còn có độ phân giải HD+ mặc dù chưa thực sự quá xuất sắc nhưng trên một thiết bị giá rẻ thì màn hình A12 đã đạt chất lượng rất tốt.', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (0, N'admin', N'202cb962ac59075b964b07152d234b70                  ', N'admin@gmail.com               ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (1, N'long', N'202cb962ac59075b964b07152d234b70                  ', N'long@gmail.com                ')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email]) VALUES (2, N'abc', N'202cb962ac59075b964b07152d234b70                  ', N'abc@gmail.com                 ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [BTL] SET  READ_WRITE 
GO
