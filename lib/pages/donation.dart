import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Donation extends StatefulWidget {
  final String title;
  Donation({Key key, this.title}) : super(key: key);
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      appBar: AppBar(
        iconTheme: IconThemeData(color: HexColor('#EC1C64')),
        backgroundColor: HexColor('#FFE3EA'),
        elevation: 0,
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
        ),
      ),
    );
  }
}
