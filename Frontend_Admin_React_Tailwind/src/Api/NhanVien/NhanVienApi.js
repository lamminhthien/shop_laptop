const axios = require('axios')
const {base_url,backend_main_route,backend_img_route} = require('../config')
//TODO URL chính cho nhân viên
const mainURL= `${base_url}/${backend_main_route.nhanVienBaseURL}`
class NhanVienApi {

     // TODO Lấy danh sách nhân viên
     getListNhanVien ()  {
         const chucNang = 'ListNhanVien'
        return axios.get(`${mainURL}/${chucNang}`)
     }
     themnhanVien (formData) {
         const chucNang = `ThemnhanVien`
        return axios.post(`${mainURL}/${chucNang}`,formData)
     }
}

export default new NhanVienApi();

