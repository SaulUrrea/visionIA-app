import 'dart:io';

import 'package:vision_app/domain/repository/tflite_repository.dart';

class RunModelAIUseCase {
  final TFliteRepository repository;

  RunModelAIUseCase({required this.repository});

  Future<String> call(
      {required File image,
      required String assetModel,
      required String assetLabels}) async {
    return repository.runTensorFlowModel(
        image: image, assetModel: assetModel, assetLabels: assetLabels);
  }
}
