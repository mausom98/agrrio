import 'package:flutter/material.dart';
import '../Icons/custom_icons.dart';

final _bannerImage =
    'https://images.unsplash.com/photo-1474440692490-2e83ae13ba29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Image.network(_bannerImage, fit: BoxFit.cover, width: 1000.0),
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
                        MaterialPageRoute(builder: (context) => Shop()),
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
                    onPressed: () {},
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
                          "Plant Protection",
                        ),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
