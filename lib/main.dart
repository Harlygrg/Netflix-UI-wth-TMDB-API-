import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/details_page.dart';

import 'actions/bottom_nav_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home:BottomNavBar(),
    );
  }
}

