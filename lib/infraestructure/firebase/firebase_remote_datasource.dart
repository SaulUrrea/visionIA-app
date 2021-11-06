import 'dart:io';

abstract class FirebaseStorageRemoteDataSource {
  Future<String> uploadImage(File image);
}
