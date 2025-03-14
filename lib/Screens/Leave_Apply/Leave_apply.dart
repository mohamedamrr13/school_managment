import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LeaveApply extends StatefulWidget {
  const LeaveApply({super.key});

  @override
  _LeaveApplyState createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> delayedAnimation;
  late Animation<double> muchDelayedAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers
  final TextEditingController _applyleavecontroller = TextEditingController();
  final TextEditingController _fromcontroller = TextEditingController();
  final TextEditingController _tocontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define animations
    animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    delayedAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    muchDelayedAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    // Start animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _applyleavecontroller.dispose();
    _fromcontroller.dispose();
    _tocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text("Apply Leave")),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Transform(
                  transform:
                      Matrix4.translationValues(animation.value * width, 0, 0),
                  child: DropdownSearch<String>(
                    items: (filter, loadProps) =>
                        ["Sick Leave", "Casual Leave", "Earned Leave"],
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                    ),
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        labelText: "Select Leave Type",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onChanged: (value) {
                      _applyleavecontroller.text = value ?? "";
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0, 0),
                  child: TextField(
                    controller: _fromcontroller,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "From Date",
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      // Implement date picker logic
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: TextField(
                      controller: _tocontroller,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "To Date",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {}),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Submit Leave"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
