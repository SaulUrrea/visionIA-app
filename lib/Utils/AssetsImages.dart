// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AssetsImages {
  static final path = "assets/images/";

  static Image ImageLogo() {
    return Image.asset("${path}ic_launcher.png");
  }

  static Image ImageLauncher() {
    return Image.asset("${path}ic_launcher.png");
  }

  static AssetImage ImageBackgraund1() {
    return AssetImage("${path}Fondo1.jpg");
  }
}
