import 'package:flutter/material.dart';

import 'destinations.dart';
import 'lips_bottom_navigation_bar_item.dart';

class LipsBottomNavigationBar extends StatefulWidget {
  final List<LipsBottomNavigationBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape nothcedshape;
  final ValueChanged<int> onTabSelected;

  const LipsBottomNavigationBar({
    Key key,
    this.items,
    this.height,
    this.iconSize,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.nothcedshape,
    this.onTabSelected,
  }) : super(key: key);

  @override
  _LipsBottomNavigationBarState createState() =>
      _LipsBottomNavigationBarState();
}

class _LipsBottomNavigationBarState extends State<LipsBottomNavigationBar> {
  int _selectedIndex = 0;

  void _updateSelectedIndex({int index}) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      widget.items.length,
      (index) => _buildTabItem(item: widget.items[index], index: index),
    );

    items.insert(
        widget.items.length >> 1,
        Expanded(
          child: SizedBox(
            height: widget.height,
          ),
        ));

    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    ));
  }

  Widget _buildTabItem({LipsBottomNavigationBarItem item, int index}) {
    Color color = index == _selectedIndex ? widget.selectedColor : widget.color;
    return Expanded(
      child: InkWell(
        onTap: () => _updateSelectedIndex(index: index),
        child: SizedBox(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Icon(
                item.iconData,
                color: color,
                size: widget.iconSize,
              ),
              SizedBox(height: 5),
              Text(
                item.destination.title,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
