import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan4/model/kucing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Koccheng kocheenggg',
            style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: dataKucing.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(dataKucing[index].gambar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(dataKucing[index].nama,
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_rounded, size: 20),
                            const SizedBox(width: 2),
                            Text(
                              dataKucing[index].tanggal,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
