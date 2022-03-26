import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar kkkk'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
