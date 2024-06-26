USE [master]
GO
/****** Object:  Database [QuanAo]    Script Date: 5/8/2024 2:13:10 PM ******/
CREATE DATABASE [QuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanAo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanAo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanAo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanAo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanAo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [QuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanAo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanAo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanAo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanAo] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanAo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanAo]
GO
/****** Object:  Table [dbo].[LoaiQuanAo]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuanAo](
	[MaTheLoai] [nvarchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaQuanAo] [nvarchar](10) NOT NULL,
	[SLBan] [int] NULL,
	[KhuyenMai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaQuanAo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[MaKH] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhanVien]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tQuanAo]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tQuanAo](
	[MaQuanAo] [nvarchar](10) NOT NULL,
	[TenQuanAo] [nvarchar](200) NULL,
	[MaTheLoai] [nvarchar](10) NULL,
	[MaTH] [nvarchar](10) NULL,
	[DonGiaNhap] [money] NULL,
	[DonGiaBan] [money] NULL,
	[SoLuong] [int] NULL,
	[ChatLieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_tQuanAo] PRIMARY KEY CLUSTERED 
(
	[MaQuanAo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tThuongHieu]    Script Date: 5/8/2024 2:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tThuongHieu](
	[MaTH] [nvarchar](10) NOT NULL,
	[TenTH] [nvarchar](100) NULL,
 CONSTRAINT [PK_tNhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL001', N'Áo sơ mi')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL002', N'Áo thun')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL003', N'Áo khoác')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL004', N'Áo short')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL005', N'Quần đùi')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL006', N'Quần Jean')
INSERT [dbo].[LoaiQuanAo] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL7', N'Quần Kaki')
GO
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S01', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S02', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S04', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'S04', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S06', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S08', 11, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S03', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S10', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S12', 3, N'')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S07', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S08', 14, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S02', 13, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S05', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S10', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S11', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S01', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S06', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S08', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S01', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S06', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S07', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S06', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S09', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S11', 3, N'')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S07', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S11', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S13', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S08', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S11', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S09', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S12', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'S06', 23, N'')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaQuanAo], [SLBan], [KhuyenMai]) VALUES (N'HDB15', N'S01', 2, N'')
GO
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB01', N'NV01', CAST(N'2014-08-11T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB02', N'NV02', CAST(N'2014-05-03T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB03', N'NV03', CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB04', N'NV04', CAST(N'2013-11-12T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB05', N'NV04', CAST(N'2014-05-14T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB06', N'NV05', CAST(N'2014-06-30T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB07', N'NV06', CAST(N'2014-05-10T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB08', N'NV01', CAST(N'2013-01-01T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB09', N'NV01', CAST(N'2013-02-10T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB10', N'NV02', CAST(N'2014-04-10T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB11', N'NV03', CAST(N'2014-03-11T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB12', N'NV03', CAST(N'2014-07-10T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB13', N'NV05', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB14', N'NV01', CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB15', N'NV04', CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB16', N'NV04', CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'KH03')
GO
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH01', N'Hồ Văn Minh Nhật', N'Hà Tĩnh', N'0968686868')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH013', N'Kiên', N'Hưng Yên', N'095094332')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH02', N'Nguyễn Công Hiếu', N'Bắc Ninh', N'0918273645')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH03', N'Phạm Duy Trưởng', N'Đà Nẵng', N'0918688685')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH04', N'Nguyễn Tiến', N'Hưng Yên', N'0978656790')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH05', N'Test', N'HN', N'0923422348')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH06', N'Test', N'HN', N'0923422348')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH10', N'Minh', N'NS', N'0092938293')
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH12', N'Bình', N'YTR', N'2312412312312')
GO
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV01', N'Duy Minh', N'Nam', CAST(N'2003-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV02', N'Hồ Nhật', N'Nam', CAST(N'2003-01-12T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'0979657676')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV03', N'Hải Dương', N'Nam', CAST(N'2003-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV04', N'Phan Cao', N'Nam', CAST(N'2003-08-12T00:00:00.000' AS DateTime), N'Ninh Bình', N'0985143235')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV05', N'Bùi Ngọc', N'Nữ', CAST(N'2003-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'0918167892')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV06', N'Nguyễn Hoàng', N'Nữ', CAST(N'2003-04-04T00:00:00.000' AS DateTime), N'Nam Định', N'0962091660')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV07', N'Nguyễn Hải', N'Nam', CAST(N'2003-05-05T00:00:00.000' AS DateTime), N'Hà Nội', N'0962091666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV08', N'Đỗ Thảo', N'Nữ', CAST(N'2003-06-06T00:00:00.000' AS DateTime), N'Hà Nội', N'0962099666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV09', N'Đỗ Thảo Phương', N'Nữ', CAST(N'2003-07-07T00:00:00.000' AS DateTime), N'Hà Nội', N'0966666666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV10', N'Đỗ Huy Long', N'Nam', CAST(N'2003-08-08T00:00:00.000' AS DateTime), N'Nam Định', N'0983646585')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV14', N'Phương', N'Nữ', CAST(N'2003-06-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'034324872849')
GO
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S01', N'Áo Sơ Mi Jean Unisex 100% Cotton Trơn Form Loose', N'TL01', N'TH01', 100000.0000, 108000.0000, 120, N'100% Cotton')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S02', N'Áo Sơ Mi Nam Tay Ngắn Cuban Shirt Trơn Form Boxy', N'TL01', N'TH01', 100000.0000, 120000.0000, 120, N'100% Cotton')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S03', N'Áo Sơ Mi Nam Tay Dài Trơn Wool Like Form Oversize', N'TL01', N'TH01', 100000.0000, 108000.0000, 120, N'100% Cotton')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S04', N'Áo Sơ Mi Nam Tay Dài Flannel Kẻ Caro Thêu Chữ Form Loose', N'TL03', N'TH03', 140000.0000, 160000.0000, 60, N'Flannel')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S05', N'Quần Jean Nam Ống Ôm Xanh Trơn Form Slim', N'TL05', N'TH01', 160000.0000, 190000.0000, 32, N' Cotton Spandex')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S06', N'Test', N'TL02', N'TH02', 160000.0000, 180000.0000, 50, N'100% Cotton')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S07', N'Quần Jean Nam Trơn Ống Ôm Kiểu Basic Form Slim', N'TL06', N'TH02', 250000.0000, 300000.0000, 32, N' Jeans')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S08', N'Quần Tây Nam Ống Rộng Premium Melange Limited Form Loose', N'TL04', N'TH02', 500000.0000, 560000.0000, 56, N' Polyester')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S09', N'Quần Vải Nam Ống Rộng Gập Ly Trơn Form Relax', N'TL06', N'TH03', 430000.0000, 450000.0000, 100, N' Polyester')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S10', N'Quần Âu Nam Ống Ôm Xếp Ly Phối Lưng Thun Trơn Form Slim', N'TL07', N'TH02', 450000.0000, 480000.0000, 304, N' Polyester')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S11', N'Áo Khoác Jean Nam Tay Dài Xếp Ly Trơn Form Regular', N'TL02', N'TH03', 350000.0000, 400000.0000, 23, N' Denim')
INSERT [dbo].[tQuanAo] ([MaQuanAo], [TenQuanAo], [MaTheLoai], [MaTH], [DonGiaNhap], [DonGiaBan], [SoLuong], [ChatLieu]) VALUES (N'S12', N'Áo Khoác Jeans Nam Wash Mềm Gài Nút Trơn Form Loose', N'TL04', N'TH03', 450000.0000, 500000.0000, 32, N' Jeans')
GO
INSERT [dbo].[tThuongHieu] ([MaTH], [TenTH]) VALUES (N'TH01', N'Routine')
INSERT [dbo].[tThuongHieu] ([MaTH], [TenTH]) VALUES (N'TH02', N'Gucci')
INSERT [dbo].[tThuongHieu] ([MaTH], [TenTH]) VALUES (N'TH03', N'Channel')
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([SoHDB])
REFERENCES [dbo].[tHoaDonBan] ([SoHDB])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tNhanVien]
GO
ALTER TABLE [dbo].[tQuanAo]  WITH CHECK ADD  CONSTRAINT [FK_tQuanAo_tThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[tThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[tQuanAo] CHECK CONSTRAINT [FK_tQuanAo_tThuongHieu]
GO
USE [master]
GO
ALTER DATABASE [QuanAo] SET  READ_WRITE 
GO
