﻿using Microsoft.AspNetCore.Mvc;
using ShopLaptop_EFCore.Data;
using ShopLaptop_EFCore.Models;
using ShopLaptop_EFCore.Models.NhanVienModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using System.IO;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ShopLaptop_EFCore.Controllers.KhachHangController
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        // Database context, giúp tương tác truy vấn đến database
        private readonly shop_laptopContext _context;
        public KhachHangController(shop_laptopContext context)
        {
            _context = context;
        }

        [HttpPost("DangKyKhachHang")]
        public ActionResult<List<dynamic>> DangKyKhachHang(KhachHang kh)
        {
            try
            {
                _context.Add(kh);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                var errMsg = ex.InnerException.ToString();
                if(errMsg.Contains("so_dien_thoai"))  
                { 
                    return BadRequest("Số điện thoại bị trùng");
                }
                if (errMsg.Contains("username"))
                {

                    return BadRequest("Username bị trùng");
                }
                if (errMsg.Contains("email"))
                {
                    return BadRequest("Email bị trùng");
                }
                if (errMsg.Contains("ho_ten"))
                {
                    return BadRequest("Họ và tên bị trùng");
                }
            }
            return Ok("Đăng ký tài khoản khách hàng thành công");
        }

        [HttpPost("BinhLuanSanPham")]
        public ActionResult<List<dynamic>> BinhLuanSanPham(BinhLuanSanPham binhLuan)
        {
            try
            {
                _context.Add(binhLuan);
                _context.SaveChanges();
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.ToString());
            }
            return Ok("Hi");
        }


        //Sữa số lượng sản phẩm trong giỏ hàng
        // Xóa sản phẩm khỏi giỏ hàng
        [HttpPost("ThemGioHang")]
        public ActionResult<List<dynamic>> ThemGioHang(int maKhachHang=-1,int maSanPham=-1,int soLuong=1)
        {
           
            // Nếu chưa có mã khách hàng
            if (maKhachHang == -1)
                return BadRequest("Bạn chưa đăng nhập");
            // Nếu chưa có mã sản phẩm hoặc không tìm thấy sản phẩm
            var sanPham = (from a in _context.SanPhams
                           where a.MaSanPham == maSanPham
                           select a).FirstOrDefault();
            if (sanPham == null)
                return BadRequest("Sản phẩm này không tồn tại");
            // Cần check xem khách hàng này có tồn tại hay không?
            var khachHang = (from a in _context.KhachHangs
                             where a.MaKhachHang == maKhachHang
                             select a).FirstOrDefault();
            if (khachHang == null) return BadRequest("Khách hàng này không tồn tại");
            if (soLuong <= 0)
                return BadRequest("Số lượng sản phẩm không phù hợp");
            if (soLuong > 4)
                return BadRequest("Bạn chỉ được phép đặt tối đa với số lượng là 4");
   

            // Check xem thử sản phẩm này ứng với giỏ hàng của khách hàng này đã thêm vào chưa?
            // Nếu đã thêm rồi thì chỉ update số lượng sản phẩm
            var sanPhamExistedOnCart = (from a in _context.GioHangs
                                        where (a.MaKhachHang == maKhachHang) &&
                                        (a.MaSanPham == maSanPham)
                                        select a).FirstOrDefault();
            if (sanPhamExistedOnCart != null)
            {

                var sanPhamOnCart = new GioHang(maKhachHang, maSanPham, soLuong);
                try
                {
                    _context.Entry(sanPhamOnCart).State = EntityState.Modified;
                    _context.SaveChanges();
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.InnerException.ToString());
                }
            }
            try
            {
                _context.Add(new GioHang(maKhachHang,maSanPham,soLuong));
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.InnerException.ToString());
            }
            return Ok("Hi");
        }



   
    }
}
