import 'dart:io';

abstract class FirebaseRepository {
  Future<String> uploadImage(File image);
}
