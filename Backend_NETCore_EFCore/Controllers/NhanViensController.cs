﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopLaptop_EFCore.Data;
using ShopLaptop_EFCore.Models;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace ShopLaptop_EFCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles ="Nhân viên")]
    public class NhanViensController : ControllerBase
    {
        private IConfiguration _config;
        private readonly shop_laptopContext _context;

        public NhanViensController(IConfiguration config, shop_laptopContext context)
        {
            _config = config;
            _context = context;
        }


        // GET: api/NhanViens
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NhanVien>>> GetNhanViens()
        {
            if (_context.NhanViens == null)
            {
                return NotFound();
            }
            return await _context.NhanViens.ToListAsync();
        }

        // GET: api/NhanViens/5
        [HttpGet("{id}")]
        public async Task<ActionResult<NhanVien>> GetNhanVien(int id)
        {
            if (_context.NhanViens == null)
            {
                return NotFound();
            }
            var nhanVien = await _context.NhanViens.FindAsync(id);

            if (nhanVien == null)
            {
                return NotFound();
            }

            return nhanVien;
        }

        // PUT: api/NhanViens/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNhanVien(int id, NhanVien nhanVien)
        {
            if (id != nhanVien.MaNhanVien)
            {
                return BadRequest();
            }

            _context.Entry(nhanVien).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NhanVienExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/NhanViens
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<NhanVien>> PostNhanVien(NhanVien nhanVien)
        {
            if (_context.NhanViens == null)
            {
                return Problem("Entity set 'shop_laptopContext.NhanViens'  is null.");
            }
            _context.NhanViens.Add(nhanVien);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNhanVien", new { id = nhanVien.MaNhanVien }, nhanVien);
        }

        // DELETE: api/NhanViens/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteNhanVien(int id)
        {
            if (_context.NhanViens == null)
            {
                return NotFound();
            }
            var nhanVien = await _context.NhanViens.FindAsync(id);
            if (nhanVien == null)
            {
                return NotFound();
            }

            _context.NhanViens.Remove(nhanVien);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool NhanVienExists(int id)
        {
            return (_context.NhanViens?.Any(e => e.MaNhanVien == id)).GetValueOrDefault();
        }

        // Route đăng nhập và lấy jwt token
        [AllowAnonymous]
        [HttpPost("Login")]
        public  IActionResult Login([FromBody] UserLogin userLogin)
        {
            // Lấy username và password từ request payload
            var username = userLogin.Username;
            var password = userLogin.Password;

            // Kiểm tra username và password có tồn tại trong database không?
            var currentUser =  _context.NhanViens.FirstOrDefault(o => o.Username == username && o.Password == password);

            // Nếu tồn tại tài khoản, trả về JWT Token để React lưu vào LocalStorage
            if (currentUser != null)
            {
                var securityKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
                var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                var claims = new[]
                {
                    new Claim(ClaimTypes.NameIdentifier, currentUser.Username),
                    new Claim(ClaimTypes.MobilePhone, currentUser.SoDienThoai),
                    new Claim(ClaimTypes.Name, currentUser.TenNhanVien),
                    new Claim(ClaimTypes.Role, "Nhân viên")
                 };

                var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                  _config["Jwt:Audience"],
                  claims,
                  expires: DateTime.Now.AddMinutes(30),
                  signingCredentials: credentials);
                // Mã hóa thành chuỗi token và trả về status 200 kèm token để React lưu vào LocalStorage
                var tokenString = new JwtSecurityTokenHandler().WriteToken(token);
                return Ok(tokenString);
            }
            else
            {
                return NotFound("Tài khoản nhân viên không hợp lệ");
            }
        }
    }
}