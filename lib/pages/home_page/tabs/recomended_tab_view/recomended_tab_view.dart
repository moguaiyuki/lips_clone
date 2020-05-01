import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lips_clone/data/data.dart';
import 'package:lips_clone/utils/styles/colors.dart';

class RecomendedTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage(post.imageUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 35,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(post.user.profileImageUrl),
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              post.user.name,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: LipsColors.mainTextColor,
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  size: 10,
                                  color: post.user.star >= index
                                      ? LipsColors.brand
                                      : Colors.grey[400],
                                );
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      post.description,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 10,
                                  color: Colors.grey[500],
                                ),
                                Text(
                                  post.likes.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  AntDesign.paperclip,
                                  size: 10,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  post.likes.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          post.date,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[400],
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image(
                        image: AssetImage(post.item.imageUrl),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.item.brand,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            post.item.name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
    );
  }
}
