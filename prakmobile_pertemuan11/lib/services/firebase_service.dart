import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference cats =
      FirebaseFirestore.instance.collection('kucing');

  //get
  Stream<QuerySnapshot> getCats() {
    return cats.snapshots();
  }

  // post
  Future<void> addCat(String gambar, String nama) async {
    cats.add({'gambar': gambar, 'nama': nama});
  }

  // update
  Future<void> updateCat(String id, String gambar, String nama) async {
    cats.doc(id).update({'gambar': gambar, 'nama': nama});
  }

  // delete
  Future<void> deleteCat(String id) async {
    cats.doc(id).delete();
  }
}
