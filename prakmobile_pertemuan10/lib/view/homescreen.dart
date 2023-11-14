import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan10/firebase_service.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "List User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getCats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      List userList = snapshot.data!.docs;
                      return SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shrinkWrap: true,
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  userList[index];

                              Map<dynamic, dynamic> data = documentSnapshot
                                  .data() as Map<dynamic, dynamic>;

                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Material(
                                    color: Colors.purple[50],
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(data['gambar'].toString(), width: 300,),
                                          Text(data['nama']),                                          
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
