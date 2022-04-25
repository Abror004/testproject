import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  static const String id = "home_page";

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "text",
          ),
          keyboardAppearance: Brightness.dark,

        ),
      )
    );
  }
}
