import 'package:flutter/material.dart';
import 'package:agrrio/Pages/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrrio/bloc/cart_items_bloc.dart';
import '../colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final String name;
  Details({Key key, @required this.name}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final String telephoneNumber = "8878079999";
  Stream dataList;
  @override
  void initState() {
    dataList = Firestore.instance
        .collection('Product')
        .where('Name', isEqualTo: widget.name)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details / विवरण"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                String telephoneUrl = "tel:$telephoneNumber";
                if (await canLaunch(telephoneUrl)) {
                  await launch(telephoneUrl);
                } else {
                  throw "Can't phone that number.";
                }
              },
              child: Icon(Icons.call),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: myColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                }),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
            stream: dataList,
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.hasError)
                return Text('Error: ${asyncSnapshot.error}');
              switch (asyncSnapshot.connectionState) {
                case ConnectionState.none:
                  return Text('No data');
                case ConnectionState.waiting:
                  return Text('Awaiting...');
                case ConnectionState.active:
                  final list = asyncSnapshot.data.documents;
                  return list.length == 0
                      ? Center(
                          child: Text(
                            'We Are Adding Soon !',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Container(
                                    height: 300.0,
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(list[index]["Image"]),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Column(children: <Widget>[
                                            Text(
                                              '${list[index]["Description"]}',
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Price : ₹ ${list[index]["Price"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Brand : ${list[index]["Brand"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 16, 0, 5),
                                                    child: FloatingActionButton
                                                        .extended(
                                                      onPressed: () {
                                                        bloc.addToCart(
                                                          list[index]["Brand"],
                                                          list[index]
                                                              ["Category"],
                                                          list[index]
                                                              ["CurTime"],
                                                          list[index]
                                                              ["Description"],
                                                          list[index]["Image"],
                                                          list[index]["Name"],
                                                          list[index]["Price"],
                                                        );
                                                        final snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              'Item Added To Cart'),
                                                        );
                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      },
                                                      icon: Icon(
                                                        Icons.shopping_cart,
                                                        color: myColor,
                                                      ),
                                                      label: Text(
                                                        'Add to Cart / कार्ट में डालें',
                                                        style: TextStyle(),
                                                      ),
                                                      backgroundColor:
                                                          Colors.yellow,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ])
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          },
                          itemCount: list.length,
                        );
                  break;
                case ConnectionState.done:
                  final list = asyncSnapshot.data.documents;
                  return list.length == 0
                      ? Center(
                          child: Text(
                            'We Are Adding Soon !',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Container(
                                    height: 300.0,
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(list[index]["Image"]),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Column(children: <Widget>[
                                            Text(
                                              '${list[index]["Description"]}',
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Price : ₹ ${list[index]["Price"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Brand : ${list[index]["Brand"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 16, 0, 5),
                                                    child: FloatingActionButton
                                                        .extended(
                                                      onPressed: () {
                                                        bloc.addToCart(
                                                          list[index]["Brand"],
                                                          list[index]
                                                              ["Category"],
                                                          list[index]
                                                              ["CurTime"],
                                                          list[index]
                                                              ["Description"],
                                                          list[index]["Image"],
                                                          list[index]["Name"],
                                                          list[index]["Price"],
                                                        );
                                                        final snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              'Item Added To Cart'),
                                                        );
                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      },
                                                      icon: Icon(
                                                        Icons.shopping_cart,
                                                        color: myColor,
                                                      ),
                                                      label: Text(
                                                          'Add to Cart / कार्ट में डालें'),
                                                      backgroundColor:
                                                          Colors.yellow,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ])
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          },
                          itemCount: list.length,
                        );
                  break;
              }
              return null;
            }),
      ),
    );
  }
}
