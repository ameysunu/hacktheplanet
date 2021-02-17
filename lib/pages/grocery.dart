import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hacktheplanet/pages/shoplist.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

final firestoreInstance = FirebaseFirestore.instance;
AsyncSnapshot<DocumentSnapshot> snapshot;
Stream<QuerySnapshot> groceryStream;

class Grocery extends StatefulWidget {
  final String name, price, place;
  Grocery({Key key, this.name, this.price, this.place}) : super(key: key);
  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  @override
  void initState() {
    super.initState();
    groceryStream = firestoreInstance.collection('grocery').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#FFE3EA'),
        body: StreamBuilder(
            stream: groceryStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var totalgroupCount = 0;
              List<DocumentSnapshot> groupUsers;
              if (snapshot.hasData) {
                groupUsers = snapshot.data.documents;
                totalgroupCount = groupUsers.length;
                return GridView.builder(
                    itemCount: totalgroupCount,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      // return Text(groupUsers[index].data()['title']);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopList(
                                          image:
                                              groupUsers[index].data()['image'],
                                          name:
                                              groupUsers[index].data()['name'],
                                          price:
                                              groupUsers[index].data()['price'],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.8),
                                        BlendMode.dstATop),
                                    image: NetworkImage(
                                        groupUsers[index].data()['image'])),
                                color: HexColor('#000000'),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    groupUsers[index].data()['name'],
                                    style: TextStyle(
                                        fontFamily: 'Gotham',
                                        fontSize: 17,
                                        color: HexColor('#FFE3EA')),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Text(
                                    groupUsers[index].data()['price'],
                                    style: TextStyle(
                                        fontFamily: 'Gotham',
                                        fontSize: 17,
                                        color: HexColor('#FFE3EA')),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
