import 'package:flutter/material.dart';
import '../Icons/custom3_icons.dart';
import 'package:agrrio/Pages/products.dart';
import 'package:url_launcher/url_launcher.dart';

class Husbandry extends StatefulWidget {
  @override
  _HusbandryState createState() => _HusbandryState();
}

class _HusbandryState extends State<Husbandry> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Husbandry'),
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
          'Animal Husbandry',
          style: TextStyle(fontSize: 30.0),
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
                        builder: (context) => Products(name: "Dairy")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.dairy_products,
                        color: Colors.teal,
                        size: 40.0,
                      ),
                    ),
                    Text("Dairy"),
                    Text("दुग्धालय")
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
                        builder: (context) => Products(name: "Fishery")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.fish,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Fishery",
                    ),
                    Text("मछी पालन")
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
                        builder: (context) => Products(name: "Poultry")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.chicken__1_,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Poultry"),
                    Text("मुर्गी पालन")
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
