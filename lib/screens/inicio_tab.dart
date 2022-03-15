import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/screens/oficinas_tab.dart';

class InicioTab extends StatefulWidget {
  InicioTab({Key? key}) : super(key: key);

  @override
  State<InicioTab> createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab> {
  final List<String> titles = [
    "OFICINAS",
    "LOCALES",
    "BODEGAS",
    "LOTES",
    "CONTACTO",
    "SERVICIOS"
  ];

  final List<Widget> images = [
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        "assets/images/bodega.jpg",
        fit: BoxFit.cover,
      ),
    ),
  ];

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 8,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nos complace tener aquí",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    "¿Ya conoces nuestros servicios? Somos más que una inmobiliaria.",
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                        buildCard(),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCard() => SingleChildScrollView(
      child: Container(
          width: 210,
          height: 100,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("name"),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Bodegas",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("\90")
              ],
            ),
          )),
    );
