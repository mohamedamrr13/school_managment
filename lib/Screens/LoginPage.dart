// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:school_managment/Screens/home.dart';
import 'package:school_managment/Widgets/BouncingButton.dart';
import 'ForgetPasseord.dart';
import 'RequestLogin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, leftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    leftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool passshow = false;
  String? _pass;
  String? _email;
  String? user1;
  // FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Text(
                          'Hello',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 35.0, 0, 0),
                          child: Text(
                            'There',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(135.0, 0.0, 0, 30),
                          child: Text(
                            '.',
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform:
                      Matrix4.translationValues(leftCurve.value * width, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode: _autoValidate,
                                validator: (value) {
                                  if ((Fzregex.hasMatch(
                                          value!, FzPattern.email) ==
                                      false)) {
                                    return "Enter Vaild Email address";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                obscuringCharacter: '*',
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Enter Vaild password";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (val) {
                                  _pass = val;
                                },
                                decoration: InputDecoration(
                                    suffix: passshow == false
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                passshow = true;
                                              });
                                            },
                                            icon: Icon(Icons.lock_open),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                passshow = false;
                                              });
                                            },
                                            icon: Icon(Icons.lock),
                                          ),
                                    labelText: 'PASSWORD',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                                obscureText: passshow == false ? true : false,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0, 0),
                  child: Container(
                    alignment: Alignment(1.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                      child: Bouncing(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgetPassword(),
                              ));
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                child: Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Bouncing(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                      
                        child: MaterialButton(
                          elevation: 0.0,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Bouncing(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequestLogin()),
                          );
                        },
                        child: MaterialButton(
                          elevation: 0.5,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.grey[300],
                          onPressed: () {},
                          child: ListTile(
                            leading:
                                Icon(Icons.fingerprint, color: Colors.black),
                            title: Text('Request Login ID'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
