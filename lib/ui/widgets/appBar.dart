import 'package:flutter/material.dart';

AppBar appBarWidget(
    BuildContext context, String title, String page, String tipo) {
  switch (tipo) {
    case 'home':
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('V I S I O N  I A'),
      );
    case 'page2':
      return AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('V I S I O N  I A | $title'),
      );
    case 'page3':
      return AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text('V I S I O N  I A | $title'),
      );
    case 'page4':
      return AppBar(
        backgroundColor: Colors.green[300],
        centerTitle: true,
        title: Text('V I S I O N  I A | $title'),
      );
    case 'page5':
      return AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('V I S I O N  I A | $title'),
      );
    default:
      return AppBar();
  }
}
