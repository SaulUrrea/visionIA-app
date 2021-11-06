import 'dart:io';

import 'package:vision_app/domain/repository/firebase_repository.dart';

class UploadImageUseCase {
  final FirebaseRepository repository;

  UploadImageUseCase({required this.repository});
  Future<String> call(File image) async {
    return repository.uploadImage(image);
  }
}
