import 'package:flutter/material.dart';

import '../../../utils/styles/styles.dart';

class RankingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'サブカテゴリー',
            style: TextStyle(
              color: LipsColors.brand,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildOption(title: 'すべて', isChecked: true),
        _buildOption(title: '化粧下地・コントロールカラー', isChecked: false),
        _buildOption(title: 'ファンデーション', isChecked: false),
        _buildOption(title: 'コンシーラー', isChecked: false),
        _buildOption(title: 'チーク', isChecked: false),
        _buildOption(title: 'フェイスパウダー', isChecked: false),
        _buildOption(title: 'ハイライト・シェーディング', isChecked: false),
      ],
    );
  }

  _buildOption({String title, bool isChecked}) => Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[300],
            ),
          ),
          color: Colors.grey[100],
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isChecked ? Colors.black87 : Colors.black54,
              ),
            ),
            isChecked
                ? Icon(
                    Icons.check,
                    color: LipsColors.brand,
                  )
                : Text('')
          ],
        ),
      );
}
