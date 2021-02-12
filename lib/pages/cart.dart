import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#FFE3EA'),
        iconTheme: IconThemeData(color: HexColor('#EC1C64')),
        title: Text(
          "Cart".toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
        ),
      ),
    );
  }
}
