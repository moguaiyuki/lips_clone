import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../data/data.dart';
import 'components/feed_grid_tile.dart';

class RecomendedTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (BuildContext context, int index) => FeedGridTile(
        post: posts[index],
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
    );
  }
}
