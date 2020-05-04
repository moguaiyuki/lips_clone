import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../utils/styles/styles.dart';

class PostingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _boxSize = (MediaQuery.of(context).size.width - 60) / 4;
    return Scaffold(
      backgroundColor: LipsColors.brandSub,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 40,
          color: Colors.black45,
        ),
        title: Text(
          'クチコミを投稿',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              '投稿する',
              style: TextStyle(
                color: LipsColors.brand,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              _buildFormLabel(
                title: '画像を追加',
                iconData: Icons.photo_camera,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildAddBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                ],
              ),
              SizedBox(height: 10),
              _buildFormLabel(
                title: '商品を追加',
                iconData: Icons.shop,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildAddBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                  SizedBox(width: 10),
                  _buildEmptyBox(_boxSize),
                ],
              ),
              SizedBox(height: 10),
              _buildFormLabel(
                title: 'ジャンルを選択',
                iconData: FlutterIcons.grid_ent,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                onChanged: (val) {},
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                ),
                value: '選択してください',
                items: [
                  DropdownMenuItem(child: Text('選択してください'), value: '選択してください'),
                  DropdownMenuItem(child: Text('コスメ'), value: 'コスメ'),
                  DropdownMenuItem(child: Text('スキンケア'), value: 'スキンケア'),
                  DropdownMenuItem(
                      child: Text('ヘアケア・ヘアアレンジ'), value: 'ヘアケア・ヘアアレンジ'),
                  DropdownMenuItem(child: Text('ネイル'), value: 'ネイル'),
                ],
              ),
              SizedBox(height: 10),
              _buildFormLabel(
                title: 'クチコミを書く',
                iconData: FlutterIcons.pencil_oct,
              ),
              SizedBox(height: 10),
              TextField(
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                  hintText: "",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormLabel({String title, IconData iconData}) => Row(
        children: [
          Icon(
            iconData,
            color: LipsColors.brand,
            size: 30,
          ),
          SizedBox(width: 30),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      );

  Widget _buildAddBox(boxSize) => Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Icon(
          Icons.add,
          size: 35,
          color: LipsColors.brand,
        ),
      );

  Widget _buildEmptyBox(boxSize) => DottedBorder(
        color: Colors.grey,
        padding: EdgeInsets.all(0),
        borderType: BorderType.RRect,
        radius: Radius.circular(5),
        strokeWidth: 1,
        child: SizedBox(
          width: boxSize,
          height: boxSize,
        ),
      );
}
