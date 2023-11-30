import 'package:flutter/material.dart';
import 'user_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfoPage(),
    );
  }
}
