import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:vision_app/domain/repository/firebase_repository.dart';
import 'package:vision_app/domain/repository/tflite_repository.dart';
import 'package:vision_app/domain/use_cases/load_model_use_case.dart';
import 'package:vision_app/domain/use_cases/upload_image_use_case.dart';
import 'package:vision_app/infraestructure/firebase/dao/firebase_storage.dart';
import 'package:vision_app/infraestructure/firebase/firebase_remote_datasource.dart';
import 'package:vision_app/infraestructure/firebase/firebase_repository_impl.dart';
import 'package:vision_app/infraestructure/tensorflow/tensorflow_repository_impl.dart';
import 'package:vision_app/ui/bloc/cubit/tfmodel_cubit.dart';
import 'package:vision_app/ui/bloc/cubit/uploadimage_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  sl.registerFactory<TfmodelCubit>(
      () => TfmodelCubit(runModelAIUseCas: sl.call()));
  sl.registerFactory<UploadimageCubit>(
      () => UploadimageCubit(uploadImageUseCase: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(
        remoteStorageDataSource: sl.call(),
      ));
  sl.registerLazySingleton<TFliteRepository>(() => TensorFlowRepositoryImpl());
  sl.registerLazySingleton<TensorFlowRepositoryImpl>(
      () => TensorFlowRepositoryImpl());

  //remote data
  sl.registerLazySingleton<FirebaseStorageRemoteDataSource>(() =>
      FirebaseStorageDAO(fireStore: sl.call(), firebaseStorage: sl.call()));

  //Use Case
  sl.registerLazySingleton(() => RunModelAIUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UploadImageUseCase(repository: sl.call()));

  //External
  final fireStore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => firebaseStorage);
}
