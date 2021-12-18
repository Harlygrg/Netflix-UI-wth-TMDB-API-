import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/coming_soon.dart';
import 'package:netflix_clone/screens/downloads.dart';
import 'package:netflix_clone/screens/fast_laughs.dart';
import 'package:netflix_clone/screens/home_page.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex =0;
  final screens =[
    HomePage(),
    ComingSoon(),
    FastLaughs(),
    Downloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          onTap: (index){
            setState(() {
              currentIndex =index;
            });
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: 'Coming Soon',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_very_satisfied_outlined),
              label: 'Fast Laughs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline_outlined),
              label: 'Downloads',
            ),
          ],
        )
    );
  }
}
