import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AmbilData extends StatelessWidget {
  //final String apiUrl = "https://reqres.in/api/users?per_page=15";
  final String apiUrl = "http://192.168.43.166/ci4/public/produk";
  Future<List<dynamic>> _inidatauser() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar ambil data"),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _inidatauser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text('ada data');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
