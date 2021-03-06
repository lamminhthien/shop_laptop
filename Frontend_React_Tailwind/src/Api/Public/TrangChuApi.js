const axios = require('axios')
const mainURL = `https://localhost:7216/api/TrangChu`

class TrangChuApi {
    getListLoaiSanPham() {
        return axios.get(`${mainURL}/ListLoaiSanPham`)
    }

    getListHangSanXuat() {
        return axios.get(`${mainURL}/ListHangSanXuat`)
    }

    getSanPhamByDefault(page) {
        if (page === undefined) page = 1
        return axios.get(`${mainURL}/ListSanPhamDefault?page=${page}`)
    }

    getSanPhamByCategory(id) {
        return axios.get(`${mainURL}/SanPhamByCategory/?id=${id}`)
    }

    getSanPhamByBrand(id) {
        return axios.get(`${mainURL}/SanPhamByBrand/?id=${id}`)
    }
    getSanPhamBySearchKey(stringKey) {
        return axios.get(`${mainURL}/timKiemTheoTuKhoa/?searchKey=${stringKey}`)
    }
    getSanPhamByAdvanceSearch(params) {
        return axios.get(`${mainURL}/timKiemTheoNhieuTieuChi${params}`)
    }

}

export default new TrangChuApi();