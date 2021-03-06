import React, { Component } from 'react';
import axios from 'axios';
import Sidebar from '../../../Components/Admin/Sidebar';
import { useState, useEffect } from 'react';
import { useParams, useRouteMatch, useLocation } from "react-router-dom";
import KhachHangApi from '../../../Api/KhachHang/KhachHangApi';
import LoginCreateJWT from '../../Admin/Login/Login';
import Paging from '../../../Components/Admin/Paging';
export default function ListKhachHang() {
    // Lấy url trang hiện tại
    const { path, url } = useRouteMatch();

    // Đọc số trang hiện tại
    let { pageNumber } = useParams();

    pageNumber == undefined ? pageNumber = 1 : pageNumber = pageNumber

    // Table Headers
    const tableHeaders = ["Mã khách hàng", "Tên khách hàng", "Địa chỉ",
        "Số điện thoại", "Giới tính", "Email"
    ]

    // Khởi tạo danh sách khách hàng
    const [listKhachHang, set_listKhachHang] = useState([])
    // Khởi tạo tổng số trang để tạo menu phân trang
    const [numberOfPages, set_numberOfPages] = useState(0);

    // Thực thi lúc bắt đầu trang web
    useEffect(() => {
        // Lấy danh sách khách hàng và tổng số trang cần phân trang
        KhachHangApi.getListKhachHang(pageNumber)
            .then(res => {
                // Set list khách hàng
                set_listKhachHang(res.data.ketqua)
                // Set list phân trang
                set_numberOfPages(res.data.soTrang)
            })
            .catch(error => console.log(error));
    }, [])
     const [statusCode, setStatusCode] = useState('');
    return (
        <div className='flex'>
            {/* Hiển thị danh sách khách hàng lên */}
            {/* Hiển thị cột sidebar */}
            <Sidebar />
            <div className='h-screen flex-1 p-7'>
                <div class="flex items-center"><h1 class="mb-3 inline-block text-2xl sm:text-3xl font-bold text-slate-900 tracking-tight 00">Danh sách khách hàng</h1></div>
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
                            {/* Map từng dòng trong danh sách khách hàng ra, chú ý còn map cái item trong từng dòng ở dưới nữa*/}
                            {listKhachHang.map((item) =>
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
                                        {/* Riêng mã khách hàng được in đậm in ra trước */}
                                        {item.maKhachHang}
                                    </th>
                                    {
                                        // Hiển thị thông tin các trường còn lại , có cùng style 
                                        [item.tenKhachHang, item.diaChi,
                                        item.soDienThoai,item.gioiTinh, item.email]
                                            .map((element) =>
                                                <td class="px-6 py-4">
                                                    {element}
                                                </td>
                                            )
                                    }
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
