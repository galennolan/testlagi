import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Beranda extends StatelessWidget {
  const Beranda({
    Key? key,
  }) : super(key: key);

  final String url = 'http://192.168.21.166/toko-api/public/produk';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));

    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Aplikasi baru'),
            ),
            body: FutureBuilder(
                future: getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Sukses');
                  } else {
                    return Text('Data Error');
                  }
                })));
  }
}
