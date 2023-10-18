import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan7/view/testreqres.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 7',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      )),
      home: TestReqresPage(),
    );
  }
}
