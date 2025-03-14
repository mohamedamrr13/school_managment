import 'package:flutter/material.dart';

class AttendanceCard extends StatefulWidget {
  final String starttime;
  final String endtime;
  final String subject;
  final String staff;
  final bool attendance;

  const AttendanceCard({
    super.key,
    required this.starttime,
    required this.endtime,
    required this.subject,
    required this.staff,
    required this.attendance,
  });

  @override
  AttendanceCardState createState() => AttendanceCardState();
}

class AttendanceCardState extends State<AttendanceCard>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation, delayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );

    delayedAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.fastOutSlowIn),
      ),
    );

    animationController.forward(); // Start animation here
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Transform(
            transform:
                Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.starttime,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.endtime,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subject,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.staff,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.attendance ? Colors.green : Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        widget.attendance ? "P" : "A",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
