import 'package:agrrio/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Icons/custom_icons.dart';
import './shop.dart';
import './cart.dart';
import './rent.dart';
import '../sql/Model.dart';
import './offers.dart';

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
  final String telephoneNumber = "8878079999";
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Image.asset('assets/logo.png'),
        ),
        SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 70.0),
                  child: Text(
                    'Version : 1.0.0',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                  size: 40.0,
                  color: myColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Call  Us / हमें कॉल करें',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            onTap: () async {
              String telephoneUrl = "tel:$telephoneNumber";
              if (await canLaunch(telephoneUrl)) {
                await launch(telephoneUrl);
              } else {
                throw "Can't phone that number.";
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.history,
                  size: 40.0,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Your  Orders \n आपके ऑर्डर',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History()),
              )
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.local_offer,
                  size: 40.0,
                  color: Colors.orange,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Offers  For  You \n आपके लिए प्रस्ताव',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offers()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 40.0,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Terms & Policies \n शर्तें और नीति',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offers()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.lock_open,
                  size: 40.0,
                  color: Colors.orange,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Logout \n लॉग आउट',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offers()),
              );
            },
          ),
        )
      ])),
      appBar: AppBar(
        title: Text(widget.title),
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
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
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
                        Text("दुकान")
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Rent()));
                    },
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
                        Text("किराये पर")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text('Coming Soon', style: TextStyle(fontSize: 20.0)),
            Text('जल्द आ रहा है', style: TextStyle(fontSize: 20.0)),
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
                        Text("Digital Mandi"),
                        Text("डिजिटल मंडी")
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
                        Text("वित्तीय सेवाएं")
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
