import 'package:flutter/material.dart';
import 'package:vision_app/ui/widgets/appBar.dart';

class VirtualRealityPage extends StatefulWidget {
  VirtualRealityPage({Key? key}) : super(key: key);

  @override
  _VirtualRealityPageState createState() => _VirtualRealityPageState();
}

class _VirtualRealityPageState extends State<VirtualRealityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'VirtualReality', 'home', 'page2'),
      body: Center(
        child: Text('VirtualReality'),
      ),
    );
  }
}
