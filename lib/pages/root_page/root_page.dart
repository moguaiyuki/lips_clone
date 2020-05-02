import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lips_clone/pages/home_page/home_page.dart';
import 'package:lips_clone/pages/root_page/components/lips_bottom_navigation_bar.dart';
import 'package:lips_clone/utils/styles/colors.dart';
import 'components/destinations.dart';

import 'components/lips_bottom_navigation_bar_item.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with TickerProviderStateMixin<RootPage> {
  int _currentIndex = 0;
  List<AnimationController> _faders;
  List<GlobalKey> _destinationKeys;

  @override
  void initState() {
    super.initState();
    _faders = List<AnimationController>.generate(
      lipsBottomNavigationBarItems.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ),
      ),
    );
    _faders[_currentIndex].value = 1.0;

    _destinationKeys = List<GlobalKey>.generate(
      lipsBottomNavigationBarItems.length,
      (int index) => GlobalKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          backgroundColor: LipsColors.brand,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 40,
          ),
          elevation: 5.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: LipsBottomNavigationBar(
        color: Colors.grey[400],
        selectedColor: Colors.grey[800],
        nothcedshape: CircularNotchedRectangle(),
        onTabSelected: _onTabSelected,
        iconSize: 30,
        items: lipsBottomNavigationBarItems,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: _buildDestinationPage(),
      ),
    );
  }

  List<Widget> _buildDestinationPage() {
    List<Widget> views = [];
    lipsBottomNavigationBarItems
        .asMap()
        .forEach((index, lipsBottomNavigationBarItem) {
      print(index);
      final Widget view = FadeTransition(
        opacity: _faders[index].drive(
          CurveTween(curve: Curves.fastOutSlowIn),
        ),
        child: KeyedSubtree(
          key: _destinationKeys[index],
          child: _destinationPage(
            destination: lipsBottomNavigationBarItem.destination,
          ),
        ),
      );
      if (index == _currentIndex) {
        _faders[index].forward();
        views.add(view);
      } else {
        _faders[index].reverse();
        if (_faders[index].isAnimating) {
          views.add(IgnorePointer(child: view));
        }
        views.add(Offstage(child: view));
      }
    });
    return views;
  }

  Widget _destinationPage({
    Destination destination,
  }) {
    switch (destination) {
      case Destination.home:
        return HomePage();
      case Destination.ranking:
        return HomePage();
      case Destination.clip:
        return HomePage();
      case Destination.notification:
        return HomePage();
      default:
        return HomePage();
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }
}
