import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepository {
  final FirebaseFirestore collections = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Stream<QuerySnapshot> snapshots(String collectionName) {
    return collections.collection(collectionName).snapshots();
  }

  Future<void> addImage(dynamic image) async {
    //await collections.collection('').add(data);
    await _storage
        .ref()
        .child('imagessss')
        .putFile(File(image.path))
        .then((p0) => print(p0.ref.getDownloadURL()));
  }

  Future<bool> addData(
      String collectionName, Map<String, dynamic> data, dynamic image) async {
    String link = '';
    String id = '';
    try {
      await collections
          .collection(collectionName)
          .add(data)
          .then((value) => id = value.id);
      await _storage
          .ref()
          .child(id)
          .putFile(File(image.path))
          .then((p0) async => link = await p0.ref.getDownloadURL());
      await collections
          .collection(collectionName)
          .doc(id)
          .update({'image': link});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateData(String collectionName, String documentID,
      Map<String, dynamic> data) async {
    await collections.collection(collectionName).doc(documentID).update(data);
  }

  Future<void> deleteData(String collectionName, String documentID) async {
    await collections.collection(collectionName).doc(documentID).delete();
  }
}
