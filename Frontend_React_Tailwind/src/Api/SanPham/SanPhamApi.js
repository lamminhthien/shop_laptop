const axios = require('axios')
const { base_url, backend_main_route, backend_img_route, configJWT } = require('../config')
    //TODO URL chính cho sản phẩm
const mainURL = `${base_url}/${backend_main_route.sanPhamBaseURL}`
class SanPhamApi {

    // TODO Lấy danh sách  sản phẩm và tổng số trang cần phân trang
    getListSanPham(pageNumber) {
            const chucNang = 'ListSanPham'
            return axios.get(`${mainURL}/${chucNang}/${pageNumber}`, configJWT)
        }
        // TODO Lấy chi tiết sản phẩm
    getDetailSanPham(id) {
            const chucNang = 'DetailSanPham'
            return axios.get(`${mainURL}/${chucNang}/${id}`, configJWT)
        }
        // TODO Cập nhật sản phẩm
    editSanPham(id, data) {
        const chucNang = 'CapNhatSanPham'
        return axios.put(`${mainURL}/${chucNang}/${id}`, data, configJWT)
    }

}

export default new SanPhamApi();