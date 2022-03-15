import 'package:flutter/material.dart';
import 'package:web_app/models/user.dart';
import 'package:web_app/screens/bodegas_tab.dart';
import 'package:web_app/screens/lotes_tab.dart';
import 'package:web_app/screens/oficinas_tab.dart';
import 'package:web_app/screens/inicio_tab.dart';
import 'package:web_app/screens/locales_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 0, 14, 73),
          title: SizedBox(
            height: 50,
            child: Image.asset(
              "assets/images/rozologo3.png",
              width: 1280,
              height: 1000,
            ),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Inicio",
            ),
            Tab(
              text: "Oficinas",
            ),
            Tab(
              text: "Locales",
            ),
            Tab(
              text: "Bodegas",
            ),
            Tab(
              text: "Lotes",
            ),
            Tab(
              text: "Contacto",
            ),
            Tab(
              text: "Servicios",
            ),
          ]),
        ),
        body: TabBarView(children: [
          Center(child: InicioTab()),
          const Center(child: OficinasTab()),
          Center(child: LocalesTab()),
          Center(child: BodegasTab()),
          Center(child: LotesTab()),
          const Center(
            child: Text("Contacto"),
          ),
          const Center(
            child: Text("Servicios"),
          ),
        ]),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(user.image),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.userName,
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isSelled = !user.isSelled;
              });
            },
            child: AnimatedContainer(
              height: 200,
              width: 110,
              duration: const Duration(microseconds: 100),
              decoration: BoxDecoration(
                color: user.isSelled ? Colors.white : Colors.green,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: user.isSelled ? Colors.transparent : Colors.black),
              ),
              child: Center(
                child: Text(
                  user.isSelled ? "Arriendo" : "Venta",
                  style: TextStyle(
                      color: user.isSelled ? Colors.transparent : Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
