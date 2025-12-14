import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_service.dart';

class FireStoreService implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Add Data to Database
  @override
  Future<void> addData({
    String? docId,
    required String path,
    required Map<String, dynamic> data,
  }) async {
    if (docId != null) {
      firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  // Get Data from Database
  @override
  Future<Map<String, dynamic>> getData({
    String? docId,
    required String path,
  }) async {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data()!;
  }
}