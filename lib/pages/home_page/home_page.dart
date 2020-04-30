import 'package:flutter/material.dart';
import 'package:lips_clone/pages/home_page/components/custom_tab_indicator.dart';
import 'package:lips_clone/pages/home_page/components/tabs.dart';
import 'package:lips_clone/utils/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: lipsTabItems.length,
      vsync: this,
      initialIndex: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/icons/icon_white.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 70),
          shape: StadiumBorder(),
          color: Colors.grey[200],
          onPressed: () {},
          child: Text(
            'キーワードで検索',
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: LipsFontSize.xxsmall,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey[400],
                size: 40,
              ),
            ),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[600],
          labelStyle: TextStyle(fontSize: LipsFontSize.xxsmall),
          indicator: CustomTabIndicator(),
          tabs: lipsTabItems,
        ),
      ),
      body: Placeholder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
