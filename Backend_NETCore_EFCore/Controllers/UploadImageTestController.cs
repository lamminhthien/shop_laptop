﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopLaptop_EFCore.Data;
using System.Net.Http.Headers;

namespace ShopLaptop_EFCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadImageTestController : ControllerBase
    {
        private readonly shop_laptopContext _context;

        public UploadImageTestController(shop_laptopContext context)
        {
            _context = context;
        }

        [HttpPost, DisableRequestSizeLimit]
        public IActionResult Upload()
        {
            // Giả định mã sản phẩm là 1
            int id = 999999999;
            // Kiểm tra xem sản phẩm này có tồn tại hay ko?
            var maSanPham = (from a in _context.SanPhams
                             where a.MaSanPham == id
                             select a.MaSanPham).FirstOrDefault();
            if (maSanPham == 0) return NotFound("Không tìm thấy sản phẩm để upload ảnh");

            try
            {
                // Tạo file name
                var fileName = "SP";
                // Lấy ảnh từ form ra
                var file = Request.Form.Files[0];
                // Tạo đường dẫn  đến thư mục lưu ảnh sản phẩm
                var folderName = Path.Combine("Resources", "Images", "SanPham");
                // Tạo đường dẫn của hệ thống để lưu file
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                // Check xem request có rỗng file hay ko ?
                if (file.Length < 0) return BadRequest("Chưa upload bất cứ ảnh nào");

                // Validate file ảnh
                if (!file.ContentType.Contains("image")) return BadRequest("This file is not image");
                // Check xem sản phẩm id=1 này đã có ảnh hay chưa
                var anhSanPham = (from a in _context.SanPhams
                                  join b in _context.AnhSanPhams
                                  on a.MaSanPham equals b.MaSanPham
                                  where a.MaSanPham == id
                                  orderby b.FileAnh descending
                                  select b).FirstOrDefault();
                // Nếu chưa có ảnh sản phẩm này
                if (anhSanPham == null)
                {
                    // Tên sản phẩm bằng mã sản phẩm + "1"
                    fileName = fileName + maSanPham.ToString();
                }
                else // Đã có sẵn từ 1 ảnh trở lên 
                {
                    // Đếm số lượng ảnh đang có
                    var countAnhSanPham = (from a in _context.SanPhams
                                           join b in _context.AnhSanPhams
                                           on a.MaSanPham equals b.MaSanPham
                                           where a.MaSanPham == id
                                           orderby b.FileAnh descending
                                           select b.FileAnh).Count();
                    // Nếu vượt quá 4 ảnh
                    if (countAnhSanPham > 4)
                    {
                        return BadRequest("Sản phẩm này đã có 4 ảnh, bạn không thể up thêm ảnh, mà chỉ có thể sữa 1 trong 4 ảnh");
                    }
                    else
                    {
                        // Tên sản phẩm bằng mã sản phẩm + (số lượng ảnh + 1)
                        fileName = fileName + (countAnhSanPham + 1).ToString();
                    }
                }
                // Tạo đường dẫn đầy đủ kèm với tên file và định dạng file ảnh để copy file vào server
                var fullPath = Path.Combine(pathToSave, fileName + "." + file.ContentType.Split('/')[1]);

                // Copy ảnh từ formdata front end vào fullPath với chế độ Create của filemode
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                return Ok("Đã tạo ảnh mới với tên " + fileName);
            } // Trường hợp này là formData rỗng rồi
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // Test Truy  vấn linq
        [HttpGet]
        public IActionResult TestSelect()
        {
            // Giả định mã sản phẩm là 1
            int id = 1;
            var anhSanPham = (from a in _context.SanPhams
                              join b in _context.AnhSanPhams
                              on a.MaSanPham equals b.MaSanPham
                              where a.MaSanPham == id
                              orderby b.FileAnh descending
                              select b).FirstOrDefault();
            if (anhSanPham == null) return BadRequest("Ảnh sản phẩm không thấy");
            return Ok("Tìm thấy sản phẩm");
        }
    }
}
