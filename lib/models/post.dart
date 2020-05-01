import 'package:lips_clone/models/user.dart';

class Post {
  final int likes;
  final int clips;
  final String date = '2020.04.19';
  final User user;
  final String imageUrl;
  final String description;

  Post({this.likes, this.clips, this.user, this.imageUrl, this.description});
}
