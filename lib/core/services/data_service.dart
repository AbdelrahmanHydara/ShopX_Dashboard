abstract class DatabaseServices {

  // Add Data to Database
  Future<void> addData({
    String? docId,
    required String path,
    required Map<String, dynamic> data,
  });

  // Get Data from Database
  Future<Map<String, dynamic>> getData({
    required String docId,
    required String path,
  });
}