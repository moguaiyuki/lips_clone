import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lips_clone/models/item.dart';
import 'package:intl/intl.dart';
import 'package:lips_clone/pages/ranking_page/components/ranking_label_clipper.dart';
import 'package:lips_clone/utils/styles/styles.dart';

enum RankingType { hotRanking, monthlyRanking }

class RankingListTile extends StatelessWidget {
  final Item item;
  final NumberFormat _formatCurrency =
      NumberFormat.simpleCurrency(locale: "ja");
  final RankingType rankingType;
  final int rank;

  RankingListTile({
    Key key,
    this.item,
    this.rankingType,
    this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.only(top: 10),
            height: 100,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image(
                      image: AssetImage(item.imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  child: _buildRankingLabel(),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      AntDesign.paperclip,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
                Text(
                  item.brand,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, color: Colors.black38),
                ),
                Text(
                  '${_formatCurrency.format(item.price)}(${item.isTaxIncluded ? '税込' : '税抜'})',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 2),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: LipsColors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '★${item.star.toStringAsFixed(1)}(${item.commentCount}件)',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRankingLabel() {
    switch (rankingType) {
      case RankingType.hotRanking:
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.flash_on,
            color: Colors.grey,
            size: 20,
          ),
        );
      case RankingType.monthlyRanking:
        return ClipPath(
          clipper: RankingLabelClipper(),
          child: Container(
            alignment: Alignment.center,
            height: 30,
            width: 20,
            color: LipsColors.brand,
            child: Text(
              rank.toString().padLeft(2, '0'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
