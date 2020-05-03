import 'package:flutter/material.dart';
import 'package:lips_clone/pages/clip_page/components/tabs.dart';
import 'package:lips_clone/pages/clip_page/tabs/clip_posts_tab_view.dart/clip_posts_tab_view.dart';
import 'package:lips_clone/utils/styles/styles.dart';
import 'package:lips_clone/widgets/lips_tab_indicator.dart';

class ClipPage extends StatefulWidget {
  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: lipsClipTabItems.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LipsColors.brandSub,
      appBar: AppBar(
        title: Text(
          'マイクリップ',
          style: LipsTextStyle.appBarTitleTextStyle,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: LipsColors.tabLabelColor,
          unselectedLabelColor: LipsColors.tabUnselectedLableColor,
          labelStyle: LipsTextStyle.tablabelStyle,
          indicator: LipsTabIndicator(xOffset: 10),
          tabs: lipsClipTabItems,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ClipPostsTabView(),
          ClipPostsTabView(),
        ],
      ),
    );
  }
}
