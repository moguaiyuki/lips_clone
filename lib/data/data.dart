import 'dart:math';

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
  'エリクシール　フレーバー',
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
      name: itemNames[random.nextInt(4)],
      brand: itemBrands[random.nextInt(4)],
    ),
  ),
);
