import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Icons/custom_icons.dart';
import './shop.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1535379453347-1ffd615e2e08?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80',
  'https://images.unsplash.com/photo-1563201515-adbe35c669c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=753&q=80',
  'https://images.unsplash.com/photo-1559884743-74a57598c6c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=755&q=80'
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
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
                            Custom.plant,
                            color: Colors.green,
                            size: 40.0,
                          ),
                        ),
                        Text("Shop"),
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
                            Custom.rent,
                            color: Colors.deepOrange,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          "Rental",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text('Coming Soon', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  buttonColor: Colors.white54,
                  minWidth: 150.0,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom.buy,
                            size: 40.0,
                            color: Colors.green,
                          ),
                        ),
                        Text("Buy And Sell"),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 20)),
                ButtonTheme(
                  buttonColor: Colors.white54,
                  minWidth: 150.0,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Custom.rupee,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          "Financial Services",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ])
        ],
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
            ),
          ))
      .toList();
}
