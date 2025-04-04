import 'package:flutter/material.dart';
import 'package:school_managment/Widgets/Attendance/AttendanceCard.dart';

class TodayAttendance extends StatefulWidget {
  const TodayAttendance({super.key});

  @override
  _TodayAttendanceState createState() => _TodayAttendanceState();
}

class _TodayAttendanceState extends State<TodayAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         AttendanceCard(attendance: true,
         endtime: "10 AM",
         staff: "Deepak",
         starttime: "9 AM",
         subject: "English",
         ),
         AttendanceCard(attendance: false,
         endtime: "10 AM",
         staff: "Deepak",
         starttime: "9 AM",
         subject: "English",
         ),
          
        ],
      ),
    );
  }
}
