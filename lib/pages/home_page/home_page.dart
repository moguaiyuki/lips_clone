import 'package:flutter/material.dart';

import '../../utils/styles/styles.dart';
import 'components/custom_tab_indicator.dart';
import 'components/tabs.dart';
import 'tabs/tabs.dart';

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
      backgroundColor: LipsColors.brandSub,
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
              color: LipsColors.mainTextColor,
              fontSize: LipsFontSize.xxsmall,
              fontWeight: FontWeight.w500,
            ),
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
          unselectedLabelColor: LipsColors.mainTextColor,
          labelStyle: TextStyle(fontSize: LipsFontSize.xxsmall),
          indicator: CustomTabIndicator(),
          tabs: lipsTabItems,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Placeholder(),
          Placeholder(),
          Placeholder(),
          RecomendedTabView(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
