import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final Color icolor;
  const NotificationWidget({
    Key key,
    this.icolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.notifications_none,
      color: icolor,
    );
  }
}
