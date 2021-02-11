import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart' as home;

final firestoreInstance = FirebaseFirestore.instance;

class Items extends StatefulWidget {
  final String title, head, price, place;
  const Items({Key key, this.title, this.head, this.price, this.place})
      : super(key: key);
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  void initState() {
    super.initState();
    if (widget.head == "Vegetable and Fruits") {
      home.vegStream = firestoreInstance.collection('veggies').snapshots();
    } else if (widget.head == "Grain and Bread") {
      home.vegStream = firestoreInstance.collection('grains').snapshots();
    } else if (widget.head == "Milk Products") {
      home.vegStream = firestoreInstance.collection('milk').snapshots();
    } else if (widget.head == "Non Vegetarian") {
      home.vegStream = firestoreInstance.collection('nonveg').snapshots();
    } else if (widget.head == "Fast Food") {
      home.vegStream = firestoreInstance.collection('fast').snapshots();
    } else if (widget.head == "Vegan Options") {
      home.vegStream = firestoreInstance.collection('vegan').snapshots();
    }
  }

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
      body: Container(
        child: Container(
          child: StreamBuilder(
            stream: home.vegStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var totalgroupCount = 0;
              List<DocumentSnapshot> groupUsers;
              if (snapshot.hasData) {
                groupUsers = snapshot.data.documents;
                totalgroupCount = groupUsers.length;
                return (Container(
                  child: ListView.builder(
                      itemCount: groupUsers.length,
                      itemBuilder: (context, int index) {
                        return SingleChildScrollView(
                          child: Padding(
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Image.asset('images/food.png')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Text(
                                          groupUsers[index].data()['title'] +
                                              "\n\n" +
                                              groupUsers[index]
                                                  .data()['price'] +
                                              "\n\n" +
                                              groupUsers[index].data()['place'],
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
                        );
                      }),
                ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

/*
 if (halfyear.groupvalue == 'CS') {
      halfyear.newStream = FirebaseFirestore.instance
          .collection('students')
          .where('group', isEqualTo: "CS")
          .snapshots();
    } else if (halfyear.groupvalue == 'JS') {
      halfyear.newStream = FirebaseFirestore.instance
          .collection('students')
          .where('group', isEqualTo: "JS")
          .snapshots();
    } 
*/