import 'dart:io';

import 'package:tflite/tflite.dart';

class RunModelMascotUseCase {
  Future<String> runMascotModel(File image) async {
    try {
      String? res = await Tflite.loadModel(
        model: 'assets/models/model_unquant.tflite',
        labels: 'assets/models/labels.txt',
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      print('Se inicializo el modelo, $res');
    } catch (e) {
      print('Error al inicializar el modelo: $e');
    }
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
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
