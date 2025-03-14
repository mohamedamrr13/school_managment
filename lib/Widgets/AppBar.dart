import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool menuEnabled;
  final bool notificationEnabled;
  final VoidCallback onTap;

  const CommonAppBar({
    super.key,
    required this.title,
    required this.menuEnabled,
    required this.notificationEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: menuEnabled
          ? IconButton(
              color: Colors.black,
              onPressed: onTap,
              icon: const Icon(Icons.menu),
            )
          : null,
      actions: [
        notificationEnabled
            ? InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/notification.png",
                  width: 35,
                ),
              )
            : const SizedBox.shrink(),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
