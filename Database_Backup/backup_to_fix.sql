CREATE DATABASE shop_laptop
USE shop_laptop

CREATE TABLE AnhSanPham(
	ma_anh int NOT NULL,
	ma_san_pham int NOT NULL UNIQUE,
	file_anh nchar(10) NOT NULL,
	PRIMARY KEY (ma_anh),
) 


CREATE TABLE BienDongGia(
	ma_san_pham int NOT NULL,
	gia_nhap bigint NOT NULL,
	lan_thay_doi_gia int NOT NULL,
	thoi_gian date NOT NULL,
)

CREATE TABLE BinhLuanSanPham(
	ma_binh_luan int IDENTITY(1,1) NOT NULL,
	ma_khach_hang int NOT NULL,
	ma_san_pham int NOT NULL,
	noi_dung nvarchar(50) NOT NULL,
)


CREATE TABLE ChiTietHoaDon(
	ma_chi_tiet_hoa_don int IDENTITY(1,1) NOT NULL,
	ma_hoa_don int NOT NULL,
	ma_san_pham int NOT NULL,
	so_luong int NOT NULL,
	don_gia bigint NOT NULL,
)

CREATE TABLE ChiTietSanPham(
	ma_san_pham int IDENTITY(1,1) NOT NULL,
	cpu nchar(10) NULL,
	card_do_hoa nchar(10) NULL,
	pin int NULL,
	o_cung int NULL,
	he_dieu_hanh nchar(10) NULL,
	thiet_ke nvarchar(50) NULL,
	kich_thuoc int NULL,
	trong_luong int NULL,
	mo_ta_them nchar(10) NULL,
)


CREATE TABLE GioHang(
	ma_khach_hang varbinary(50) NOT NULL,
	ma_san_pham int NOT NULL,
	so_luong int NOT NULL,
)



CREATE TABLE HangSanXuat(
	ma_hang_sx int IDENTITY(1,1) NOT NULL,
	ten_hang_sx nvarchar(51) NOT NULL,
	lo nchar(10) NOT NULL,
)

CREATE TABLE HoaDon(
	ma_hoa_don int IDENTITY(1,1) NOT NULL,
	ma_khach_hang int NOT NULL,
	ngay_chot_don date NOT NULL,
	tinh_trang_giao_hang int NOT NULL,
	tong_tien bigint NOT NULL,
	ma_nhan_vien int NOT NULL,
) 


CREATE TABLE KhachHang(
	ma_khach_hang int IDENTITY(1,1) NOT NULL,
	ho_ten nvarchar(50) NOT NULL,
	dia_chi nvarchar(50) NOT NULL,
	so_dien_thoai nchar(10) NOT NULL,
	gioi_tinh bit NOT NULL,
	username nchar(10) NOT NULL,
	password nchar(10) NOT NULL,
	email nchar(20) NOT NULL,
) 


CREATE TABLE LoaiSanPham(
	ma_loai_sp int IDENTITY(1,1) NOT NULL,
	ten_loai_sp nvarchar(50) NOT NULL,
	anh_minh_hoa nchar(10) NOT NULL,
)


CREATE TABLE NhanVien(
	ma_nhan_vien int IDENTITY(1,1) NOT NULL,
	ten_nhan_vien nvarchar(50) NOT NULL,
	username nchar(10) NOT NULL,
	password nchar(10) NOT NULL,
	so_dien_thoai nchar(10) NOT NULL,
) 


CREATE TABLE PhanHoiBinhLuanSP(
	ma_phan_hoi int IDENTITY(1,1) NOT NULL,
	ma_binh_luan int NOT NULL,
	ma_nhan_vien int NOT NULL,
	noi_dung nvarchar(255) NOT NULL,
)

CREATE TABLE SanPham(
	ma_san_pham int IDENTITY(1,1) NOT NULL,
	ten_san_pham nvarchar(50) NOT NULL,
	ma_loai_sp nchar(10) NOT NULL,
	ma_hang_sx int NOT NULL,
	trang_thai_sp nchar(10) NOT NULL,
	gia int NOT NULL,
)

ALTER TABLE AnhSanPham  WITH CHECK ADD  CONSTRAINT FK_AnhSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE AnhSanPham CHECK CONSTRAINT FK_AnhSanPham_SanPham

ALTER TABLE BienDongGia  WITH CHECK ADD  CONSTRAINT FK_BienDongGia_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE BienDongGia CHECK CONSTRAINT FK_BienDongGia_SanPham

ALTER TABLE BinhLuanSanPham  WITH CHECK ADD  CONSTRAINT FK_BinhLuanSanPham_KhachHang FOREIGN KEY(ma_khach_hang)
REFERENCES KhachHang (ma_khach_hang)

ALTER TABLE BinhLuanSanPham CHECK CONSTRAINT FK_BinhLuanSanPham_KhachHang

ALTER TABLE BinhLuanSanPham  WITH CHECK ADD  CONSTRAINT FK_BinhLuanSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE BinhLuanSanPham CHECK CONSTRAINT FK_BinhLuanSanPham_SanPham

ALTER TABLE ChiTietHoaDon  WITH CHECK ADD  CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY(ma_hoa_don)
REFERENCES HoaDon (ma_hoa_don)

ALTER TABLE ChiTietHoaDon CHECK CONSTRAINT FK_ChiTietHoaDon_HoaDon

ALTER TABLE ChiTietHoaDon  WITH CHECK ADD  CONSTRAINT FK_ChiTietHoaDon_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE ChiTietHoaDon CHECK CONSTRAINT FK_ChiTietHoaDon_SanPham

ALTER TABLE ChiTietSanPham  WITH CHECK ADD  CONSTRAINT FK_ChiTietSanPham_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE ChiTietSanPham CHECK CONSTRAINT FK_ChiTietSanPham_SanPham

ALTER TABLE GioHang  WITH CHECK ADD  CONSTRAINT FK_GioHang_SanPham FOREIGN KEY(ma_san_pham)
REFERENCES SanPham (ma_san_pham)

ALTER TABLE GioHang CHECK CONSTRAINT FK_GioHang_SanPham

ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(ma_khach_hang)
REFERENCES KhachHang (ma_khach_hang)

ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_KhachHang

ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(ma_nhan_vien)
REFERENCES NhanVien (ma_nhan_vien)

ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_NhanVien

ALTER TABLE PhanHoiBinhLuanSP  WITH CHECK ADD  CONSTRAINT FK_PhanHoiBinhLuanSP_BinhLuanSanPham FOREIGN KEY(ma_binh_luan)
REFERENCES BinhLuanSanPham (ma_binh_luan)

ALTER TABLE PhanHoiBinhLuanSP CHECK CONSTRAINT FK_PhanHoiBinhLuanSP_BinhLuanSanPham

ALTER TABLE PhanHoiBinhLuanSP  WITH CHECK ADD  CONSTRAINT FK_PhanHoiBinhLuanSP_NhanVien FOREIGN KEY(ma_nhan_vien)
REFERENCES NhanVien (ma_nhan_vien)

ALTER TABLE PhanHoiBinhLuanSP CHECK CONSTRAINT FK_PhanHoiBinhLuanSP_NhanVien

ALTER TABLE SanPham  WITH CHECK ADD  CONSTRAINT FK_SanPham_HangSanXuat FOREIGN KEY(ma_hang_sx)
REFERENCES HangSanXuat (ma_hang_sx)

ALTER TABLE SanPham CHECK CONSTRAINT FK_SanPham_HangSanXuat

