﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ContosoPizza.Models
{
    [Table("AnhSanPham")]
    public partial class AnhSanPham
    {
        [Key]
        [Column("ma_anh")]
        [StringLength(5)]
        public string MaAnh { get; set; } = null!;
        [Column("ma_san_pham")]
        [StringLength(5)]
        public string MaSanPham { get; set; } = null!;
        [Column("file_anh")]
        [MaxLength(50)]
        public byte[] FileAnh { get; set; } = null!;

        [ForeignKey("MaSanPham")]
        [InverseProperty("AnhSanPhams")]
        public virtual SanPham MaSanPhamNavigation { get; set; } = null!;
    }
}
