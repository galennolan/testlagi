class Produk {
  int id;
  String kodeProduk;
  String namaProduk;
  int hargaProduk;

  Produk(
      {required this.id,
      required this.kodeProduk,
      required this.namaProduk,
      required this.hargaProduk});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
        id: json['id'],
        kodeProduk: json['kode_produk'],
        namaProduk: json['nama_produk'],
        hargaProduk: json['harga']);
  }
}
