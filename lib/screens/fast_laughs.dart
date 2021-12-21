import 'package:flutter/material.dart';

class FastLaugh extends StatefulWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  _FastLaughState createState() => _FastLaughState();
}

class _FastLaughState extends State<FastLaugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Fast laughs",style: TextStyle(fontSize: 35),),
      ),
    );
  }
}
