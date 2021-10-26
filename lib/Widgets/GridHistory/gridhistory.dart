import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridHistory extends StatelessWidget {
  Items item1 = Items(
      title: "Detector de Mascotas",
      subtitle: "Inteligencia artificial",
      event: "Nuevo",
      img: "assets/images/perro.png",
      background: "assets/images/Opcion1.png");
  Items item2 = Items(
      title: "Detector de Plantas",
      subtitle: "Inteligencia artificial",
      event: "Nuevo",
      img: "assets/images/planta.png",
      background: "assets/images/Opcion2.png");
  Items item3 = Items(
      title: "Detector de Mascotas",
      subtitle: "Inteligencia artificial",
      event: "Nuevo",
      img: "assets/images/perro.png",
      background: "assets/images/Opcion1.png");
  Items item4 = Items(
      title: "Detector de Plantas",
      subtitle: "Inteligencia artificial",
      event: "Nuevo",
      img: "assets/images/planta.png",
      background: "assets/images/Opcion2.png");
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 100) / 2;
    final double itemWidth = size.width / 2;
    return Flexible(
        child: GridView.count(
      childAspectRatio: 1.0,
      //childAspectRatio: (itemWidth / itemHeight),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      crossAxisCount: 2, // Numero de colubnas
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: myList.map((data) {
        return Container(
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage(data.background),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                data.img,
                width: 42,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(data.title,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600))),
              const SizedBox(
                height: 8,
              ),
              Text(data.subtitle,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                          fontWeight: FontWeight.w600))),
              const SizedBox(
                height: 8,
              ),
              Text(data.event,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)))
            ],
          ),
        );
      }).toList(),
    ));
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  String background;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img,
      required this.background});
}
