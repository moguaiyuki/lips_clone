import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lips_clone/pages/ranking_page/components/ranking_list_view.dart';
import 'package:lips_clone/pages/ranking_page/components/tabs.dart';
import 'package:lips_clone/utils/styles/styles.dart';
import 'package:lips_clone/widgets/lips_tab_indicator.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lipsRankingTabItems.length,
      child: Scaffold(
        backgroundColor: LipsColors.brandSub,
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'すべてのランキング',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(FlutterIcons.down_ant),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: LipsColors.tabLabelColor,
            unselectedLabelColor: LipsColors.tabUnselectedLableColor,
            indicator: LipsTabIndicator(xOffset: 5),
            labelStyle: LipsTextStyle.tablabelStyle,
            tabs: lipsRankingTabItems,
          ),
        ),
        body: TabBarView(
          children: [
            RankingListView(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
