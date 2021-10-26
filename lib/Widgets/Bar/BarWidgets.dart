// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visionia_app/MainScreens/pagehistory/historyScreen.dart';

class BarWidgets {
  static AppBar BarOne(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff90CAF9),
      elevation: 0,
      title: const Text("V I S I O N  I A"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()));
          },
          icon: const Icon(Icons.history),
        )
      ],
    );
  }
}
