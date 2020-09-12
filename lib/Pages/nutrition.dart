import 'package:flutter/material.dart';
import '../Icons/custom_icons.dart';
import '../Icons/custom2_icons.dart';
import 'package:agrrio/Pages/products.dart';
import 'package:url_launcher/url_launcher.dart';

class Nutrition extends StatefulWidget {
  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition / पोषण'),
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
          'Nutrition Category',
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'पोषण की श्रेणी',
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
                        builder: (context) => Products(name: "General Growth")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.plant__2_,
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                    Text("General Growth"),
                    Text("सामान्य वृद्धि")
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
                        builder: (context) => Products(name: "Flowering")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.plant__1_,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Flowering",
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
                        builder: (context) => Products(name: "Super Spreader")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.plant__3_,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Super Spreader"),
                    Text("सुपर स्प्रेडर")
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
                        builder: (context) => Products(name: "Bio")),
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
                      "Bio",
                    ),
                    Text("जैव")
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
                            Products(name: "Plant Growth Promoter")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.sprayer,
                        size: 40.0,
                        color: Colors.green,
                      ),
                    ),
                    Text("Plant Growth Promoter"),
                    Text("पौधे के विकास")
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
                        builder: (context) => Products(name: "Fertilizers")),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom2.fertilizer,
                        color: Colors.lightBlue,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Fertilizers",
                    ),
                    Text("उर्वरक")
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        ButtonTheme(
          buttonColor: Colors.white,
          minWidth: 150.0,
          height: 100.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Products(name: "Organic")),
              );
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Custom2.healthy_food,
                    color: Colors.lightBlue,
                    size: 40.0,
                  ),
                ),
                Text(
                  "Organic",
                ),
                Text("जैविक")
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
