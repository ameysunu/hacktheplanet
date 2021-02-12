import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final firestoreInstance = FirebaseFirestore.instance;
AsyncSnapshot<DocumentSnapshot> snapshot;
Stream<QuerySnapshot> cartStream;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    cartStream = firestoreInstance.collection('cart').snapshots();
  }

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
      body: Container(
        child: Container(
          child: StreamBuilder(
            stream: cartStream,
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
                              color: HexColor('#EC1C64'),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Image.network(groupUsers[index]
                                              .data()['image']),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                            groupUsers[index].data()['title'] +
                                                "\n\n" +
                                                groupUsers[index]
                                                    .data()['price'],
                                            style: TextStyle(
                                                fontFamily: 'Gotham',
                                                fontSize: 18,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          firestoreInstance
                                              .collection('cart')
                                              .doc(groupUsers[index]
                                                  .data()['id'])
                                              .delete()
                                              .then((_) {
                                            print("success!");
                                          });
                                        },
                                      ),
                                    ),
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
