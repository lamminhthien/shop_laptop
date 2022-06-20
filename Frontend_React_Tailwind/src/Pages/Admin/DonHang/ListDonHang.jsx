import React from 'react';
import Sidebar from '../../../Components/Admin/Sidebar';
import {FcExpand} from 'react-icons/fc';
import {useState, useEffect} from 'react';
import axios from 'axios';
import {confirmAlert} from 'react-confirm-alert';

export default function ListDonHang() {
  const [listHoaDon, setListHoaDon] = useState([]);
  const [state, setState] = useState(false);
  const [error, setError] = useState([]);
  const configJWT = {
    headers: {
      Authorization: 'Bearer ' + localStorage.getItem('token')
    }
  };
  useEffect(() => {
    axios
      .get(`https://localhost:7216/api/QuanLyDonHang/ListDonHang`, configJWT)
      .then(res => {
        console.log('%cThis is a green text', 'color:green');
        setListHoaDon(res.data);
        setState(true);
      })
      .catch(err => {
        console.log('%cThis is a red text', 'color:red');
      });
  }, []);
  if (state === true) {
    return (
      <div>
        <div className='flex'>
          <Sidebar />
          <div className='h-screen flex-1 p-7'>
            <div className='container  lg:p-9 mx-auto border-2 bg-[#E2EEEC] border-white rounded-lg'>
              <div className='inner border-2 border-white rounded-lg'>
                <div className='items-cart relative w-full   lg:p-6 bg-white space-y-10 '>
                  <div className=' title'>
                    <p className='text-3xl font-medium leading-6'>Tình trạng đơn hàng</p>
                  </div>
                  <div class='list_don_hang'>
                  {listHoaDon.map(item => (
                    <div class='inner px-8 py-4'>
                      <div class='don-hang space-y-10'>
                        <div class='don-hang-1 bg-slate-100'>
                          <div class=''>
                            <h2 class='text-2xl'>
                              Mã đơn hàng 16 - <b class='text-red-500'>{item.tinhTrang}</b>
                            </h2>
                            <p class='text-lg font-bold'>Tên khách hàng: Lâm Minh Thiện</p>
                            <p class='text-lg font-bold'>Thời gian : {item.thoiGian.slice(0,10)}</p>
                            <p class='text-lg font-bold'>Số lượng sản phẩm: {item.soLuongSanPham}</p>
                            <p class='text-lg font-bold'>Tổng tiền: {item.tongTien}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
  if (state === false) {
    return (
      <div>
      <div className='flex'>
        <Sidebar />
        <div className='h-screen flex-1 p-7'>
         <h2 className='text-red-500 font-semibold leading-7'>Chưa có hóa đơn nào</h2>
        </div>
      </div>
    </div>
    )
  }
}
