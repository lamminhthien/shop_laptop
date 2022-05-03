USE [shop_laptop]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 5/2/2022 10:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[ma_anh] [nchar](10) NOT NULL,
	[ma_san_pham] [nchar](10) NULL,
	[file_anh] [binary](50) NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[ma_anh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BienDongGia]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BienDongGia](
	[ma_san_pham] [nchar](10) NULL,
	[gia_nhap] [nchar](10) NULL,
	[lan_thay_doi_gia] [nchar](10) NULL,
	[thoi_gian] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuanSanPham]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanSanPham](
	[ma_binh_luan] [nchar](10) NOT NULL,
	[ma_khach_hang] [nchar](10) NULL,
	[ma_san_pham] [nchar](10) NULL,
	[noi_dung] [nchar](10) NULL,
 CONSTRAINT [PK_BinhLuanSanPham] PRIMARY KEY CLUSTERED 
(
	[ma_binh_luan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ma_chi_tiet_hoa_don] [nchar](10) NOT NULL,
	[ma_hoa_don] [nchar](10) NULL,
	[ma_san_pham] [nchar](10) NULL,
	[so_luong] [nchar](10) NULL,
	[don_gia] [nchar](10) NULL,
 CONSTRAINT [PK_dbo.ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ma_chi_tiet_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLapTop]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLapTop](
	[ma_san_pham] [nchar](10) NOT NULL,
	[cpu] [nchar](10) NULL,
	[card_do_hoa] [nchar](10) NULL,
	[pin] [nchar](10) NULL,
	[o_cung] [nchar](10) NULL,
	[he_dieu_hanh] [nchar](10) NULL,
	[thiet_ke] [nchar](10) NULL,
	[kich_thuoc] [nchar](10) NULL,
	[trong_luong] [nchar](10) NULL,
 CONSTRAINT [PK_ChiTietLapTop] PRIMARY KEY CLUSTERED 
(
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[ma_khach_hang] [nchar](10) NOT NULL,
	[ma_san_pham] [nchar](10) NULL,
	[so_luong] [nchar](10) NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[ma_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[ma_hang_sx] [nchar](10) NOT NULL,
	[ten_hang_sx] [nchar](10) NULL,
	[logo] [nchar](10) NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[ma_hang_sx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ma_hoa_don] [nchar](10) NOT NULL,
	[ma_khach_hang] [nchar](10) NULL,
	[ngay_chot_don] [nchar](10) NULL,
	[tinh_trang_giao_hang] [nchar](10) NULL,
	[tong_tien] [nchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ma_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ma_khach_hang] [nchar](10) NOT NULL,
	[ho_ten] [nchar](10) NULL,
	[dia_chi] [nchar](10) NULL,
	[so_dien_thoai] [nchar](10) NULL,
	[gioi_tinh] [nchar](10) NULL,
	[username] [nchar](10) NULL,
	[password] [nchar](10) NULL,
	[email] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ma_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[ma_loai_sp] [nchar](10) NOT NULL,
	[ten_loai_sp] [nchar](10) NULL,
	[anh_minh_hoa] [nchar](10) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[ma_loai_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ma_nhan_vien] [nchar](10) NOT NULL,
	[ten_nhan_vien] [nchar](10) NULL,
	[username] [nchar](10) NULL,
	[password] [nchar](10) NULL,
	[so_dien_thoai] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ma_nhan_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoiBinhLuanSP]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoiBinhLuanSP](
	[ma_phan_hoi] [nchar](10) NOT NULL,
	[ma_binh_luan] [nchar](10) NULL,
	[ma_nhan_vien] [nchar](10) NULL,
	[noi_dung] [nchar](10) NULL,
 CONSTRAINT [PK_PhanHoiBinhLuanSP] PRIMARY KEY CLUSTERED 
(
	[ma_phan_hoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuKien]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuKien](
	[ma_san_pham] [nchar](10) NOT NULL,
	[thong_so_ky_thuat] [nchar](10) NULL,
 CONSTRAINT [PK_PhuKien] PRIMARY KEY CLUSTERED 
(
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/2/2022 10:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ma_san_pham] [nchar](10) NOT NULL,
	[ten_san_pham] [nchar](10) NULL,
	[ma_loai_sp] [nchar](10) NULL,
	[ma_hang_sx] [nchar](10) NULL,
	[trang_thai_sp] [nchar](10) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_AnhSanPham_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK_AnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[BienDongGia]  WITH CHECK ADD  CONSTRAINT [FK_BienDongGia_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[BienDongGia] CHECK CONSTRAINT [FK_BienDongGia_SanPham]
GO
ALTER TABLE [dbo].[BinhLuanSanPham]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanSanPham_KhachHang] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([ma_khach_hang])
GO
ALTER TABLE [dbo].[BinhLuanSanPham] CHECK CONSTRAINT [FK_BinhLuanSanPham_KhachHang]
GO
ALTER TABLE [dbo].[BinhLuanSanPham]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanSanPham_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[BinhLuanSanPham] CHECK CONSTRAINT [FK_BinhLuanSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChiTietHoaDon_HoaDon] FOREIGN KEY([ma_hoa_don])
REFERENCES [dbo].[HoaDon] ([ma_hoa_don])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_dbo.ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChiTietHoaDon_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_dbo.ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietLapTop]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLapTop_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[ChiTietLapTop] CHECK CONSTRAINT [FK_ChiTietLapTop_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([ma_khach_hang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[PhanHoiBinhLuanSP]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoiBinhLuanSP_BinhLuanSanPham] FOREIGN KEY([ma_binh_luan])
REFERENCES [dbo].[BinhLuanSanPham] ([ma_binh_luan])
GO
ALTER TABLE [dbo].[PhanHoiBinhLuanSP] CHECK CONSTRAINT [FK_PhanHoiBinhLuanSP_BinhLuanSanPham]
GO
ALTER TABLE [dbo].[PhanHoiBinhLuanSP]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoiBinhLuanSP_NhanVien] FOREIGN KEY([ma_nhan_vien])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[PhanHoiBinhLuanSP] CHECK CONSTRAINT [FK_PhanHoiBinhLuanSP_NhanVien]
GO
ALTER TABLE [dbo].[PhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhuKien_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[PhuKien] CHECK CONSTRAINT [FK_PhuKien_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSanXuat] FOREIGN KEY([ma_hang_sx])
REFERENCES [dbo].[HangSanXuat] ([ma_hang_sx])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([ma_loai_sp])
REFERENCES [dbo].[LoaiSanPham] ([ma_loai_sp])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
