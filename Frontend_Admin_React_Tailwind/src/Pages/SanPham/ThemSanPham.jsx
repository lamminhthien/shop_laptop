/* eslint-disable no-unused-vars */
import { useState, useEffect } from 'react';
import NotFoundPage from "../../Components/404ErrorPage";
import Sidebar from "../../Components/Sidebar";
import axios from 'axios';
// Sử dụng useFrom từ react hook  form
import { useForm } from "react-hook-form";
export default function ThemSanPham() {
  // Khởi tạo dữ liệu về hãng sản xuất và danh mục sản phẩm
  const [hangSanXuatOption, setHangSanXuatOption] = useState([])
  const [loaiSanPhamOption, setLoaiSanPhamOpton] = useState([])
  // Tạo dữ liệu cho các option trong thẻ select
  const trangThaiSanPhamOption = [
    { name: "Đang bán", value: 1 },
    { name: "Hêt hàng", value: 0 }
  ]
  const doPhanGiaiOption = ["HD+", "Full HD", "2K", "4K"]
  const oCungOption = [128, 256, 512, 1024, 2048]
  const heDieuHanhOption = ["Windows 8", "Windows 10", "Window 11", "Mac OS", "Ubuntu"]
  const manHinhOption = [11.6, 12.3, 12.4, 13.3, 13.4, 14, 13, 15.6, 16, 16.1, 16.2, 17, 17.3]
  const dungLuongRAMOption = [4, 6, 8, 12, 16, 32]


  useEffect(() => {
    // Get Danh sách các hãng sản xuât
    axios.get("https://localhost:7216/api/QuanLyHangSanXuat")
      .then((res) => {
        setHangSanXuatOption(res.data)
      })
      .catch((error) => {
        console.log(error)
      })

    // Get danh sách các danh mục sản phẩm
    axios.get("https://localhost:7216/api/QuanLyDanhMucSanPham")
      .then((res) => {
        setLoaiSanPhamOpton(res.data)
      })
      .catch((error) => {
        console.log(error)
      })
  }, [])

  // We can use the `useParams` hook here to access
  // the dynamic pieces of the URL.
  const {
    register, // Đăng ký input vô react hookform
    handleSubmit, //Xử lý khi submit form
    watch, // Theo dõi và báo lỗi
    formState: { errors } // Theo dõi người dùng tương tác form và xuât ra element báo lỗi
  } = useForm(); // Na ná cách dùng useState

  // Xử lý khi submit form
  const onSubmit = (data) => {
    // Khi nào vượt rào được thì mới xác nhận form hợp lệ
    // và hiện ra dữ liệu json  được chuỗi hóa
    // Đổi giá trị phần trăm chiết khấu sang số thực
    data.chietKhau = (data.chietKhau) / 100;
    // Test hiển thị thử JSON data
    alert(JSON.stringify(data));
    // Đưa dữ liệu từ form vô axios
    axios.post("https://localhost:7216/api/QuanLySanPham/ThemSanPham",data)
      .then((res) => {
        alert("Submit dữ liệu qua api thành công")
      })
      .catch((err) => {
        alert("Submit dữ liệu qua api không thành công")
      })
  }; // your form submit function which will invoke after successful validation


  // Watcher theo dõi input theo name property 
  console.log(watch("tenSanPham"));

  // Tailwind CSS Reuse style 
  const inputStyle = `bg-gray-50 border border-gray-300
   text-gray-900 text-sm rounded-lg focus:ring-blue-500 
   focus:border-blue-500 block w-full p-2.5`
  const labelStyle = `block mb-2 text-sm font-medium text-gray-900`
  const errorStyle = `before:content-['⚠'] mt-2 text-sm text-red-600 `
  const divStyle = `relative z-0 w-full mb-6 group`
  const formtyle = `mt-2 rounded-xl bg-gradient-to-r bg-white  border 
  border-gray-200  p-2 sm:p-6  drop-shadow-2xl overscroll-contain`


  // Khu vực render giao diện
  return (
    <div className="flex">
      <Sidebar />
      <div className="h-screen flex-1 p-7">
        <div class="flex items-center"><h1 class="inline-block text-2xl sm:text-3xl font-bold text-slate-900 tracking-tight 00">Thêm sản phẩm mới</h1></div>
        {/*  Chế độ onSubmit sẽ là HandleSubmit */}
        <form onSubmit={handleSubmit(onSubmit)}
          className={formtyle}>
          {/* Input tên sản phẩm */}
          <div className="grid xl:grid-cols-3 xl:gap-6">
            <div className={divStyle}>
              <label class={labelStyle}>Tên sản phẩm</label>
              <input
                className={inputStyle}
                // Đăng ký vào react hook form
                {...register("tenSanPham", {
                  // Các ràng buộc validation
                  required: true, // Bắt buộc
                  maxLength: 50, // Độ dài tối đa
                  minLength: 10
                })}
              />
              {/* // Hình thức hiển thị lỗi (dựa theo formState)
           //  lỗi ở tenSanPham là required  thì hiện thẻ p thông báo lỗi */}
              {errors?.tenSanPham?.type === "required" && <p className={errorStyle}>Tên sản phẩm bắt buộc nhập</p>}
              {errors?.tenSanPham?.type === "maxLength" && (
                <p className={errorStyle}>Tên sản phẩm không được vượt quá 50 kí tự</p>
              )}
              {errors?.tenSanPham?.type === "minLength" && <p className={errorStyle}>Tên sản phẩm ít nhất phải 10 kí tự</p>}
            </div>

            {/* Hãng sản xuất */}
            <div className={divStyle}>
              <label class={labelStyle}>Hãng sản xuất</label>
              {/* Đăng ký react hook form */}
              <select {...register("hangSanXuat", {
                //Các ràng buộc validation
                required: true,
                valueAsNumber: true,
                min: 0
              })}
                class={inputStyle}>
                {hangSanXuatOption.map((item) =>
                  <option value={item.maHangSx}>{item.tenHangSx}</option>
                )}
              </select>
              {errors?.hangSanXuat?.type === "required" && <p className={errorStyle}>Hãng sản xuất băt buộc chọn</p>}
              {errors?.hangSanXuat?.type === "valueAsNumber" && <p className={errorStyle}>Cảnh báo, bạn đang cố sữa code value khác kiểu số</p>}
              {errors?.hangSanXuat?.type === "min" && <p className={errorStyle}>Cảnh báo, bạn đang cố sữa code, min cannot below 0</p>}
            </div>

            {/* Loại sản phẩm */}
            <div className={divStyle}>
              <label class={labelStyle}>Loại sản phẩm</label>
              <select {...register("loaiSanPham", {
                required: true,
                valueAsNumber: true,
                min: 0
              })}
                class={inputStyle}>
                {loaiSanPhamOption.map((item) =>
                  <option value={item.maLoaiSp}>{item.tenLoaiSp}</option>
                )}
              </select>
              {errors?.loaiSanPham?.type === "required" && <p className={errorStyle}>Loại sản phẩm bắt buộc chọn</p>}
              {errors?.loaiSanPham?.type === "valueAsNumber" && <p className={errorStyle}>Cảnh báo, bạn đang cố sữa code value khác kiểu số</p>}
              {errors?.loaiSanPham?.type === "min" && <p className={errorStyle}>Cảnh báo, bạn đang cố sữa code, min cannot below 0</p>}
            </div>
          </div>

          {/* Trạng thái sản phẩm,CPU, CARD đồ họa */}
          {/* Trạng thái sản phẩm */}
          <div className="grid xl:grid-cols-3 xl:gap-6">
            <div className={divStyle}>
              <label class={labelStyle}>Trạng thái sản phẩm !!Đừng đưa vào form thêm sản phẩm</label>
              <select
                {...register("trangThaiSp", {
                  required: true,
                  min: 0,
                  max: 1
                })}
                class={inputStyle}>
                {trangThaiSanPhamOption.map((item) =>
                  <option value={item.value}>{item.name}</option>
                )}
              </select>
              {errors?.trangThaiSp?.type === "required" && <p className={errorStyle}>Trạng thái sản phẩm bắt buộc chọn</p>}
              {errors?.trangThaiSp?.type === "min" && <p className={errorStyle}>Error, you are tying to edit value in html code for this select to below 0</p>}
              {errors?.trangThaiSp?.type === "max" && <p className={errorStyle}>Error, you are trying to edit value html code for this select to above 1</p>}
            </div>

            {/* CPU */}
            <div className={divStyle}>
              <label class={labelStyle}>CPU</label>
              <input
                {...register("cpu", {
                  maxLength: 40
                })}
                className={inputStyle} />
              {errors?.cpu?.type === "maxLength" && <p className={errorStyle}>Độ dài của tên CPU không được vượt quá 40 ký tự</p>}
            </div>

            {/* Card đồ họa */}
            <div className={divStyle}>
              <label class={labelStyle}>Card đồ họa</label>
              <input
                {...register("cardDoHoa", {
                  maxLength: 40
                })}
                className={inputStyle} />
              {errors?.cardDoHoa?.type === "maxLength" && <p className={errorStyle}>Độ dài của tên card đồ họa không được vượt quá 40 ký tự</p>}
            </div>
          </div>
          {/* Kết thúc trạng thái sản phẩm, CPU, CARD đồ họa */}
          {/* ------------------------------------- */}
          {/* Độ phân giải, ổ cứng, hệ điều hành */}
          {/* Độ phân giải */}
          <div className="grid xl:grid-cols-3 xl:gap-6">
            <div className={divStyle}>
              <label class={labelStyle}>Độ phân giải</label>
              <select
                {...register("doPhanGiai", {
                  maxLength: 10,
                })}
                class={inputStyle}>
                {doPhanGiaiOption.map((item) =>
                  <option value={item}>{item}</option>
                )}
              </select>
              {errors?.doPhanGiai?.type === "maxLength" && <p className={errorStyle}>Số lượng ký tự không được vượt quá 10</p>}
            </div>

            <div className={divStyle}>
              <label class={labelStyle}>Ổ cứng</label>
              <select
                {...register("oCung", {
                  valueAsNumber: true
                })}
                class={inputStyle}>
                {oCungOption.map((item) =>
                  <option value={item}>{item} GB</option>
                )}
              </select>
              {errors?.oCung?.type === "valueAsNumber" && <p className={errorStyle}>Cảnh báo Bạn đang cố chỉnh code cho value của select không phải là kiểu số</p>}
            </div>
            <div className={divStyle}>
              <label class={labelStyle}>Hệ điều hành</label>
              <select
                {...register("heDieuHanh", {
                  maxLength: 20
                })}
                class={inputStyle}>
                {heDieuHanhOption.map((item) =>
                  <option value={item}>{item}</option>
                )}
              </select>
              {errors?.heDieuHanh?.type === "maxLength" && <p className={errorStyle}>Độ dài của tên hệ điều hành không vượt quá 20</p>}
            </div>
          </div>
          {/* Kết thúc độ phân giải, ổ cứng, hệ điều hành */}
          {/* Màn hình, kích thước, trọng lượng */}
          <div className="grid xl:grid-cols-3 xl:gap-6">
            <div className={divStyle}>
              <label class={labelStyle}>Màn hình</label>
              <select
                {...register("manHinh", {
                  min: 11.6
                })}
                class={inputStyle}>
                {manHinhOption.map((item) =>
                  <option value={item}>{item}</option>
                )}
              </select>
              {errors?.manHinh?.type === "min" && <p className={errorStyle}> Độ phân giải màn hình không được nhỏ hơn 11.6 inch</p>}
            </div>
            <div className={divStyle}>
              <label class={labelStyle}>Kích thước</label>
              <input {...register("kichThuoc", {
                maxLength: 50
              })}
                className={inputStyle} placeholder=""></input>
              {errors?.kichThuoc?.type === "maxLength" && <p className={errorStyle}>Mô tả về kích thước không được vượt quá 100 kí tự</p>}
            </div>
            <div className={divStyle}>
              <label class={labelStyle}>Trọng lượng</label>
              <input
                {...register("trongLuong", {
                  required: true,
                  valueAsNumber: true,
                  max: 6
                })}
                className={inputStyle} />
              {errors?.trongLuong?.type === "required" && <p className={errorStyle}> Trọng lượng không được để trống</p>}
              {errors?.trongLuong?.type === "valueAsNumber" && <p className={errorStyle}> Trọng lượng phải là kiểu số</p>}
              {errors?.trongLuong?.type === "max" && <p className={errorStyle}> Trọng lượng không được vượt quá 6 kg</p>}
            </div>
            {/* Dung lượng RAM */}
            <div className={divStyle}>
              <label class={labelStyle}>Dung lượng RAM</label>
              <select
                {...register("ram", {
                  max: 32
                })}
                className={inputStyle}>
                {dungLuongRAMOption.map((item) =>
                  <option value={item}>{item} GB</option>
                )}
              </select>
              {errors?.ram?.type === "max" && <p className={errorStyle}> Dung lượng ram tối đa không vượt quá 32 GB</p>}
            </div>


            <div className={divStyle}>
              <label class={labelStyle}>Chiết khấu %</label>
              <input {...register("chietKhau", {
                required: true,
                min: 1,
                max: 100
              })}
                className={inputStyle} />
                {errors?.chietKhau?.type === "required" && <p className={errorStyle}> Chiết khấu bắt buộc phải nhập </p>}
                {errors?.chietKhau?.type === "min" && <p className={errorStyle}> Chiết khấu không được dưới 1% </p>}
                {errors?.chietKhau?.type === "max" && <p className={errorStyle}>Chiết khấu không được vượt quá 100% </p>}
            </div>
          </div>

          {/* Kết thúc Màn hình, kích thước, trọng lượng ,ram */}
          {/* Mô tả thêm */}
          <div className={divStyle}>

            <label for="message" class={labelStyle}>Mô tả thêm</label>
            <textarea
              {...register("moTaThem", {
                required: true,
                minLength: 20,
                maxLength: 1000
              })}
              rows="4"
              className={inputStyle}
              placeholder="Your message..."></textarea>
            {errors?.moTaThem?.type === "required" && <p className={errorStyle}> Mô tả thêm bắt buộc phải nhập</p>}
            {errors?.moTaThem?.type === "minLength" && <p className={errorStyle}> Bắt buộc phải nhập từ 20 kí tự trở lên tính tluoon khoảng trống</p>}
            {errors?.moTaThem?.type === "maxLength" && <p className={errorStyle}> Mô tả thêm không được vượt quá 1000 ký tự</p>}

          </div>
          {/* Khu vực nút bấm */}
          <div className="flex justify-center">
            {/* Quan trọng, type = submit */}
            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 
            focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 ">Thêm</button>
            <button type="button" class="focus:outline-none text-white bg-green-700 
            hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg 
            text-sm px-5 py-2.5 mr-2 mb-2 ml-3 ">Kiểm tra</button>
          </div>
        </form>

      </div>
      <script src="./node_modules/flowbite/dist/flowbite.js"></script>
    </div>
  );


}