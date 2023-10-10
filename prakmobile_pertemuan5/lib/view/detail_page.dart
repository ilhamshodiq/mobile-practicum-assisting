import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan5/model/kucing.dart';

class DetailPage extends StatelessWidget {
  final Kucing dataKucing;

  const DetailPage({super.key, required this.dataKucing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Kocheengg Post', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: AssetImage(dataKucing.gambar), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(dataKucing.nama,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    dataKucing.tanggal,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    dataKucing.deskripsi,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
