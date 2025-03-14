import 'package:flutter/material.dart';
import 'package:school_managment/Screens/Attendance/OverallAttendance.dart';
import 'package:school_managment/Screens/Attendance/TodayAttendance.dart';
import 'package:school_managment/Widgets/AppBar.dart';
import 'package:school_managment/Widgets/MainDrawer.dart';
import 'package:school_managment/Widgets/UserDetailCard.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: CommonAppBar(
        title: "Attendance",
        menuEnabled: true,
        notificationEnabled: true,
        onTap: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: Drawer(
        elevation: 0,
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserDetailCard(),
            DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black26,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(text: 'Today'),
                        Tab(text: 'Overall'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.68, //height of TabBarView
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        TodayAttendance(),
                        OverallAttendance(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
