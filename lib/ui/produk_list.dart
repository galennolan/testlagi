import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProduList extends StatefulWidget {
  @override
  _ProduListState createState() => _ProduListState();
}

class _ProduListState extends State<ProduList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Aplikasi Cui'),
    ));
  }
}
