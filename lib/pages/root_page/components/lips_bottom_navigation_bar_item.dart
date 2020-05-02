import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'destinations.dart';

class LipsBottomNavigationBarItem {
  final IconData iconData;
  final Destination destination;

  const LipsBottomNavigationBarItem({
    @required this.iconData,
    @required this.destination,
  });
}

const List<LipsBottomNavigationBarItem> lipsBottomNavigationBarItems = [
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.home_ent,
    destination: Destination.home,
  ),
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.crown_faw5s,
    destination: Destination.ranking,
  ),
  LipsBottomNavigationBarItem(
    iconData: AntDesign.paperclip,
    destination: Destination.clip,
  ),
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.bell_ent,
    destination: Destination.notification,
  ),
];
