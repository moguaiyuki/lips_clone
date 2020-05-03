import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String body;
  final String imageUrl;
  final String date;
  final bool isNew;

  const NotificationCard({
    Key key,
    @required this.body,
    @required this.imageUrl,
    @required this.date,
    @required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isNew ? Color(0xFFFEEFF1) : Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image(
              image: AssetImage(imageUrl),
              height: 64,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                child: Text(
                  body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
