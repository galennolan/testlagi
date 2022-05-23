import 'dart:convert';

import 'package:testlagi/helpers/api.dart';
import 'package:testlagi/helpers/api_url.dart';
import 'package:testlagi/model/produk.dart';
import 'package:http/http.dart' as http;

class ProdukBloc {
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> produks = [];
    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }
    return produks;
  }

  static Future addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk!.id);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({required int id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    print(response.toString());
    return (jsonObj as Map<String, dynamic>)['data'];
  }

  Future<Produk> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(
          'http://7725-2001-448a-402b-1799-2907-7300-5777-4294.ngrok.iohttps://b7055fa57c51.ngrok.io/toko-api/public/produk/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise `snapshot.hasData`
      // will always return false on `FutureBuilder`.
      return Produk.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete Produk.');
    }
  }
}
