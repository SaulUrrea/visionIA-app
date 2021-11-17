import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vision_app/Models/prediction.dart';
import 'package:vision_app/Models/recognizer.dart';
import 'package:vision_app/ui/widgets/appBar.dart';
import 'package:vision_app/ui/widgets/drawing_painter.dart';
import 'package:vision_app/ui/widgets/theme/constants.dart';
import 'package:vision_app/ui/widgets/theme/style.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  final List<Offset?> _points = [];

  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  bool initialize = false;

  @override
  void initState() {
    super.initState();
    _initModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Digit', 'home', 'page5'),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dibuje su numero', style: titleStyleBlack),
            const SizedBox(
              height: 20,
            ),
            _mnistPreviewImage(),
            const SizedBox(
              height: 10,
            ),
            _predictionText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            _points.clear();
            _prediction = [];
          });
        },
      ),
    );
  }

  Widget _mnistPreviewImage() {
    return Container(
      width: Constants.canvasSize + Constants.borderSize * 2,
      height: Constants.canvasSize + Constants.borderSize * 2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: Constants.borderSize)),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          Offset _localPosotion = details.localPosition;
          if (_localPosotion.dx >= 0 &&
              _localPosotion.dx <= Constants.canvasSize &&
              _localPosotion.dy >= 0 &&
              _localPosotion.dy <= Constants.canvasSize) {
            setState(() {
              _points.add(_localPosotion);
            });
          }
        },
        onPanEnd: (DragEndDetails details) {
          _recognize();
        },
        child: CustomPaint(
          painter: DrawingPainter(_points),
        ),
      ),
    );
  }

  void _initModel() async {
    var res = await _recognizer.loadModel();
  }

  Future<Uint8List> _previewImage() async {
    return await _recognizer.previewImage(_points);
  }

  void _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    setState(() {
      _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    });
  }

  Widget _predictionText() {
    if (_prediction.isNotEmpty && _prediction[0].label != null) {
      var porcentaje = _prediction.first.confidence * 100;
      return Text(
        'Seguro en un: ${porcentaje.toStringAsFixed(2)}% de que es un: ${_prediction.first.label}',
        style: TextStyle(
          fontSize: 20,
        ),
      );
    } else {
      return Container();
    }
  }
}
