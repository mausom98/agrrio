import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String _verificationId;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String mobile;
  String errorMessage = '';

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.asset("assets/logo.png"),
            ),
            new Form(
              key: _key,
              autovalidate: _validate,
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 100.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Phone",
                                style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                )),
                            TextFormField(
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                                prefixText: '\+91   ',
                                prefixIcon: new Icon(Icons.phone),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              enabled: true,
                              validator: validateMobile,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            _verifyPhoneNumber();
                          }
                        },
                        icon: Icon(Icons.code),
                        label: Text('Get OTP'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    title: 'Aggrio',
                  )));
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Phone Verification Failed'),
            content: Text('Error : ${authException.message}'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this._verificationId = verificationId;
      smsCodeDialog(context);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
      smsCodeDialog(context);
    };
    final fnumber = _phoneNumberController.text;
    final pnumber = '+91$fnumber';

    await _auth.verifyPhoneNumber(
        phoneNumber: pnumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<bool> smsCodeDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          title: Text('Enter sms Code'),
          content: TextFormField(
            controller: _smsController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Enter OTP', icon: Icon(Icons.perm_phone_msg)),
            maxLength: 6,
            maxLengthEnforced: true,
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            new RaisedButton(
                child: Text('Login'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    title: 'Aggrio',
                                  )));
                    } else {
                      Navigator.of(context).pop();
                      _signInWithPhoneNumber(context);
                    }
                  });
                })
          ],
        );
      });

  void _signInWithPhoneNumber(BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId,
        smsCode: _smsController.text,
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)) as FirebaseUser;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      title: 'Aggrio',
                    )));
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsCodeDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }
}
