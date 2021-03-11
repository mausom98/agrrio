import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/services.dart';
import '../colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './home.dart';

class RentInfo extends StatefulWidget {
  final String name;
  final int price;

  RentInfo({
    Key key,
    @required this.name,
    @required this.price,
  }) : super(key: key);
  @override
  _RentInfoState createState() => _RentInfoState();
}

class _RentInfoState extends State<RentInfo> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  String errorMessage = '';
  String mobile;
  String _date = '';

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ValueChanged _onChanged = (val) => print(val);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery Info')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: ListView(children: <Widget>[
          FormBuilder(
              key: _fbKey,
              readOnly: false,
              child: Column(children: <Widget>[
                Text(
                  "Happiness is Arriving...\n खुशी आ रही है",
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
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      )),
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
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.home,
                          color: Colors.black,
                        )),
                    textCapitalization: TextCapitalization.words,
                    validators: [
                      FormBuilderValidators.minLength(5),
                      FormBuilderValidators.required()
                    ],
                    onChanged: _onChanged),
                SizedBox(height: 15),
                FormBuilderTextField(
                  attribute: 'acre',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Acre of Land",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.linear_scale,
                        color: Colors.black,
                      )),
                  onChanged: _onChanged,
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(13),
                    FormBuilderValidators.maxLength(13)
                  ],
                ),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        theme: DatePickerTheme(
                            headerColor: Colors.blue,
                            backgroundColor: Colors.white,
                            itemStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onConfirm: (date) {
                      setState(() {
                        _date = date.toString();
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                SizedBox(height: 15),
                Text(
                    'Please Pay With Cash On Delivery \n कृपया कैश ऑन डिलीवरी का भुगतान करें'),
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
                  if (_date.length == 0) {
                    showDialog(
                        context: context,
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
                              content: new Text("Please Select A Date"),
                              actions: <Widget>[
                                RaisedButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                  }
                  if (_fbKey.currentState.saveAndValidate()) {
                    Firestore.instance.collection('RentOrder').add({
                      "phone": (_fbKey.currentState.value)['phone_number'],
                      "address": (_fbKey.currentState.value)['Address'],
                      "product": widget.name,
                      "price": widget.price,
                      "date": _date
                    }).then(
                      (value) => showDialog(
                        context: context,
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
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyHomePage(title: 'Agrrio')));
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                        context: context,
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
          ]),
        ]),
      ),
    );
  }
}
