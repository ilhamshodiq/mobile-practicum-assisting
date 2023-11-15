import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan11/services/firebase_service.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "List KOCCHEENGGs",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _showAddDialog(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(
                Duration(seconds: 1)); //cuma buat gaya gayaan doang wkwk
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirestoreService().getCats(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        List userList = snapshot.data!.docs;
                        return Column(
                          children: userList.map((documentSnapshot) {
                            Map<dynamic, dynamic> data = documentSnapshot.data()
                                as Map<dynamic, dynamic>;
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Material(
                                color: Colors.purple[50],
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          data['gambar'].toString(),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data['nama'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.indigo,
                                                ),
                                                onPressed: () {
                                                  _showEditDialog(
                                                      context,
                                                      documentSnapshot.id,
                                                      data['nama'],
                                                      data['gambar']);
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  FirestoreService().deleteCat(
                                                    documentSnapshot.id,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add KOCCHEENGG'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _gambarController,
                  decoration: InputDecoration(labelText: 'URL Gambar'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                FirestoreService().addCat(
                  _gambarController.text,
                  _namaController.text,
                );
                _namaController.clear();
                _gambarController.clear();

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, String docId, String currentNama,
      String currentGambar) {
    TextEditingController _editNamaController =
        TextEditingController(text: currentNama);
    TextEditingController _editGambarController =
        TextEditingController(text: currentGambar);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit KOCCHEENGG'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _editNamaController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _editGambarController,
                  decoration: InputDecoration(labelText: 'URL Gambar'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                FirestoreService().updateCat(
                  docId,
                  _editGambarController.text,
                  _editNamaController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
