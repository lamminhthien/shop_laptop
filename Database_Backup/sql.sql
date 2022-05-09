CREATE DATABASE shop_laptop
USE shop_laptop

CREATE TABLE AnhSanPham(
	ma_anh int IDENTITY(1,1),
	ma_san_pham VARCHAR(20) NOT NULL,
	file_anh nchar(20) NOT NULL UNIQUE,
) 
ALTER TABLE AnhSanPham ADD UNIQUE (file_anh)

CREATE TABLE BienDongGia(
	ma_san_pham VARCHAR(20) NOT NULL,
	gia_nhap bigint NOT NULL,
	lan_thay_doi_gia int NOT NULL,
	thoi_gian datetime NOT NULL,
)


CREATE TABLE BinhLuanSanPham(
	ma_binh_luan int IDENTITY(1,1),
	ma_khach_hang VARCHAR(20) NOT NULL,
	ma_san_pham VARCHAR(20) NOT NULL,
	noi_dung nvarchar(60) NOT NULL,
	
)

CREATE TABLE ChiTietHoaDon(
	ma_chi_tiet_hoa_don int IDENTITY(1,1),
	ma_hoa_don VARCHAR(20) NOT NULL,
	ma_san_pham VARCHAR(20) NOT NULL,
	so_luong int NOT NULL,
	don_gia bigint NOT NULL,
	
)

CREATE TABLE ChiTietSanPham(
	ma_san_pham VARCHAR(20) NOT NULL,
	cpu nvarchar(20) NULL,
	card_do_hoa nvarchar(20) NULL,
	pin int NULL,
	o_cung int NULL,
	he_dieu_hanh nvarchar(20) NULL,
	thiet_ke nvarchar(50) NULL,
	kich_thuoc int NULL,
	trong_luong int NULL,
	mo_ta_them nvarchar(30) NULL,
)
ALTER TABLE ChiTietSanPham ADD UNIQUE (ma_san_pham)


CREATE TABLE GioHang(
	ma_khach_hang VARCHAR(20) NOT NULL,
	ma_san_pham VARCHAR(20) NOT NULL,
	so_luong int NOT NULL,
	
)
ALTER TABLE GioHang ADD UNIQUE (ma_khach_hang)


CREATE TABLE HangSanXuat(
	ma_hang_sx int IDENTITY(1,1),
	ten_hang_sx nvarchar(51) NOT NULL,
	logo nchar(20) NOT NULL,
	
)
ALTER TABLE HangSanXuat ADD UNIQUE (ten_hang_sx)
ALTER TABLE HangSanXuat ADD UNIQUE (logo)

CREATE TABLE HoaDon(
	ma_hoa_don int IDENTITY(1,1),
	ma_khach_hang VARCHAR(20) NOT NULL,
	ngay_chot_don datetime NOT NULL,
	tinh_trang_giao_hang int NOT NULL,
	tong_tien bigint NOT NULL,
	ma_nhan_vien VARCHAR(20) NOT NULL,
	
) 

CREATE TABLE KhachHang(
	ma_khach_hang int IDENTITY(1,1),
	ho_ten nvarchar(50) NOT NULL UNIQUE,
	dia_chi nvarchar(50) NOT NULL,
	so_dien_thoai nchar(10) NOT NULL UNIQUE,
	gioi_tinh bit NOT NULL,
	username nchar(10) NOT NULL UNIQUE,
	password nchar(10) NOT NULL,
	email nchar(20) NOT NULL UNIQUE,
	
) 
ALTER TABLE KhachHang ADD UNIQUE (ho_ten,so_dien_thoai,username,email)

CREATE TABLE LoaiSanPham(
	ma_loai_sp int IDENTITY(1,1),
	ten_loai_sp nvarchar(50) NOT NULL UNIQUE,
	anh_minh_hoa nchar(20) NOT NULL UNIQUE,
	
)
ALTER TABLE LoaiSanPham ADD UNIQUE (ten_loai_sp,anh_minh_hoa)


CREATE TABLE NhanVien(
	ma_nhan_vien int IDENTITY(1,1),
	ten_nhan_vien nvarchar(50) NOT NULL UNIQUE,
	username nchar(10) NOT NULL UNIQUE,
	password nchar(10) NOT NULL,
	so_dien_thoai nchar(10) NOT NULL UNIQUE,
	
)
ALTER TABLE NhanVien ADD UNIQUE (ten_nhan_vien,username,so_dien_thoai)

CREATE TABLE PhanHoiBinhLuanSP(
	ma_phan_hoi int IDENTITY(1,1),
	ma_binh_luan VARCHAR(20) NOT NULL,
	ma_nhan_vien VARCHAR(20) NOT NULL,
	noi_dung nvarchar(255) NOT NULL,
	
)


CREATE TABLE SanPham(
	ma_san_pham int IDENTITY(1,1),
	ten_san_pham nvarchar(50) NOT NULL UNIQUE,
	ma_loai_sp VARCHAR(20) NOT NULL,
	ma_hang_sx VARCHAR(20) NOT NULL,
	trang_thai_sp int NOT NULL,
	gia bigint NOT NULL,
	
)
ALTER TABLE SanPham ADD UNIQUE (ten_san_pham)

<!-- Add Primary Key -->
ALTER TABLE SanPham ADD PRIMARY KEY (ma_san_pham);
ALTER TABLE PhanHoiBinhLuanSP ADD PRIMARY KEY (ma_phan_hoi);
ALTER TABLE NhanVien ADD PRIMARY KEY (ma_nhan_vien);
ALTER TABLE LoaiSanPham ADD PRIMARY KEY (ma_loai_sp);
ALTER TABLE KhachHang ADD PRIMARY KEY (ma_khach_hang);
ALTER TABLE HoaDon ADD PRIMARY KEY (ma_hoa_don);
ALTER TABLE HangSanXuat ADD PRIMARY KEY (ma_hang_sx);
ALTER TABLE ChiTietHoaDon ADD PRIMARY KEY (ma_chi_tiet_hoa_don);
ALTER TABLE BinhLuanSanPham ADD PRIMARY KEY (ma_binh_luan);
ALTER TABLE AnhSanPham ADD PRIMARY KEY (ma_anh);




<!-- Add Foreign key -->
ALTER TABLE AnhSanPham ADD CONSTRAINT FK_AnhSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE BienDongGia  WITH CHECK ADD  CONSTRAINT FK_BienDongGia_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE BinhLuanSanPham  WITH CHECK ADD  CONSTRAINT FK_BinhLuanSanPham_KhachHang FOREIGN KEY(ma_khach_hang)
REFERENCES KhachHang (ma_khach_hang)

ALTER TABLE BinhLuanSanPham  WITH CHECK ADD  CONSTRAINT FK_BinhLuanSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE ChiTietHoaDon  WITH CHECK ADD  CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY(ma_hoa_don)
REFERENCES HoaDon (ma_hoa_don)

ALTER TABLE ChiTietHoaDon  WITH CHECK ADD  CONSTRAINT FK_ChiTietHoaDon_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE ChiTietSanPham  WITH CHECK ADD  CONSTRAINT FK_ChiTietSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE GioHang  WITH CHECK ADD  CONSTRAINT FK_GioHang_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(ma_khach_hang)
REFERENCES KhachHang (ma_khach_hang)

ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(ma_nhan_vien)
REFERENCES NhanVien (ma_nhan_vien)

ALTER TABLE PhanHoiBinhLuanSP  WITH CHECK ADD  CONSTRAINT FK_PhanHoiBinhLuanSP_BinhLuanSanPham FOREIGN KEY(ma_binh_luan)
REFERENCES BinhLuanSanPham (ma_binh_luan)

ALTER TABLE PhanHoiBinhLuanSP  WITH CHECK ADD  CONSTRAINT FK_PhanHoiBinhLuanSP_NhanVien FOREIGN KEY(ma_nhan_vien)
REFERENCES NhanVien (ma_nhan_vien)

ALTER TABLE SanPham  WITH CHECK ADD  CONSTRAINT FK_SanPham_HangSanXuat FOREIGN KEY(ma_hang_sx)
REFERENCES HangSanXuat (ma_hang_sx)

ALTER TABLE SanPham  WITH CHECK ADD  CONSTRAINT FK_SanPham_LoaiSanPham FOREIGN KEY(ma_loai_sp)
REFERENCES LoaiSanPham (ma_loai_sp)


