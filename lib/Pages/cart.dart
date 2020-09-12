import 'package:flutter/material.dart';
import '../bloc/cart_items_bloc.dart';
import './Info.dart';
import '../Icons/custom_icons.dart';
import '../colors.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout / चेक आउट'),
      ),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.items,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? Column(
                  children: <Widget>[
                    Expanded(child: checkoutListBuilder(snapshot)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          var name = [];
                          var quantity = [];
                          var total = bloc.calculate();
                          snapshot.data.values.toList().forEach((t) => {
                                name.add(t.name),
                                quantity.add(t.quantity),
                              });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Info(
                                    name: name,
                                    quantity: quantity,
                                    total: total)),
                          );
                        },
                        icon: Icon(
                          Custom.plant,
                          color: myColor,
                        ),
                        label: Text(
                          'Proceed / आगे ->',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        backgroundColor: Colors.yellow,
                      ),
                    )
                  ],
                )
              : Center(child: Text("You haven't taken any item yet"));
        },
      ),
    );
  }

  Widget checkoutListBuilder(snapshot) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, i) {
              final cartList = snapshot.data.values.toList();
              return Card(
                elevation: 5,
                child: Container(
                  height: 140.0,
                  child: Row(children: <Widget>[
                    Container(
                      height: 160.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(cartList[i].image),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              cartList[i].name,
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(children: <Widget>[
                                Text(
                                  'Price : ₹ ${cartList[i].price}',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ]),
                            ),
                            new Row(
                              children: <Widget>[
                                new IconButton(
                                  icon: new Icon(Icons.remove),
                                  onPressed: () => setState(() {
                                    if (cartList[i].quantity > 1) {
                                      bloc.removeSingleItem(
                                          cartList[i].curtime.toString());
                                    }
                                  }),
                                ),
                                new Text(cartList[i].quantity.toString()),
                                new IconButton(
                                    icon: new Icon(Icons.add),
                                    onPressed: () => {
                                          bloc.addToCart(
                                              cartList[i].brand,
                                              cartList[i].category,
                                              cartList[i].curtime,
                                              cartList[i].description,
                                              cartList[i].image,
                                              cartList[i].name,
                                              cartList[i].price)
                                        })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 6),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: 35.0,
                        ),
                        color: Colors.red,
                        onPressed: () {
                          bloc.removeFromCart(cartList[i].curtime);
                        },
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
