import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Food extends StatefulWidget {
  final String title, price, place, image;
  const Food({Key key, this.title, this.price, this.place, this.image})
      : super(key: key);
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#CD96EB'),
      appBar: AppBar(
        backgroundColor: HexColor('#CD96EB'),
        elevation: 0,
        iconTheme: IconThemeData(color: HexColor('#41135E')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 20,
                  color: HexColor('#41135E')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.place,
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 17,
                  color: HexColor('#FFFFFF')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.network(widget.image),
              ),
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white),
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    widget.price,
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 18,
                        color: HexColor('#41135E')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: HexColor('#CD96EB'))),
                        onPressed: () {
                          null;
                        },
                        color: HexColor('#CD96EB'),
                        textColor: HexColor('#FFFFFF'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("Add to Cart".toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: HexColor('#41135E'))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
