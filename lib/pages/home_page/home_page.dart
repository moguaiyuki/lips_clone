import 'package:flutter/material.dart';
import 'package:lips_clone/widgets/lips_tab_indicator.dart';

import '../../utils/styles/styles.dart';
import 'components/tabs.dart';
import 'tabs/tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lipsHomeTabItems.length,
      initialIndex: 3,
      child: Scaffold(
        backgroundColor: LipsColors.brandSub,
        appBar: AppBar(
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
            labelColor: LipsColors.tabLabelColor,
            unselectedLabelColor: LipsColors.tabUnselectedLableColor,
            labelStyle: LipsTextStyle.tablabelStyle,
            indicator: LipsTabIndicator(),
            tabs: lipsHomeTabItems,
          ),
        ),
        body: TabBarView(
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
      ),
    );
  }
}
