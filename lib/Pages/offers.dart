import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final String telephoneNumber = "8878079999";
  Stream dataList;
  @override
  void initState() {
    dataList = Firestore.instance.collection('Offers').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offers For You'), actions: <Widget>[
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
      ]),
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
                          scrollDirection: Axis.vertical,
                          itemCount: asyncSnapshot.data.documents.length,
                          itemBuilder: (context, index) => Card(
                                elevation: 5,
                                child: Container(
                                  height: 50.0,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          asyncSnapshot.data.documents[index]
                                              ['Name'],
                                          style: TextStyle(fontSize: 20.0),
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
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
                          scrollDirection: Axis.vertical,
                          itemCount: asyncSnapshot.data.documents.length,
                          itemBuilder: (context, index) => Card(
                                elevation: 5,
                                child: Container(
                                  height: 50.0,
                                  child: Row(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        asyncSnapshot.data.documents[index]
                                            ['Name'],
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ]),
                                ),
                              ));
                  break;
              }
              return null;
            }),
      ),
    );
  }
}
