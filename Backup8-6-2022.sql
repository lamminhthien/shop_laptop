-- DROP SCHEMA dbo;
CREATE DATABASE shop_laptop;
USE shop_laptop;

-- shop_laptop.dbo.HangSanXuat definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.HangSanXuat;

CREATE TABLE shop_laptop.dbo.HangSanXuat (
	ma_hang_sx int IDENTITY(1,1) NOT NULL,
	ten_hang_sx nvarchar(51) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	logo nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__HangSanX__44ECD7A2B5969013 PRIMARY KEY (ma_hang_sx),
	CONSTRAINT UQ__HangSanX__26EDDD50177D9D99 UNIQUE (ten_hang_sx),
	CONSTRAINT UQ__HangSanX__26EDDD5080E8DF10 UNIQUE (ten_hang_sx),
	CONSTRAINT UQ__HangSanX__26EDDD5092E6BD6F UNIQUE (ten_hang_sx),
	CONSTRAINT UQ__HangSanX__A3C7455040CFDF1D UNIQUE (logo),
	CONSTRAINT UQ__HangSanX__A3C745506F171985 UNIQUE (logo),
	CONSTRAINT UQ__HangSanX__A3C74550AF1B14A7 UNIQUE (logo)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__26EDDD50177D9D99 ON shop_laptop.dbo.HangSanXuat (ten_hang_sx);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__26EDDD5080E8DF10 ON shop_laptop.dbo.HangSanXuat (ten_hang_sx);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__26EDDD5092E6BD6F ON shop_laptop.dbo.HangSanXuat (ten_hang_sx);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__A3C7455040CFDF1D ON shop_laptop.dbo.HangSanXuat (logo);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__A3C745506F171985 ON shop_laptop.dbo.HangSanXuat (logo);
CREATE UNIQUE NONCLUSTERED INDEX UQ__HangSanX__A3C74550AF1B14A7 ON shop_laptop.dbo.HangSanXuat (logo);


-- shop_laptop.dbo.KhachHang definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.KhachHang;

CREATE TABLE shop_laptop.dbo.KhachHang (
	ma_khach_hang int IDENTITY(1,1) NOT NULL,
	ho_ten nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dia_chi nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	so_dien_thoai nchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	gioi_tinh bit NOT NULL,
	username nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__KhachHan__C9817AF6341ED6CB PRIMARY KEY (ma_khach_hang),
	CONSTRAINT UQ__KhachHan__35968CB6E00EE187 UNIQUE (username,email,ho_ten,so_dien_thoai),
	CONSTRAINT [Unique Information] UNIQUE (ho_ten,dia_chi,so_dien_thoai,username,email),
	CONSTRAINT UniqueEmail UNIQUE (email),
	CONSTRAINT UniqueHo_ten UNIQUE (ho_ten),
	CONSTRAINT UniqueSoDienThoai UNIQUE (so_dien_thoai),
	CONSTRAINT UniqueUsername UNIQUE (username)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__KhachHan__35968CB6E00EE187 ON shop_laptop.dbo.KhachHang (username, email, ho_ten, so_dien_thoai);
CREATE UNIQUE NONCLUSTERED INDEX Unique Information ON shop_laptop.dbo.KhachHang (ho_ten, dia_chi, so_dien_thoai, username, email);
CREATE UNIQUE NONCLUSTERED INDEX UniqueEmail ON shop_laptop.dbo.KhachHang (email);
CREATE UNIQUE NONCLUSTERED INDEX UniqueHo_ten ON shop_laptop.dbo.KhachHang (ho_ten);
CREATE UNIQUE NONCLUSTERED INDEX UniqueSoDienThoai ON shop_laptop.dbo.KhachHang (so_dien_thoai);
CREATE UNIQUE NONCLUSTERED INDEX UniqueUsername ON shop_laptop.dbo.KhachHang (username);


-- shop_laptop.dbo.LoaiSanPham definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.LoaiSanPham;

CREATE TABLE shop_laptop.dbo.LoaiSanPham (
	ma_loai_sp int IDENTITY(1,1) NOT NULL,
	ten_loai_sp nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	anh_minh_hoa nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__LoaiSanP__1E1E581AE2366A70 PRIMARY KEY (ma_loai_sp),
	CONSTRAINT UQ__LoaiSanP__63C2C7EEB5142B17 UNIQUE (ten_loai_sp,anh_minh_hoa),
	CONSTRAINT UQ__LoaiSanP__FF5577F45E58F7B8 UNIQUE (ten_loai_sp)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__LoaiSanP__63C2C7EEB5142B17 ON shop_laptop.dbo.LoaiSanPham (ten_loai_sp, anh_minh_hoa);
CREATE UNIQUE NONCLUSTERED INDEX UQ__LoaiSanP__FF5577F45E58F7B8 ON shop_laptop.dbo.LoaiSanPham (ten_loai_sp);


-- shop_laptop.dbo.NhanVien definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.NhanVien;

CREATE TABLE shop_laptop.dbo.NhanVien (
	ma_nhan_vien int IDENTITY(1,1) NOT NULL,
	ten_nhan_vien nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	username nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	so_dien_thoai nchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__NhanVien__6781B7B9CFD71863 PRIMARY KEY (ma_nhan_vien),
	CONSTRAINT UQ__NhanVien__CC182619188FB46B UNIQUE (ten_nhan_vien,username,so_dien_thoai),
	CONSTRAINT UQ__NhanVien__CC182619FFFBE165 UNIQUE (ten_nhan_vien,username,so_dien_thoai)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__NhanVien__CC182619188FB46B ON shop_laptop.dbo.NhanVien (ten_nhan_vien, username, so_dien_thoai);
CREATE UNIQUE NONCLUSTERED INDEX UQ__NhanVien__CC182619FFFBE165 ON shop_laptop.dbo.NhanVien (ten_nhan_vien, username, so_dien_thoai);


-- shop_laptop.dbo.HoaDon definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.HoaDon;

CREATE TABLE shop_laptop.dbo.HoaDon (
	ma_hoa_don int IDENTITY(1,1) NOT NULL,
	ma_khach_hang int NOT NULL,
	ngay_chot_don datetime NULL,
	tinh_trang_giao_hang int NOT NULL,
	tong_tien bigint NOT NULL,
	ma_nhan_vien int NOT NULL,
	trang_thai bit NOT NULL,
	CONSTRAINT PK__HoaDon__DBE2D9E3C547A2C2 PRIMARY KEY (ma_hoa_don),
	CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (ma_khach_hang) REFERENCES shop_laptop.dbo.KhachHang(ma_khach_hang),
	CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (ma_nhan_vien) REFERENCES shop_laptop.dbo.NhanVien(ma_nhan_vien)
);


-- shop_laptop.dbo.SanPham definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.SanPham;

CREATE TABLE shop_laptop.dbo.SanPham (
	ma_san_pham int IDENTITY(1,1) NOT NULL,
	ten_san_pham nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ma_loai_sp int NOT NULL,
	ma_hang_sx int NOT NULL,
	trang_thai_sp int NOT NULL,
	CONSTRAINT PK__SanPham__9D25990C847C7047 PRIMARY KEY (ma_san_pham),
	CONSTRAINT UQ__SanPham__BA66C031EDFC9119 UNIQUE (ten_san_pham),
	CONSTRAINT FK_SanPham_HangSanXuat FOREIGN KEY (ma_hang_sx) REFERENCES shop_laptop.dbo.HangSanXuat(ma_hang_sx),
	CONSTRAINT FK_SanPham_LoaiSanPham FOREIGN KEY (ma_loai_sp) REFERENCES shop_laptop.dbo.LoaiSanPham(ma_loai_sp)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__SanPham__BA66C031EDFC9119 ON shop_laptop.dbo.SanPham (ten_san_pham);


-- shop_laptop.dbo.AnhSanPham definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.AnhSanPham;

CREATE TABLE shop_laptop.dbo.AnhSanPham (
	ma_anh int IDENTITY(1,1) NOT NULL,
	ma_san_pham int NOT NULL,
	file_anh nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__AnhSanPh__06C6A4630B7103A0 PRIMARY KEY (ma_anh),
	CONSTRAINT FK_AnhSanPham_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham) ON DELETE CASCADE
);


-- shop_laptop.dbo.BienDongGia definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.BienDongGia;

CREATE TABLE shop_laptop.dbo.BienDongGia (
	ma_bien_dong int IDENTITY(1,1) NOT NULL,
	ma_san_pham int NOT NULL,
	gia_nhap bigint NOT NULL,
	lan_thay_doi_gia int NOT NULL,
	thoi_gian date NOT NULL,
	chiet_khau float NOT NULL,
	CONSTRAINT PK_BienDongGia PRIMARY KEY (ma_bien_dong),
	CONSTRAINT FK_BienDongGia_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE shop_laptop.dbo.BienDongGia WITH NOCHECK ADD CONSTRAINT CK_chiet_khau CHECK ([chiet_khau]>(0));
ALTER TABLE shop_laptop.dbo.BienDongGia WITH NOCHECK ADD CONSTRAINT CK_gia_nhap CHECK ([gia_nhap]>=(100000));
ALTER TABLE shop_laptop.dbo.BienDongGia WITH NOCHECK ADD CONSTRAINT CK_lan_thay_doi_gia CHECK ([lan_thay_doi_gia]>(0));


-- shop_laptop.dbo.BinhLuanSanPham definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.BinhLuanSanPham;

CREATE TABLE shop_laptop.dbo.BinhLuanSanPham (
	ma_binh_luan int IDENTITY(1,1) NOT NULL,
	ma_khach_hang int NOT NULL,
	ma_san_pham int NOT NULL,
	noi_dung nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	trang_thai bit DEFAULT 0 NOT NULL,
	CONSTRAINT PK__BinhLuan__300DD2D85FA64E47 PRIMARY KEY (ma_binh_luan),
	CONSTRAINT FK_BinhLuanSanPham_KhachHang FOREIGN KEY (ma_khach_hang) REFERENCES shop_laptop.dbo.KhachHang(ma_khach_hang),
	CONSTRAINT FK_BinhLuanSanPham_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham)
);


-- shop_laptop.dbo.ChiTietHoaDon definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.ChiTietHoaDon;

CREATE TABLE shop_laptop.dbo.ChiTietHoaDon (
	ma_chi_tiet_hoa_don int IDENTITY(1,1) NOT NULL,
	ma_hoa_don int NOT NULL,
	ma_san_pham int NOT NULL,
	so_luong int NOT NULL,
	don_gia bigint NOT NULL,
	CONSTRAINT PK__ChiTietH__051D20008926D693 PRIMARY KEY (ma_chi_tiet_hoa_don),
	CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY (ma_hoa_don) REFERENCES shop_laptop.dbo.HoaDon(ma_hoa_don),
	CONSTRAINT FK_ChiTietHoaDon_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham)
);


-- shop_laptop.dbo.ChiTietSanPham definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.ChiTietSanPham;

CREATE TABLE shop_laptop.dbo.ChiTietSanPham (
	ma_san_pham int NOT NULL,
	cpu nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	card_do_hoa nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	do_phan_giai nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	o_cung int NULL,
	he_dieu_hanh nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	man_hinh float NULL,
	kich_thuoc nchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	trong_luong float NOT NULL,
	mo_ta_them text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ram int NULL,
	so_luong int NOT NULL,
	CONSTRAINT PK_ChiTietSanPham PRIMARY KEY (ma_san_pham),
	CONSTRAINT UQ__ChiTietS__9D25990DDADFB156 UNIQUE (ma_san_pham),
	CONSTRAINT FK_ChiTietSanPham_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__ChiTietS__9D25990DDADFB156 ON shop_laptop.dbo.ChiTietSanPham (ma_san_pham);


-- shop_laptop.dbo.GioHang definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.GioHang;

CREATE TABLE shop_laptop.dbo.GioHang (
	ma_khach_hang int NOT NULL,
	ma_san_pham int NOT NULL,
	so_luong int NOT NULL,
	CONSTRAINT FK_GioHang_KhachHang FOREIGN KEY (ma_khach_hang) REFERENCES shop_laptop.dbo.KhachHang(ma_khach_hang),
	CONSTRAINT FK_GioHang_SanPham FOREIGN KEY (ma_san_pham) REFERENCES shop_laptop.dbo.SanPham(ma_san_pham)
);


-- shop_laptop.dbo.PhanHoiBinhLuanSP definition

-- Drop table

-- DROP TABLE shop_laptop.dbo.PhanHoiBinhLuanSP;

CREATE TABLE shop_laptop.dbo.PhanHoiBinhLuanSP (
	ma_phan_hoi int IDENTITY(1,1) NOT NULL,
	ma_binh_luan int NOT NULL,
	ma_nhan_vien int NOT NULL,
	noi_dung nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__PhanHoiB__36D78DA93574E074 PRIMARY KEY (ma_phan_hoi),
	CONSTRAINT FK_PhanHoiBinhLuanSP_BinhLuanSanPham FOREIGN KEY (ma_binh_luan) REFERENCES shop_laptop.dbo.BinhLuanSanPham(ma_binh_luan),
	CONSTRAINT FK_PhanHoiBinhLuanSP_NhanVien FOREIGN KEY (ma_nhan_vien) REFERENCES shop_laptop.dbo.NhanVien(ma_nhan_vien)
);

