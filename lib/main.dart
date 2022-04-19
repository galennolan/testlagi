import 'package:flutter/material.dart';
import 'package:testlagi/produk_page.dart';
import 'package:testlagi/tampilanakun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      debugShowCheckedModeBanner: false,
      home: AmbilData(),
    );
  }
}
