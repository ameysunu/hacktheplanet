import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EC1C64'),
      appBar: AppBar(
        backgroundColor: HexColor('#EC1C64'),
        elevation: 0,
        title: Text(
          "What is this?".toUpperCase(),
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#FFE3EA')),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('images/info.png'),
            ),
          ),
        ],
      ),
    );
  }
}
