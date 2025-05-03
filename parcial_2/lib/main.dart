import 'package:flutter/material.dart';
import 'presentation/pegas/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListPage(),
    );
  }
}
