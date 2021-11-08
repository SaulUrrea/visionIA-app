import 'dart:typed_data';

import 'package:dialogflow_grpc/generated/google/protobuf/struct.pb.dart';
import 'package:flutter/material.dart';
import 'package:vision_app/Models/prediction.dart';
import 'package:vision_app/Models/recognizer.dart';
import 'package:vision_app/ui/widgets/appBar.dart';
import 'package:vision_app/ui/widgets/drawing_painter.dart';
import 'package:vision_app/ui/widgets/prediction_widget.dart';
import 'package:vision_app/ui/widgets/theme/constants.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  //final _points = List<Offset>();
  final List<Offset?> _points = [];

  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  //late  _prediction;
  bool initialize = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Digit', 'home', 'page5'),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'MNIST database of handwritten digits',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'The digits have been size-normalized and centerd in fixed-size  images (28x28)')
                  ],
                ),
              )),
              _drawCanvasWidget()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _mnistPreviewImage(),
          const SizedBox(
            height: 10,
          ),
          PredictionWidget(
            predictions: _prediction,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            _points.clear();
            _prediction.clear();
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
          _points.add(null);
          _recognize();
        },
        child: CustomPaint(
          painter: DrawingPainter(_points),
        ),
      ),
    );
  }

  Widget _drawCanvasWidget() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.black,
      child: FutureBuilder(
        future: _previewImage(),
        builder: (BuildContext _, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.hasData) {
            return Image.memory(
              snapshot.data!,
              fit: BoxFit.fill,
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }

  void _initModel() async {
    var res = await _recognizer.loadModel();
    print(res);
  }

  Future<Uint8List> _previewImage() async {
    return await _recognizer.previewImage(_points);
  }

  void _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    print(pred);
    setState(() {
      _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    });
  }
}
