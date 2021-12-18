import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/coming_soon.dart';
import 'package:netflix_clone/screens/fast_laughs.dart';
import 'package:netflix_clone/screens/downloads.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(child: Text("Coming soon"),),
    );
  }
}
