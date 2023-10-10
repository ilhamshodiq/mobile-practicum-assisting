import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan5/view/detail_page.dart';
import 'package:prakmobile_pertemuan5/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 5',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      )),
      home: HomePage(),
    );
  }
}
