import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as b;
import 'storage_service.dart';

class FireStorageService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  // Uploads a file to Firebase Storage and returns the download URL
  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileReference = storageRef.child('$path/$fileName.$extensionName');
    await fileReference.putFile(file);
    var fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}