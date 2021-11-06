import 'dart:io';

import 'package:vision_app/domain/repository/firebase_repository.dart';
import 'package:vision_app/infraestructure/firebase/firebase_remote_datasource.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseStorageRemoteDataSource remoteStorageDataSource;

  FirebaseRepositoryImpl({
    required this.remoteStorageDataSource,
  });

  @override
  Future<String> uploadImage(File image) async =>
      await remoteStorageDataSource.uploadImage(image);
}
