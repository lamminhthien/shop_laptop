import React from 'react';
import PrimarySearchAppBar from '../../Components/Public/Navbar';
import Footer from '../../Components/Public/Footer';
import {useState, useEffect} from 'react';
import axios from 'axios';
import {confirmAlert} from 'react-confirm-alert';

export default function GioHang() {
  const [listItemGioHang, setListItemGioHang] = useState([]);
  const [state, setState] = useState(false);
  const [error, setError] = useState([]);
  var tongTien = 0;
  const configJWT = {
    headers: {
      Authorization: 'Bearer ' + localStorage.getItem('token')
    }
  };

  useEffect(() => {
    axios
      .post(`https://localhost:7216/api/GioHang/XemGioHang`, null, configJWT)
      .then(res => {
        console.log('%cThis is a green text', 'color:green');
        setListItemGioHang(res.data);
        setState(true);
      })
      .catch(err => {
        console.log('%cThis is a red text', 'color:red');
      });
  }, []);

  const AlertAndRedirectToDelete = maSanPham => {
    confirmAlert({
      title: 'Xác nhận trước khi xóa sản phẩm',
      message: 'Bạn có muốn xóa sản phẩm này',
      buttons: [
        {
          label: 'Có',
          onClick: () =>
            axios
              .delete(`https://localhost:7216/api/GioHang/XoaGioHang/${maSanPham}`, configJWT)
              .then(res => {
                // Re-render data by trigger function
                window.location.href = '/khach-hang/gio-hang';
              })
              .catch(err => alert(err))
        },
        {
          label: 'Không',
          onClick: () => alert('Click No')
        }
      ]
    });
  };

  const updateStateItemGioHang = (idSanPham, e) => {
    const soLuong = e.target.value;
    // Update quantity
    listItemGioHang[listItemGioHang.findIndex(obj => obj.maSanPham == idSanPham)].soLuong = parseInt(soLuong);
  };
  const updateGioHang = e => {
    listItemGioHang.forEach(item => {
      var formData = new FormData();
      console.log(item);
      formData.append('soLuong', item.soLuong);
      formData.append('maSanPham', item.maSanPham);
      axios
        .post(`https://localhost:7216/api/GioHang/CapNhatGioHang`, formData, configJWT)
        .then(res => {
          ///
        })
        .catch(err => {
          console.log(err);
          setError(...error,err.response.data)
        });
    });
    console.log(`This is log for ---------------------- error`);
    console.log(error);
  };

  const datHang = () => {
    axios.post('https://localhost:7216/api/DatHang/TaoHoaDon',null,configJWT)
        .then(res => {
          alert("Đã đặt hàng thành công, đơn hàng của bạn sẽ được duyệt và giao trong thời gian sớm nhất")
          window.location.href = "/"
        })
        .catch(err => {
          alert(err.response.data);
        })
  }
  const renderData = () => {
    console.log(listItemGioHang);
    listItemGioHang.forEach(item => {
      tongTien = tongTien + item.soLuong * item.donGia;
    });
    if (state === true) {
      return (
        <div>
          <PrimarySearchAppBar />
          <div className='container  lg:p-9 mx-auto border-2 bg-[#E2EEEC] border-white rounded-lg'>
            {/* Area List Item */}
            <div className='inner border-2 border-white rounded-lg lg:flex'>
              <div className='items-cart relative w-full lg:w-2/3  lg:p-6 bg-white space-y-10 '>
                {/* title */}
                <div className=' title'>
                  <p className='text-3xl font-medium leading-6'>Giỏ Hàng</p>
                </div>
                {/* list item */}
                <div className='list_item'>
                  {listItemGioHang.map(item => (
                    <div className='inner grid grid-cols-2 px-8 py-4'>
                      {/* left */}
                      <div className='flex justify-start items-center name-and-image-product  pl-6 gap-x-6'>
                        <div className=' '>
                          <img src={item.anhSanPham} alt={item.tenSanPham}  className="w-[100px] h-[100px] object-contain"/>
                        </div>
                        <div className='inner'>
                          {error[item.maSanPham] ? <h2 className='text-red-500'>This is error</h2> : ''}
                          <h2 className='text-lg font-medium leading-5'>{item.tenSanPham}</h2>
                        </div>
                      </div>
                      {/* right */}
                      <div className='flex justify-end items-center function-control-each-items space-x-12'>
                        <div className='control-quantity space-x-4'>
                          <input
                            type='number'
                            className='w-[70px] border-2 border-gray-400 rounded-md'
                            defaultValue={item.soLuong}
                            min='1'
                            max='4'
                            onChange={
                              e => {
                                updateStateItemGioHang(item.maSanPham, e)
                              }
                            }
                          />
                        </div>
                        <div className='total-money'>
                          <p className='text-lg font-bold leading-5'>{item.soLuong * item.donGia}</p>
                        </div>
                        <div className='delete'>
                          <button
                            className='text-lg font-bold text-red-500 leading-5'
                            onClick={() => {
                              AlertAndRedirectToDelete(item.maSanPham);
                            }}>
                            Delete
                          </button>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
                {/* Cập nhật giỏ hàng */}
                <div className='absolute bottom-0 right-0 mx-5 items-end'>
                  <button
                    className=' p-2 border-2  w-full bg-[#6E7EA3] text-white text-lg font-medium my-2 rounded-md'
                    onClick={() => updateGioHang()}>
                    Cập nhật giỏ hàng
                  </button>
                </div>
              </div>
              {/* Order Details */}
              <div className='order-details pl-8 p-6  bg-[#F0F6F5] w-full lg:w-1/3 text-center'>
                <div className='title'>
                  <p className='text-3xl font-medium leading-6 mb-12'>Thông tin chung</p>
                  <div className='subtotal mb-6'>
                    <h2 className='text-lg font-medium'>Tổng tiền</h2>
                    <p className='text-3xl font-medium '>{Math.round(tongTien)} VND</p>
                  </div>
                  {/* <div className='shipping-fee mb-6'>
                    <h2 className='text-lg font-medium'>Shipping Fee</h2>
                    <p className='text-3xl font-medium '>
                      <select className='w-full  h-16 text-center text text-3xl font-medium bg-[#D0D7DA] border-t-2 border-0 border-[#D0D7DA]-500 rounded-lg '>
                        <option value='1'>Ninh Hòa</option>
                        <option value='2'>Nha Trang</option>
                        <option value='3'>Vạn Giã</option>
                        <option value='4'>Vạn Ninh</option>
                        <option value='5'>Khánh Sơn</option>
                        <option value='6'>Đắc Lắc</option>
                      </select>
                    </p>
                  </div> */}
                  <div className='total-cost mb-12'>
                    <button className='p-2 border-2  w-full bg-[#6E7EA3] text-white text-lg font-medium my-2 rounded-md' onClick={() => datHang() }>
                      Đặt hàng
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <Footer />
        </div>
      );
    } else
      return (
        <>
          <PrimarySearchAppBar />
          <p>Không có dữ liệu</p>
          <Footer />
        </>
      );
  };
  return renderData();
}
