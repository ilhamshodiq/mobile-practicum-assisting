import 'package:flutter/material.dart';

class MenuUtamaPage extends StatelessWidget {
  const MenuUtamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Center(
          child: Text(
            'Praktikum 2',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset('img/mizuho.png'),
          Column(
            children: [
              Text(
                "Ilham Shodiq Mu'arif Billah",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text("200605110072"),
              Text("Praktikum - I")
            ],
          ),
        ],
      )),
    );
  }
}
