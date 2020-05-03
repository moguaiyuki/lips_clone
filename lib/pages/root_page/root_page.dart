import 'package:flutter/material.dart';
import 'package:lips_clone/pages/posting_page/posting_page.dart';

import '../../utils/styles/styles.dart';
import '../clip_page/clip_page.dart';
import '../home_page/home_page.dart';
import '../notification_page/notification_page.dart';
import '../ranking_page/ranking_page.dart';
import 'components/destinations.dart';
import 'components/lips_bottom_navigation_bar.dart';
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
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          backgroundColor: LipsColors.brand,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PostingPage(),
            ),
          ),
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
    return lipsBottomNavigationBarItems.map((lipsBottomNavigationBarItem) {
      final Widget view = FadeTransition(
        opacity: _faders[lipsBottomNavigationBarItem.destinationIndex].drive(
          CurveTween(curve: Curves.fastOutSlowIn),
        ),
        child: KeyedSubtree(
          key: _destinationKeys[lipsBottomNavigationBarItem.destinationIndex],
          child: _destinationPage(
            destination: lipsBottomNavigationBarItem.destination,
          ),
        ),
      );
      if (lipsBottomNavigationBarItem.destinationIndex == _currentIndex) {
        _faders[lipsBottomNavigationBarItem.destinationIndex].forward();
        return view;
      } else {
        _faders[lipsBottomNavigationBarItem.destinationIndex].reverse();
        if (_faders[lipsBottomNavigationBarItem.destinationIndex].isAnimating) {
          return IgnorePointer(child: view);
        }
        return Offstage(child: view);
      }
    }).toList();
  }

  Widget _destinationPage({
    Destination destination,
  }) {
    switch (destination) {
      case Destination.home:
        return HomePage();
      case Destination.ranking:
        return RankingPage();
      case Destination.clip:
        return ClipPage();
      case Destination.notification:
        return NotificationPage();
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
