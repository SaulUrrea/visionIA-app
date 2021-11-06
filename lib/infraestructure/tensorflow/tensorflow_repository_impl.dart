import 'dart:io';

import 'package:tflite/tflite.dart';
import 'package:vision_app/domain/repository/tflite_repository.dart';

class TensorFlowRepositoryImpl implements TFliteRepository {
  @override
  Future<String> runTensorFlowModel(
      {required File image,
      required String assetModel,
      required String assetLabels}) async {
    try {
      await Tflite.loadModel(
        model: assetModel,
        labels: assetLabels,
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
    } catch (e) {
      throw UnimplementedError();
    }
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 4,
      threshold: 0.2,
      asynch: true,
    );

    String label =
        recognitions?[0]['label'].toString().substring(2) ?? 'No se reconoció';
    print('Se reconoció: $label');
    Tflite.close();
    return label;
  }
}
