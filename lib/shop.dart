import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacktheplanet/pages/accessories.dart';
import 'package:hacktheplanet/pages/grocery.dart';
import 'package:hacktheplanet/pages/info.dart';
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
          centerTitle: true,
          title: Text(
            "Thrift Shopping".toUpperCase(),
            style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: HexColor('#FFE3EA'),
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.bag_fill, color: HexColor('#EC1C64')),
                  Text(
                    "Grocery".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Gotham', color: HexColor('#EC1C64')),
                  ),
                ],
              ),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.paintbrush_fill,
                      color: HexColor('#EC1C64')),
                  Text(
                    "Accessories".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Gotham'.toUpperCase(),
                        color: HexColor('#EC1C64')),
                  ),
                ],
              ),
            ),
          ]),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.info_circle_fill,
                  color: HexColor('#EC1C64')),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Info()));
              },
            )
          ],
        ),
        body: TabBarView(
          children: [Grocery(), Accessories()],
        ),
      ),
    );
  }
}
