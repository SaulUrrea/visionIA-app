import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vision_app/infraestructure/firebase/firebase_remote_datasource.dart';

class FirebaseStorageDAO implements FirebaseStorageRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseStorage firebaseStorage;

  FirebaseStorageDAO({
    required this.fireStore,
    required this.firebaseStorage,
  });

  @override
  Future<String> uploadImage(File image) async {
    final fileName = path.basename(image.path);
    final destination = 'uploads/$fileName';

    try {
      final ref = firebaseStorage.ref().child(destination);
      await ref.putFile(image);
      String url = await ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      return 'Error ${e.message}';
    }
  }
}
