import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Maps extends StatefulWidget {
  final String place;
  const Maps({Key key, this.place}) : super(key: key);
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      appBar: AppBar(
        backgroundColor: HexColor('#FFE3EA'),
        elevation: 0,
        iconTheme: IconThemeData(color: HexColor('#EC1C64')),
        title: Text(
          widget.place.toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
        ),
      ),
    );
  }
}
