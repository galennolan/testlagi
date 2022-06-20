import 'package:flutter/material.dart';
import 'package:testlagi/helpers/user_info.dart';
import 'package:testlagi/produk_pagdde.dart';
import 'package:testlagi/tampilanakun.dart';
//import 'package:testlagi/tampilanakun.dart';
import 'package:testlagi/ui/login_page.dart';
import 'package:testlagi/ui/produk_page.dart';
import 'package:testlagi/ui/registrasi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = ProdukPage();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
