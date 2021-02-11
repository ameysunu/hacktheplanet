import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Items extends StatefulWidget {
  final String title, head, price, place;
  const Items({Key key, this.title, this.head, this.price, this.place})
      : super(key: key);
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3EA'),
      appBar: AppBar(
        iconTheme: IconThemeData(color: HexColor('#EC1C64')),
        backgroundColor: HexColor('#FFE3EA'),
        elevation: 0,
        title: Text(
          widget.head,
          style: TextStyle(fontFamily: 'Gotham', color: HexColor('#EC1C64')),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                print("Cart pressed");
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor('#EC1C64')),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Image.asset('images/food.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text(
                          "Fresh Tomatoes\n\nUSD 5.0\n\nEvergreen Marketplace",
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            color: HexColor('#FFE3EA'),
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
