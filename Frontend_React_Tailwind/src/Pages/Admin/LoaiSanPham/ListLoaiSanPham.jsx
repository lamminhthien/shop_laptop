import React, { Component } from 'react';
import axios from 'axios';
import Sidebar from '../../../Components/Admin/Sidebar';
import { useState, useEffect } from 'react';
import { useParams, useRouteMatch, useLocation } from "react-router-dom";
import Paging from '../../../Components/Admin/Paging';
import LoaiSanPhamApi from '../../../Api/LoaiSanPham/LoaiSanPhamApi';
import LoginCreateJWT from '../../Admin/Login/Login';
export default function ListLoaiSanPham() {
     const [statusCode, setStatusCode] = useState('');
    // Lấy url trang hiện tại
    const {path,url} = useRouteMatch();

    // Đường dẫn đến thư mục ảnh ở Backend
    const imgURL = LoaiSanPhamApi.loadAnhMinhHoa()

    // Đọc số trang hiện tại
    let { pageNumber } = useParams();

    pageNumber == undefined ? pageNumber = 1 : pageNumber = pageNumber
    // Table Headers
    const tableHeaders = ["Mã loại sản phẩm", "Tên loại sản phẩm",
        "Ảnh minh họa", "Chức năng"
    ]

    // Khởi tạo danh sách sản phẩm
    const [listLoaiSanPham, set_listLoaiSanPham] = useState([])
    // Khởi tạo tổng số trang để tạo menu phân trang
    const [numberOfPages, set_numberOfPages] = useState(0);

    // Thực thi lúc bắt đầu trang web
    useEffect(() => {
        // Lấy danh sách sản phẩm và tổng số trang cần phân trang
        LoaiSanPhamApi.getListloaiSanPham(pageNumber)
            .then(res => {
                // Set list sản phẩm
                set_listLoaiSanPham(res.data.ketQua)
                // Set tổng số trang
                set_numberOfPages(res.data.soTrang)
            })
            .catch(err => setStatusCode(err.response.status));
    }, [])

    // Sửa ảnh loại sản phẩm
    const changeProductName = (id,e) => {
        const imgFile = e.target.files[0]
        const formData = new FormData()
        formData.append("image",imgFile)
        LoaiSanPhamApi.suaAnhLoaiSanPham(id,formData)
            .then(res => {
                alert(res)
            })
            .catch(err => {
                alert(err)
            })
    }
  if (statusCode === 403 ) {
    return <LoginCreateJWT expire="1" />;
  }
  if (statusCode === 401) {
      return <LoginCreateJWT login="0" />
  }
    return (
        <div className='flex'>
            {/* Hiển thị danh sách sản phẩm lên */}
            {listLoaiSanPham.map((item) =>
                console.log(item.tenSanPham)
            )}
            {/* Hiển thị cột sidebar */}
            <Sidebar />
            <div className='h-screen flex-1 p-7'>
                <button type="button" class="hover:scale-125 ease-in-out duration-150 ease-in-out text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2  ">
                    <a href='/admin/them-danh-muc-san-pham'>Thêm danh mục sản phẩm</a>
                </button>
                <div class="flex items-center"><h1 class="mb-3 inline-block text-2xl sm:text-3xl font-bold text-slate-900 tracking-tight 00">Danh mục sản phẩm</h1></div>
                <div class="relative overflow-x-auto shadow-2xl rounded-2xl">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr className='bg-slate-300'>
                                <th scope="col" class="p-4">
                                    <div class="flex items-center">
                                        <input id="checkbox-all" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                                        <label for="checkbox-all" class="sr-only">checkbox</label>
                                    </div>
                                </th>
                                {/* Hiển thị tên các cột  */}
                                {tableHeaders.map((item) =>
                                    <th scope="col" class="px-6 py-3">
                                        {item}
                                    </th>
                                )}
                            </tr>
                        </thead>
                        <tbody>
                            {/* Map từng dòng trong danh sách sản phẩm ra, chú ý còn map cái item trong từng dòng ở dưới nữa*/}
                            {listLoaiSanPham.map((item) =>
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                    <td class="w-4 p-4">
                                        <div class="flex items-center">
                                            <input id="checkbox-table-1" type="checkbox" class="w-4 h-4
                         text-blue-600 bg-gray-100 border-gray-300 rounded
                          focus:ring-blue-500 dark:focus:ring-blue-600 
                          dark:ring-offset-gray-800 focus:ring-2 
                          dark:bg-gray-700 dark:border-gray-600" />
                                            <label for="checkbox-table-1" class="sr-only">checkbox</label>
                                        </div>
                                    </td>
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 dark:text-white whitespace-nowrap">
                                        {/* Riêng mã sản phẩm được in đậm in ra trước */}
                                        {item.maLoaiSp}
                                    </th>
                                        {/* // Hiển thị thông tin các trường còn lại , có cùng style  */}
                                       <td className='px-6 py-4'>{item.tenLoaiSp}</td>
                                       <td className='px-6 py-4'>
                                       <img src={`${imgURL}/${(item.anhMinhHoa).trim()}`}  className='px-6 py-4 w-24' alt={item.tenLoaiSp}/>
                                       </td>
                                      
                                    <td class="px-5 py-4 text-left">
                                        <a href={"/admin/sua-danh-muc-san-pham/" + item.maLoaiSp} class="font-medium text-blue-600
 dark:text-blue-500 p-2 border-2 rounded-xl hover:bg-yellow-400 hover:border-2 space-x-3 hover:text-white hover:scale-170 ease-in-out duration-150"

 >Sữa ảnh</a>
                                    </td>

                                </tr>
                            )}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                {/* Tạo dải phân trang vơi pages là tổng số trang và currentPage là trang hiện tại (để đánh dấu màu sắc) */}
                                <td class="w-4 p-4" colSpan={3}> <Paging pages={numberOfPages} currentPage={pageNumber} url={url} /></td>
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>

        </div>
    )

}
