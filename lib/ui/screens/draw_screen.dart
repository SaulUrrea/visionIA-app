import 'package:flutter/material.dart';
import 'package:vision_app/Models/recognizer.dart';
import 'package:vision_app/ui/widgets/appBar.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  final _recognizer = Recognizer();

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {},
      ),
    );
  }

  void _initModel() async {
    var res = await _recognizer.loadModel();
    print(res);
  }
}
