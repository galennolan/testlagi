import 'package:flutter/material.dart';
import 'package:testlagi/tampilanakun.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: AmbilData()));
  }
}
