import 'flowbite';
import reactDom from 'react-dom';
import './Styles/tailwind.css';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import NotFoundPage from './Components/404ErrorPage';
import ListSanPham from './Pages/Admin/SanPham/ListSanPham';
import ChiTietSanPham from './Pages/Admin/SanPham/ChiTietSanPham';
import EditSanPham from './Pages/Admin/SanPham/EditSanPham';
import ThemSanPham from './Pages/Admin/SanPham/ThemSanPham';
import ListLoaiSanPham from './Pages/Admin/LoaiSanPham/ListLoaiSanPham';
import ListHangSanXuat from './Pages/Admin/HangSanXuat/ListHangSanXuat';
import ListNhanVien from './Pages/Admin/NhanVien/ListNhanVien';
import ListKhachHang from './Pages/Admin/KhachHang/ListKhachHang';
import ListLichSuGiaCa from './Pages/Admin/LichSuGiaCa/ListLichSuGiaCa';
import XoaSanPham from './Pages/Admin/SanPham/XoaSanPham';
import ThemLoaiSanPham from './Pages/Admin/LoaiSanPham/ThemLoaiSanPham';
import ThemHangSanXuat from './Pages/Admin/HangSanXuat/ThemHangSanXuat';
import HomePage from './Pages/Public/TrangChu/index';
import ChiTietSanPhamPublic from './Pages/Public/ChiTietSanPham/index';
import EditLoaiSanPham from './Pages/Admin/LoaiSanPham/EditLoaiSanPham';
import EditHangSanXuat from './Pages/Admin/HangSanXuat/EditHangSanXuat';
import DangKy from './Pages/Public/DangKy/DangKy';
import DangNhapKH from './Pages/Public/DangNhap/DangNhap'
import  GioHang from './Pages/Customer/GioHang'
import ThemBanner from './Pages/Admin/Banner/ThemBanner';
import ListBanner from './Pages/Admin/Banner/ListBanner';
import TinhTrangDonHang from './Pages/Customer/TinhTrangDonHang';
import ListDonHang from './Pages/Admin/DonHang/ListDonHang';
import ThemNhanVien from './Pages/Admin/NhanVien/ThemNhanVien';
import ChiTietDonHang from './Pages/Admin/DonHang/ChiTietDonHang';
import ThongKe from './Pages/Admin/ThongKe/ThongKePage';

// https://v5.reactrouter.com/web/example/basic React Router Example
reactDom.render(
  <BrowserRouter>
    <Switch>
      <Route exact path='/' children={<HomePage />} />

      {/* Admin Qu???n l?? s???n ph???m */}
      <Route exact path='/admin' children={<ListSanPham />} />
      <Route exact path='/admin/chi-tiet-san-pham/:id' children={<ChiTietSanPham />} />

      <Route exact path='/admin/san-pham/:pageNumber' children={<ListSanPham />} />

      <Route exact path='/admin/edit-san-pham/:id' children={<EditSanPham />} />

      <Route exact path='/admin/them-san-pham/' children={<ThemSanPham />} />

      <Route exact path='/admin/xoa-san-pham/:id' children={<XoaSanPham />} />

      {/* Admin Qu???n l?? danh m???c s???n ph???m */}

      <Route exact path='/admin/danh-muc-san-pham/:pageNumber' children={<ListLoaiSanPham />} />

      <Route exact path='/admin/them-danh-muc-san-pham' children={<ThemLoaiSanPham />} />

      <Route exact path='/admin/sua-danh-muc-san-pham/:id' children={<EditLoaiSanPham />} />

      {/* Admin Qu???n l?? Th????ng hi???u */}

      <Route exact path='/admin/list-hang-san-xuat/:pageNumber' children={<ListHangSanXuat />} />

      <Route exact path='/admin/them-hang-san-xuat' children={<ThemHangSanXuat />} />

      <Route exact path='/admin/edit-hang-san-xuat/:id' children={<EditHangSanXuat />} />

      {/* Admin Qu???n l?? nh??n vi??n */}
      <Route exact path='/admin/list-nhan-vien/:pageNumber' children={<ListNhanVien />} />
      <Route exact path='/admin/them-nhan-vien' children={<ThemNhanVien />} />

      {/* Admin Qu???n l?? kh??ch h??ng */}
      <Route exact path='/admin/list-khach-hang/:pageNumber' children={<ListKhachHang />} />

      {/* Admin Qu???n l?? bi???n ?????ng gi?? c??? */}
      <Route exact path='/admin/list-bien-dong-gia-ca/:pageNumber' children={<ListLichSuGiaCa />} />
      {/* Admin qu???n l?? banner qu???ng c??o */}
      <Route exact path='/admin/list-banner' children={<ListBanner/>}/>
      <Route exact path='/admin/them-banner' children={<ThemBanner/>}/>
      {/* Admin Qu???n l?? ????n h??ng */}
      <Route exact path="/admin/list-hoa-don/" children={<ListDonHang/>}/>
      <Route exact path="/admin/chi-tiet-hoa-don/:id" children={<ChiTietDonHang/>}/>
      {/* Admin Xem th???ng k?? */}
      <Route exact path="/admin/thong-ke" children={<ThongKe/>}/>

      {/* Public */}
      <Route exact path='/public/trang-chu' children={<HomePage />} />
      <Route exact path='/public/dang-ky' children={<DangKy />} />
      <Route exact path='/public/dang-nhap' children={<DangNhapKH />} />
      <Route exact path='/public/san-pham/:id' children={<ChiTietSanPhamPublic />} />

      {/* Kh??ch H??ng */}
      <Route exact path="/khach-hang/gio-hang" children={<GioHang/>}  />
      <Route exact path="/khach-hang/don-hang" children={<TinhTrangDonHang/>}  />

      <Route path='*' children={<NotFoundPage />} />
    </Switch>
  </BrowserRouter>,
  document.getElementById('root')
);
