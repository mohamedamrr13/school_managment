import 'package:flutter/material.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:school_managment/Widgets/BouncingButton.dart';
import 'RequestProcessing.dart';

class RequestLogin extends StatefulWidget {
  @override
  _RequestLoginState createState() => _RequestLoginState();
}

class _RequestLoginState extends State<RequestLogin>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation,
      delayedAnimation,
      muchDelayedAnimation,
      leftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );

    delayedAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    muchDelayedAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    leftCurve = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    animationController.forward();
  }

  String? email, phno, _class, name, rollno;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

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
                          'Request',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(70.0, 35.0, 0, 0),
                          child: Text(
                            'ID',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(105.0, 0.0, 0, 30),
                          child: Text(
                            '.',
                            style: TextStyle(
                              color: Colors.green[400],
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                            ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'You must enter your Name!';
                            }
                            if (!RegExp('[a-zA-Z]').hasMatch(value!)) {
                              return 'Enter a valid name';
                            }
                            return null;
                          },
                          onSaved: (val) => name = val,
                          keyboardType: TextInputType.name,
                          decoration: _inputDecoration('Name'),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (val) => val?.isEmpty ?? true
                              ? 'Enter your Roll Number'
                              : null,
                          onSaved: (val) => rollno = val,
                          decoration: _inputDecoration('Roll Number'),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'You must enter your class!';
                            }
                            if (!RegExp(r'\d').hasMatch(value!)) {
                              return 'Enter a valid class';
                            }
                            return null;
                          },
                          onSaved: (val) => _class = val,
                          decoration: _inputDecoration('Class'),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (value) {
                            if (!Fzregex.hasMatch(
                                value ?? '', FzPattern.email)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                          onSaved: (value) => email = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: _inputDecoration('E-Mail'),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value?.isEmpty ?? true) {
                              return 'Please enter mobile number';
                            }
                            if (!regExp.hasMatch(value!)) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                          onSaved: (val) => phno = val,
                          decoration: _inputDecoration('Phone Number'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: Bouncing(
                    onPress: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProcessingRequest()),
                        );
                      }
                    },
                    child: MaterialButton(
                      elevation: 0.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      onPressed: () { },
                      child: Text("Request",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(5),
      labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    );
  }
}
