import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HexColor('#FFE3EA'),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: HexColor('#FFE3EA'),
            elevation: 0,
            bottom: TabBar(tabs: [
              Tab(
                icon: Text(
                  "Grocery".toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham', color: HexColor('#EC1C64')),
                ),
              ),
              Tab(
                icon: Text(
                  "Accessories".toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham'.toUpperCase(),
                      color: HexColor('#EC1C64')),
                ),
              ),
            ])),
      ),
    );
  }
}
