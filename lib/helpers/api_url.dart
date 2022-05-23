class ApiUrl {
  static const String baseUrl = 'http://local4.ngrok.io';

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl + '/produk';
  static const String createProduk = baseUrl + '/produk';
//menyimpan alamat alamat api
  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProduk(int id) {
    return baseUrl + '/produk' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk' + id.toString();
  }
}
