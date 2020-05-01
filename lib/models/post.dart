import 'item.dart';
import 'user.dart';

class Post {
  final int likes;
  final int clips;
  final String date = '2020.04.19';
  final User user;
  final String imageUrl;
  final String description;
  final Item item;

  Post({
    this.likes,
    this.clips,
    this.user,
    this.imageUrl,
    this.description,
    this.item,
  });
}
