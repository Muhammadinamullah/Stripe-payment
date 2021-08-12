// import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String text = 'Click the button to start the payment';
//   double totalCost = 10.0;
//   double tip = 1.0;
//   double tax = 0.0;
//   double taxPercent = 0.2;
//   int amount = 0;
//   bool showSpinner = false;
//   String url =
//       'https://us-central1-demostripe-b9557.cloudfunctions.net/StripePI';

//   @override
//   initState() {
//     super.initState();
//     StripePayment.setOptions(StripeOptions(
//       publishableKey:
//           "pk_test_51JNAySAbPSGEz1gRx1jwB4vi0iSNBSuTxlbK2i7sPFLNvnZZAIO9Ed2gKj24zbypOWft2bYaEgDJO21eHdQKuCIi00VBJCluc9",
//       androidPayMode: 'test',
//     ));
//   }

// // @override
// //   initState() {
// //     super.initState();
// //     StripePayment.setOptions(
// //       StripeOptions(
// //      publishableKey: 'pk_test_your_stripe_pub_key', // add you key as per Stripe dashboard
// //    merchantId: 'merchant.thegreatestmarkeplace',
// // // add you merchantId as per apple developer account
// // androidPayMode: 'test',     ),  );}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('stripe'),
//       ),
//       body: ElevatedButton(
//         child: Text("Create Source"),
//         onPressed: () {},
//       ),
//     );
//   }
// }

// class ShowDialogToDismiss extends StatelessWidget {
//   final String content;
//   final String title;
//   final String buttonText;
//   ShowDialogToDismiss(
//       {required this.title, required this.buttonText, required this.content});
//   @override
//   Widget build(BuildContext context) {
//     if (!Platform.isIOS) {
//       return AlertDialog(
//         title: new Text(
//           title,
//         ),
//         content: new Text(
//           this.content,
//         ),
//         actions: <Widget>[
//           new TextButton(
//             child: new Text(
//               buttonText,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     } else {
//       return CupertinoAlertDialog(
//           title: Text(
//             title,
//           ),
//           content: new Text(
//             this.content,
//           ),
//           actions: <Widget>[
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               child: new Text(
//                 buttonText[0].toUpperCase() +
//                     buttonText.substring(1).toLowerCase(),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ]);
//     }
//   }
// }
