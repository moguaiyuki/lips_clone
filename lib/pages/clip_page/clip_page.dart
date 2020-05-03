import 'package:flutter/material.dart';

import '../../utils/styles/styles.dart';
import '../../widgets/lips_tab_indicator.dart';
import 'components/tabs.dart';
import 'tabs/clip_posts_tab_view.dart/clip_posts_tab_view.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lipsClipTabItems.length,
      child: Scaffold(
        backgroundColor: LipsColors.brandSub,
        appBar: AppBar(
          title: Text(
            'マイクリップ',
            style: LipsTextStyle.appBarTitleTextStyle,
          ),
          bottom: TabBar(
            labelColor: LipsColors.tabLabelColor,
            unselectedLabelColor: LipsColors.tabUnselectedLableColor,
            labelStyle: LipsTextStyle.tablabelStyle,
            indicator: LipsTabIndicator(xOffset: 10),
            tabs: lipsClipTabItems,
          ),
        ),
        body: TabBarView(
          children: [
            ClipPostsTabView(),
            ClipPostsTabView(),
          ],
        ),
      ),
    );
  }
}
