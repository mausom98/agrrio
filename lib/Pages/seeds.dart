import 'package:flutter/material.dart';
import '../Icons/custom_icons.dart';
import 'package:agrrio/Pages/products.dart';
import 'package:url_launcher/url_launcher.dart';

class Seeds extends StatefulWidget {
  @override
  _SeedsState createState() => _SeedsState();
}

class _SeedsState extends State<Seeds> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seeds / बीज'),
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
          'Seeds Category',
          style: TextStyle(fontSize: 30.0),
        ),
        Text("बीज श्रेणी", style: TextStyle(fontSize: 20.0)),
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
                        builder: (context) => Products(name: "Grains")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.wheat,
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                    Text("Grains"),
                    Text("अनाज")
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
                        builder: (context) => Products(name: "Vegetables")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.cauliflower,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Vegetables",
                    ),
                    Text("सब्जियां")
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
                        builder: (context) => Products(name: "Fruits")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.diet,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Fruits"),
                    Text("फल")
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
                        builder: (context) => Products(name: "Flower")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.flowers,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Flower",
                    ),
                    Text("फूल")
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
                        builder: (context) => Products(name: "Exotic")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.avocado__2_,
                        size: 40.0,
                        color: Colors.green,
                      ),
                    ),
                    Text("Exotic"),
                    Text("विदेशी")
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
                        builder: (context) => Products(name: "Home Garden")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.home,
                        color: Colors.lightBlue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Home Garden",
                    ),
                    Text("बगीचा")
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
