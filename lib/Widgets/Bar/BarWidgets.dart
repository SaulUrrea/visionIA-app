// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class BarWidgets {
  static AppBar BarOne() {
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
          onPressed: () {},
          icon: const Icon(Icons.history),
        )
      ],
    );
  }
}
