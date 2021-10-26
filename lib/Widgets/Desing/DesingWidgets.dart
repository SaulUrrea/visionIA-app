// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignWidgets {
  static LinearGradient linearGradient(BuildContext context) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColorLight,
          Theme.of(context).primaryColor
        ]);
  }

  static RichText tittleCustom() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Vision',
          style: GoogleFonts.portLligatSans(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white60),
          children: const [
            TextSpan(
                text: "IA", style: TextStyle(color: Colors.white, fontSize: 30))
          ]),
    );
  }
}
