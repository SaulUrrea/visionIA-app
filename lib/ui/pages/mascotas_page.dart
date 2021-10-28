import 'package:flutter/material.dart';
import 'package:vision_app/ui/widgets/appBar.dart';

class MascotasPage extends StatefulWidget {
  MascotasPage({Key? key}) : super(key: key);

  @override
  _MascotasPageState createState() => _MascotasPageState();
}

class _MascotasPageState extends State<MascotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Mascotas', 'home', 'page2'),
      body: Center(
        child: Text('Mascotas'),
      ),
    );
  }
}
