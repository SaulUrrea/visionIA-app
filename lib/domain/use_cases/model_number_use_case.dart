import 'package:tflite/tflite.dart';

class Recognizer {
  Future loadModel() {
    Tflite.close();
    return Tflite.loadModel(
        model: 'assets/models/numeros/mnist.tflite',
        labels: 'assets/models/numeros/mnist.txt');
  }
}
