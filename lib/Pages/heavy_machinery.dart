import 'package:flutter/material.dart';
import '../Icons/custom_icons.dart';
import '../Icons/custom2_icons.dart';
import 'package:agrrio/Pages/products.dart';
import 'package:url_launcher/url_launcher.dart';

class HeavyMachinery extends StatefulWidget {
  @override
  _HeavyMachineryState createState() => _HeavyMachineryState();
}

class _HeavyMachineryState extends State<HeavyMachinery> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heavy Machinery'),
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
          'Machine Category',
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'मशीन श्रेणी',
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
                        builder: (context) => Products(name: "Tractors")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom.tractor,
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                    Text("Tractors"),
                    Text("ट्रैक्टर")
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
                        builder: (context) => Products(name: "Harvesters")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.technology,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Harvesters",
                    ),
                    Text("हार्वेस्टर")
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
                        builder: (context) => Products(name: "OthersH")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.open_in_new,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Others"),
                    Text("अन्य")
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
