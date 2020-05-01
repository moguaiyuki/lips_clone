import 'package:flutter/material.dart';
import 'package:lips_clone/utils/styles/colors.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: LipsColors.brand,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
        elevation: 3.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
