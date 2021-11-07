class Prediction {
  final double confidence;
  final int index;
  final String label;

  Prediction(
      {required this.confidence, required this.index, required this.label});

  factory Prediction.fromJson(Map<dynamic, dynamic> json) {
    return Prediction(
        confidence: json['confidence'],
        index: json['index'],
        label: json['label']);
  }
}
