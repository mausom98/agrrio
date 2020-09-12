import 'package:flutter/material.dart';
import '../Icons/custom2_icons.dart';
import '../Icons/custom3_icons.dart';
import 'package:agrrio/Pages/products.dart';
import 'package:url_launcher/url_launcher.dart';

class Hardware extends StatefulWidget {
  @override
  _HardwareState createState() => _HardwareState();
}

class _HardwareState extends State<Hardware> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hardware / हार्डवेयर'),
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
          )
        ],
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          'Hardware Category',
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'हार्डवेयर श्रेणी',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Products(name: "Gardening")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.farming,
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                    Text("Gardening"),
                    Text("बागवानी")
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Products(name: "PolyHouse")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.greenhouse,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "PolyHouse",
                    ),
                    Text("पॉलीहाउस")
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Products(name: "Pumps & Sprayers")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.hose,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Pumps & Sprayers"),
                    Text("पंप और स्प्रेयर")
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Products(name: "Hand Tools")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.wrench,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Hand Tools",
                    ),
                    Text("हाथ उपकरण")
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Products(name: "Tarpaulin Sheets")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.wrap_text,
                        size: 40.0,
                        color: Colors.green,
                      ),
                    ),
                    Text("Tarpaulin Sheets"),
                    Text("तिरपाल चादरें")
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            ButtonTheme(
              buttonColor: Colors.white,
              minWidth: 150.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Products(name: "Motors & Pipes")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.electric_motor__1_,
                        color: Colors.lightBlue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Motors & Pipes",
                    ),
                    Text("मोटर और पंप")
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
