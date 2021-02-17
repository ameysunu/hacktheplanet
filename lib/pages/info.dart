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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset('images/info.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Wondering what exactly this is? You'll find a range of products which are soon to be expired or products which don't have a huge demand in the market. Don't worry, you will not find a expired product and all the edibles are atleast a week before expiration and the others are atleast a month before expiration.",
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 18,
                    height: 1.5,
                    color: HexColor('#FFE3EA')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "This is to avoid unnecessary wastage of items and to help you save money. If you don't have use for this, then do help the needy and homeless with these products. And yes, they are extremely cheap compared to market rates.",
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 18,
                    height: 1.5,
                    color: HexColor('#FFE3EA')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
