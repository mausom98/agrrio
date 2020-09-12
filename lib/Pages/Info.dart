import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/services.dart';
import '../colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './home.dart';
import 'package:agrrio/sql/HistoryList.dart';
import 'package:agrrio/sql/database_helper.dart';
import 'package:intl/intl.dart';
import '../bloc/cart_items_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Info extends StatefulWidget {
  final List name;
  final List quantity;
  final double total;
  Info(
      {Key key,
      @required this.name,
      @required this.quantity,
      @required this.total})
      : super(key: key);
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  String errorMessage = '';
  String mobile;
  DatabaseHelper helper = DatabaseHelper();
  String phone = '';
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ValueChanged _onChanged = (val) => print(val);

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((user) => setState(() {
          phone = user.phoneNumber.toString();
        }));
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery Info / वितरण जानकारी')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: ListView(children: <Widget>[
          FormBuilder(
              key: _fbKey,
              readOnly: false,
              child: Column(children: <Widget>[
                Text(
                  "Happiness is Arriving... \n खुशी आ रही है",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20),
                FormBuilderPhoneField(
                  attribute: 'phone_number',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  onChanged: _onChanged,
                  defaultSelectedCountryIsoCode: "IN",
                  priorityListByIsoCode: ["IN"],
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(13),
                    FormBuilderValidators.maxLength(13)
                  ],
                ),
                SizedBox(height: 15),
                FormBuilderTextField(
                    attribute: "Address",
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.home)),
                    textCapitalization: TextCapitalization.words,
                    validators: [
                      FormBuilderValidators.minLength(5),
                      FormBuilderValidators.required()
                    ],
                    onChanged: _onChanged),
                SizedBox(height: 15),
                Text('Please Pay With Cash On Delivery'),
                SizedBox(height: 15),
              ])),
          Row(children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: myColor,
                child: Text(
                  "Order",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_fbKey.currentState.saveAndValidate()) {
                    openCheckout();
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              title: new Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.red,
                                    shape: CircleBorder(),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 70.0,
                                  )),
                              content: new Text("Please Provide Valid Details"),
                              actions: <Widget>[
                                RaisedButton(
                                  color: Colors.red,
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                  }
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  "Reset",
                ),
                onPressed: () {
                  _fbKey.currentState.reset();
                },
              ),
            ),
          ])
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'KlWE7HnsfaNAs9k88xaoSusx',
      'amount': widget.total,
      'name': 'Agrrio',
      'description': 'Agrrio Products',
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Was Successful",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    var date = DateFormat.yMMMd().format(DateTime.now());
    HistoryList current = HistoryList(widget.total.toString(), date);
    Firestore.instance.collection('Order').add({
      "phone": (_fbKey.currentState.value)['phone_number'],
      "address": (_fbKey.currentState.value)['Address'],
      "product": widget.name,
      "quantity": widget.quantity,
      "total": widget.total,
      "date": date,
      "user_phone": phone
    }).then((value) => {
          helper.insertHistory(current),
          bloc.removeAll(),
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              title: new Ink(
                decoration: const ShapeDecoration(
                  color: Colors.green,
                  shape: CircleBorder(),
                ),
                child: Image.asset('assets/done.png'),
              ),
              content: new Text("Your Order Has Been Placed !"),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(title: 'Agrrio')));
                  },
                )
              ],
            ),
          ),
        });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
