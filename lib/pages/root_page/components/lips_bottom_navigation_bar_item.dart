import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'destinations.dart';

class LipsBottomNavigationBarItem {
  final IconData iconData;
  final Destination destination;
  final int destinationIndex;

  const LipsBottomNavigationBarItem({
    @required this.iconData,
    @required this.destination,
    @required this.destinationIndex,
  });
}

const List<LipsBottomNavigationBarItem> lipsBottomNavigationBarItems = [
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.home_ent,
    destination: Destination.home,
    destinationIndex: 0,
  ),
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.crown_faw5s,
    destination: Destination.ranking,
    destinationIndex: 1,
  ),
  LipsBottomNavigationBarItem(
    iconData: AntDesign.paperclip,
    destination: Destination.clip,
    destinationIndex: 2,
  ),
  LipsBottomNavigationBarItem(
    iconData: FlutterIcons.bell_ent,
    destination: Destination.notification,
    destinationIndex: 3,
  ),
];
