import 'package:flutter/material.dart';
import 'package:vision_app/Models/prediction.dart';

class PredictionWidget extends StatelessWidget {
  final List<Prediction> predictions;
  const PredictionWidget({Key? key, required this.predictions})
      : super(key: key);

  Widget _numberWidget(int num, Prediction prediction) {
    return Column(
      children: [
        Text(
          '$num',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: prediction == null
                ? Colors.black
                : Colors.amber.shade700.withOpacity(
                    (prediction.confidence * 2).clamp(0, 1).toDouble(),
                  ),
          ),
        ),
        Text(
          prediction == null ? '' : prediction.confidence.toStringAsFixed(3),
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  List<dynamic> getPredictionStyles(List<Prediction> predictions) {
    List<dynamic> data = [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null
    ];

    predictions?.forEach((prediction) {
      data[prediction.index] = prediction;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var styles = getPredictionStyles(predictions);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < 5; i++) _numberWidget(i, styles[i])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 5; i < 10; i++) _numberWidget(i, styles[i])
          ],
        )
      ],
    );
  }
}
