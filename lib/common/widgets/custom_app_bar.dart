import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double toolBarHeight;
  CustomAppBar({super.key, required this.title, required this.toolBarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
}
