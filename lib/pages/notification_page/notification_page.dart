import 'package:flutter/material.dart';
import 'package:lips_clone/pages/notification_page/components/notification_card.dart';
import 'package:lips_clone/utils/styles/styles.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LipsColors.brandSub,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '通知',
          style: LipsTextStyle.appBarTitleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          NotificationCard(
            body:
                'Visée（ヴィセ）Official アカウントさんが新しく投稿しました\n【話題のクリームハイライト，どう使う？】\n 濡れ艶肌が作れると話題のリップ&チーククリームN SP-10　パーリィベージュ❤️',
            imageUrl: 'assets/images/user5.jpg',
            date: '1日',
            isNew: true,
          ),
          NotificationCard(
            body: 'Lipsへようこそ🎶誰かにオススメしたいコスメがありますか？',
            imageUrl: 'assets/icons/icon_white.png',
            date: '2日',
            isNew: false,
          ),
        ],
      ),
    );
  }
}
