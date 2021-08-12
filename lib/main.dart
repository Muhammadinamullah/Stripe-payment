import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Token? paymentToken;
  Token? payment;
  // PaymentMethod? paymentMethod;
  String? error;

  ScrollController _controller = ScrollController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
      publishableKey:
          "pk_test_51JNAySAbPSGEz1gRx1jwB4vi0iSNBSuTxlbK2i7sPFLNvnZZAIO9Ed2gKj24zbypOWft2bYaEgDJO21eHdQKuCIi00VBJCluc9",
    )
        // merchantId: "Test",
        // androidPayMode: 'test'),
        );
  }

  Future<void> errorOccur(dynamic error) async {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('stripe payment'),
        ),
        body: ListView(
          controller: _controller,
          padding: const EdgeInsets.all(60.0),
          children: [
            ElevatedButton(
                child: Text("Create Token"),
                onPressed: () {
                  StripePayment.paymentRequestWithCardForm(
                          CardFormPaymentRequest())
                      .then((token) {
                    _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text('token is generated ${token.id}')));
                    setState(() {
                      token = token;
                      // print(token.id);
                    });
                  });
                }),
            ElevatedButton(
              child: Text("Create Token with Card"),
              onPressed: () {
                StripePayment.createTokenWithCard(
                  CreditCard(
                    number: '4000002760003184',
                    expMonth: 10,
                    expYear: 33,
                    name: 'inam',
                    cvc: '137',
                    addressZip: '1337',
                  ),
                ).then((token) {
                  _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text('token is generated ${token.tokenId}'),
                    ),
                  );
                  setState(() {
                    paymentToken = token;
                    print(token.tokenId);
                  });
                }).catchError(errorOccur);
              },
            ),
            ElevatedButton(
              child: Text("Create Payment Method with Generated Token"),
              onPressed: paymentToken == null
                  ? null
                  : () {
                      StripePayment.createPaymentMethod(
                        PaymentMethodRequest(
                          card: CreditCard(
                            token: paymentToken!.tokenId,
                          ),
                        ),
                      ).then((paymentMethod) {
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Text('Received ${paymentMethod.id}')));
                        setState(() {
                          paymentMethod = paymentMethod;
                          print(paymentMethod.toString());
                        });
                      }).catchError(errorOccur);
                    },
            )
          ],
        ),
      ),
    );
  }
}
