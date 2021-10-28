import 'package:flutter/material.dart';
import 'package:vision_app/ui/widgets/appBar.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Historial', 'home', 'page2'),
      body: Center(
        child: Text('History'),
      ),
    );
  }
}
