// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// import 'package:school_managment/Screens/LoginPage.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 8), start);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Center(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.27,
//             width: MediaQuery.of(context).size.width * 0.35,
//             child: FlareActor(
//               "assets/school spleash.flr",
//               animation: "start",
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   start() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (BuildContext context) => MyHomePage(title: "Title"),
//         ),
//       );
//     });
//   }
// }
