// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:visionia_app/Widgets/Bar/BarWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BarWidgets.BarOne();
  }
}
