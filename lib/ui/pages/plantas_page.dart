import 'package:flutter/material.dart';
import 'package:vision_app/ui/widgets/appBar.dart';

class PlantasPage extends StatefulWidget {
  PlantasPage({Key? key}) : super(key: key);

  @override
  _PlantasPageState createState() => _PlantasPageState();
}

class _PlantasPageState extends State<PlantasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Mascotas', 'home', 'page2'),
      body: Center(
        child: Text('Plantas'),
      ),
    );
  }
}
