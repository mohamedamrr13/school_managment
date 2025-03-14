import 'package:flutter/material.dart';

import 'MainDrawer.dart';

class NavigationDrawer extends StatefulWidget {
  
  const NavigationDrawer({required Key key, }) : super(key: key);

  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: MainDrawer(),
    );
  }
}
