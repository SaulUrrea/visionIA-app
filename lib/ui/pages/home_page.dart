import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_app/ui/widgets/appBar.dart';
import 'package:vision_app/ui/widgets/theme/images.dart';
import 'package:vision_app/ui/widgets/theme/style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Color backgroudColor = Color(0xff392850);

    return Scaffold(
        backgroundColor: backgroudColor,
        appBar: appBarWidget(context, 'home', 'history', 'home'),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sistema de inteligencia artifical',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Inicio',
                        style: textStyleOpenSans,
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Image.asset(assetIconNotification),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            cardItemsWidget(assetIconDog, assetBannerDog,
                'Detector de mascotas', 'mascotas'),
            SizedBox(
              height: 10,
            ),
            cardItemsWidget(assetIconFlowers, assetBannerFlowers,
                'Detector de plantas', 'plantas'),
            cardItemsWidget(assetIconFlowers, assetBannerAugmentedReality,
                'Realidad aumentada', 'vr'),
          ],
        ));
  }

  Widget cardItemsWidget(String assetIconDog, String assetBannerDog,
      String titulo, String pagina) {
    final Color backgroudCardColor = Color(0xff453658);

    return Container(
      width: MediaQuery.of(context).size.height * 0.45,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: backgroudCardColor,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, pagina);
              print(pagina);
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: AssetImage(assetBannerDog),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    assetIconDog,
                    width: 42,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(titulo, style: textStyleOpenSans),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Inteligencia artificial', style: textStyleOpenSansBold),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Nuevo', style: textStyleOpenSansBoldWhite)
                ],
              ),
            ),
          )),
    );
  }
}
