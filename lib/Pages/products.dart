import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './cart.dart';
import '../colors.dart';
import 'package:agrrio/Pages/details.dart';
import 'package:url_launcher/url_launcher.dart';

class Products extends StatefulWidget {
  final String name;
  Products({Key key, @required this.name}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final String telephoneNumber = "8878079999";
  Stream dataList;
  @override
  void initState() {
    dataList = Firestore.instance
        .collection('Product')
        .where('Category', isEqualTo: widget.name)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.name,
          ),
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
          ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
        icon: Icon(
          Icons.shopping_cart,
          color: myColor,
        ),
        label: Text('Check Cart / चेक कार्ट', style: TextStyle(fontSize: 20.0)),
        backgroundColor: Colors.yellow,
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
                              child: GestureDetector(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 140.0,
                                    child: Row(children: <Widget>[
                                      Container(
                                        height: 140.0,
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                list[index]["Image"]),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 2, 0, 0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                list[index]["Name"],
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child:
                                                    Column(children: <Widget>[
                                                  Text(
                                                    'Price : ₹ ${list[index]["Price"]}',
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                  Text(
                                                    'Brand : ${list[index]["Brand"]}',
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Details(name: list[index]["Name"])),
                                ),
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
                              child: GestureDetector(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 140.0,
                                    child: Row(children: <Widget>[
                                      Container(
                                        height: 140.0,
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                list[index]["Image"]),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 2, 0, 0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                list[index]["Name"],
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child:
                                                    Column(children: <Widget>[
                                                  Text(
                                                    'Price : ₹ ${list[index]["Price"]}',
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                  Text(
                                                    'Brand : ${list[index]["Brand"]}',
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Details(name: list[index]["Name"])),
                                ),
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
