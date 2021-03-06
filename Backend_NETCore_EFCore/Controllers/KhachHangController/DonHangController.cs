using Microsoft.AspNetCore.Mvc;
using ShopLaptop_EFCore.Data;
using ShopLaptop_EFCore.Models;
using ShopLaptop_EFCore.Models.NhanVienModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using System.IO;
using System.Security.Claims;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ShopLaptop_EFCore.Controllers.KhachHangController
{
  [Route("api/[controller]")]
  [ApiController]
  public class DonHangController : ControllerBase
  {
    private readonly shop_laptopContext _context;

    public DonHangController(shop_laptopContext context)
    {
      _context = context;
    }
    //Sữa số lượng sản phẩm trong giỏ hàng
    // Xóa sản phẩm khỏi giỏ hàng
    [HttpGet("ListDonHang")]
    public ActionResult<List<dynamic>> ListDonHang()
    {
      var identity = HttpContext.User.Identity as ClaimsIdentity;
      if (identity != null)
      {
        var userName = identity.Claims.FirstOrDefault(o => o.Type == ClaimTypes.NameIdentifier)?.Value;
        var maKhachHang = (from a in _context.KhachHangs
                           where a.Username == userName
                           select a.MaKhachHang).FirstOrDefault();
        if (maKhachHang == 0) return BadRequest("Khách hàng chưa đăng nhập");
        var donHangCount = (from a in _context.HoaDons where a.MaKhachHang == maKhachHang select a).Count();
        var donHangIDList = (from a in _context.HoaDons where a.MaKhachHang == maKhachHang select a).ToList();
        List<dynamic> groupChiTietHoaDon = new List<dynamic>();
        var imageURL = Request.Scheme + "://" + Request.Host.Value + "/" + "Resources/Images/SanPham/";
        foreach (var item in donHangIDList)
        {
          var chiTietHoaDonList = (from a in _context.ChiTietHoaDons
                                   join b in _context.HoaDons
                                   on a.MaHoaDon equals b.MaHoaDon
                                   join c in _context.SanPhams
                                   on a.MaSanPham equals c.MaSanPham
                                   where a.MaHoaDon == item.MaHoaDon
                                   select new
                                   {
                                     maSanPham = a.MaSanPham,
                                     tenSanPham = c.TenSanPham,
                                     soLuong = a.SoLuong,
                                     donGia = (from d in _context.BienDongGia
                                               where d.MaSanPham == a.MaSanPham
                                               orderby d.LanThayDoiGia ascending
                                               select d.GiaNhap * (1 + d.ChietKhau)).Last(),
                                     anhSanPham = (from e in _context.AnhSanPhams
                                                   where e.MaSanPham == a.MaSanPham
                                                   select imageURL + e.FileAnh.Trim()).First()
                                   }).ToList();
          double tongTien = 0;
          foreach (var itemInCTHD in chiTietHoaDonList)
          {
            var giaNiemYet = (from d in _context.BienDongGia
                              where d.MaSanPham == itemInCTHD.maSanPham
                              orderby d.LanThayDoiGia ascending
                              select d.GiaNhap * (1 + d.ChietKhau)).Last();
            tongTien = tongTien + (itemInCTHD.soLuong * giaNiemYet);
          }

          groupChiTietHoaDon.Add(new
          {
            soHoaDon = item.MaHoaDon,
            tinhTrang = (item.TinhTrangGiaoHang == 0 ? "Đang chờ duyệt" :
             (item.TinhTrangGiaoHang == 1 ? "Đang vận chuyển" : "Đã giao thành công")),
            tongTien = tongTien,
            chiTietHoaDonList = chiTietHoaDonList
          });
        }
        return Ok(new
        {
          tongDonHang = donHangCount,
          groupChiTietHoaDon = groupChiTietHoaDon
        });
        // return Ok($"Có {donHangCount} đơn hàng");
      }
      return BadRequest("Khách hàng chưa đăng nhập");
    }
  }
}
