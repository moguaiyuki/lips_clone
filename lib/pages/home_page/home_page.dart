import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/icons/icon_white.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 70),
          shape: StadiumBorder(),
          color: Colors.grey[200],
          onPressed: () {},
          child: Text(
            'キーワードで検索',
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey[400],
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: Placeholder(),
    );
  }
}
