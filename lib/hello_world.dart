import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Flutter'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
