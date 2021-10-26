// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visionia_app/Utils/AssetsImages.dart';
import 'package:visionia_app/Widgets/Bar/BarWidgets.dart';
import 'package:visionia_app/Widgets/GridDashboard/griddashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xff392850),
          appBar: BarWidgets.BarOne(context),
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sistema de inteligencia artifical",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Inicio",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Color(0xffa29aac),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: AssetsImages.ImageNotification(),
                      //icon: Image.asset("assets/images/notification.png"),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GridDashboard()
            ],
          )),
    );
  }
}
/*
Stack(
          children: [
            Container(
              color: Colors.blueAccent,
            )
          ],
        ),
        */