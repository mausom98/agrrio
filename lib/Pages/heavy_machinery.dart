import 'package:flutter/material.dart';
import '../Icons/custom_icons.dart';
import '../Icons/custom2_icons.dart';

class HeavyMachinery extends StatefulWidget {
  @override
  _HeavyMachineryState createState() => _HeavyMachineryState();
}

class _HeavyMachineryState extends State<HeavyMachinery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Machinery')),
      body: Column(children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          'Machine Category',
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
                onPressed: () {},
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
                        Custom2.technology,
                        color: Colors.deepOrange,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      "Harvesters",
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
                        Icons.open_in_new,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    Text("Others"),
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
