import 'dart:math';

import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/post.dart';
import '../models/user.dart';

var random = Random();

final userNames = [
  "ハル",
  "ごわちゃん",
  "きりたんぽ",
  "めぐ",
  "ぱぴこ",
  "まっちゃラテ",
  "あさい",
];

final itemNames = [
  'リップジェル',
  'おなかすいた',
  'マーメイド',
  'エリクシールフレーバー',
  'グリッタープリズム',
];

final itemBrands = [
  'MISSHA',
  'エリクシール',
  'ディズニーストア',
  'DAISO',
  'the SAEM',
];

final users = List.generate(
  7,
  (index) => User(
    name: userNames[index],
    profileImageUrl: "assets/images/user$index.jpg",
    description: "ゴールデンウィークがひますぎて．．．",
    star: random.nextInt(3) + 2,
  ),
);

final posts = List.generate(
  300,
  (index) => Post(
    imageUrl: "assets/images/post${index % 7}.jpeg",
    likes: random.nextInt(300),
    clips: random.nextInt(20),
    user: users[index % 7],
    description: "エリクシールさんのバランシングミルクIIで，ついにアンチエイジング始めます🥰",
    item: Item(
      imageUrl: "assets/images/item${random.nextInt(5)}.png",
      name: itemNames[random.nextInt(5)],
      brand: itemBrands[random.nextInt(5)],
    ),
  ),
);

List<Item> generateItems({@required int length}) => List<Item>.generate(
      length,
      (index) => Item(
        name: itemNames[random.nextInt(5)],
        brand: itemBrands[random.nextInt(5)],
        imageUrl: "assets/images/cosme${random.nextInt(12)}.png",
        star: random.nextDouble() * 2 + 3,
        commentCount: random.nextInt(300),
        isTaxIncluded: random.nextBool(),
        price: random.nextInt(3000) + 1000,
      ),
    );
