import 'package:flutter/material.dart';

AppBar appBarWidget(
    BuildContext context, String title, String page, String tipo) {
  switch (tipo) {
    case 'home':
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade300,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, page);
            },
          ),
        ],
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
    default:
      return AppBar();
  }
}
