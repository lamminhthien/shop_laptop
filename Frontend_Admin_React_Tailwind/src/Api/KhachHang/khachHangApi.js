const axios = require('axios')
const {base_url,backend_main_route} = require('../config')
//TODO URL chính cho khách hàng
const mainURL = `${base_url}/${backend_main_route.khachHangBaseURL}`
class KhachHangApi {
    getListKhachHang = (pageNumber) => {
        const chucNang = `ListKhachHang`
        return axios.get(`${mainURL}/${chucNang}/${pageNumber}`)
    }
}
export default new KhachHangApi()