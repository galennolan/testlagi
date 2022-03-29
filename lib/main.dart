import 'package:testlagi/produk_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Aplikasi Flutter Pertama",
      home: ProdukForm(),
    );
  }
}
