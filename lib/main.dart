import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/coming_soon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      //ComingSoon(),
      HomePage(),
    );
  }
}

