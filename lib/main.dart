import 'package:flutter/material.dart';
import 'package:lips_clone/pages/root_page/root_page.dart';

import 'pages/home_page/home_page.dart';
import 'utils/styles/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lips Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: LipsColors.brand,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}
