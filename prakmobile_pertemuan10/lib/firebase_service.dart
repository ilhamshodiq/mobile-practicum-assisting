import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference cats = FirebaseFirestore.instance.collection('kucing');
  Stream<QuerySnapshot> getCats(){
    return cats.snapshots();
  }
}