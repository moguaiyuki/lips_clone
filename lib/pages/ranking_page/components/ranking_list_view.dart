import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../models/item.dart';
import '../../../utils/styles/styles.dart';
import 'ranking_bottom_sheet.dart';
import 'ranking_list_tile.dart';

class RankingListView extends StatelessWidget {
  final List<Item> _upComingItems;
  final List<Item> _rankingItems;
  RankingListView()
      : _upComingItems = generateItems(length: 3),
        _rankingItems = generateItems(length: 50);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 20),
                    Text('急上昇'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.7,
                ),
                delegate: SliverChildListDelegate(
                  List<RankingListTile>.generate(
                    _upComingItems.length,
                    (index) => RankingListTile(
                      item: _upComingItems[index],
                      rankingType: RankingType.hotRanking,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  Text('月間ランキング'),
                  SizedBox(height: 20),
                ]),
              ),
              SliverGrid.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.7,
                children: List<RankingListTile>.generate(
                  _rankingItems.length,
                  (index) => RankingListTile(
                    item: _rankingItems[index],
                    rankingType: RankingType.monthlyRanking,
                    rank: index + 1,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 40),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return RankingBottomSheet();
                  }),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                decoration: BoxDecoration(
                    color: LipsColors.grey.withAlpha(240),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'サブカテゴリー: すべて',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
