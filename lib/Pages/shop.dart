import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Icons/custom_icons.dart';
import '../Icons/custom3_icons.dart';
import './seeds.dart';
import './plant_protect.dart';
import './agri_equip.dart';
import './hardware.dart';
import './heavy_machinery.dart';
import './nutrition.dart';
import './husbandry.dart';

final _bannerImage =
    'https://images.unsplash.com/photo-1474440692490-2e83ae13ba29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final String telephoneNumber = "8878079999";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop / दुकान'),
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
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              _bannerImage,
              fit: BoxFit.cover,
              height: 120.0,
              width: 350,
            ),
          ),
          Column(children: <Widget>[
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
                        MaterialPageRoute(builder: (context) => Seeds()),
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
                        Text("Seeds"),
                        Text("बीज")
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
                        MaterialPageRoute(builder: (context) => PlantProtect()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom3.protect,
                            color: Colors.deepOrange,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          "Plant Protection",
                        ),
                        Text("पौध-संरक्षण")
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
                        MaterialPageRoute(builder: (context) => Nutrition()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom.flower,
                            size: 40.0,
                            color: Colors.amber,
                          ),
                        ),
                        Text("Nutrition"),
                        Text("पोषण")
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
                        MaterialPageRoute(builder: (context) => Hardware()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.build,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          "Hardware",
                        ),
                        Text("हार्डवेयर")
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
                        MaterialPageRoute(builder: (context) => AgriEquip()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom.scythe,
                            size: 40.0,
                            color: Colors.indigo,
                          ),
                        ),
                        Text("Agri Equipment"),
                        Text("कृषि उपकरण")
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
                            builder: (context) => HeavyMachinery()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom.tractor,
                            color: Colors.deepPurple,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          "Heavy Machinery",
                        ),
                        Text("भारी मशीनरी")
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
                    MaterialPageRoute(builder: (context) => Husbandry()),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Custom3.barn,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Animal Husbandry",
                    ),
                    Text("पशुपालन")
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
