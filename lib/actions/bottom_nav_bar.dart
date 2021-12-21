import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/downloads.dart';
import 'package:netflix_clone/screens/fast_laughs.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/coming_soon.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex =0;
  final screens =[
    HomePage(),
    ComingSoon(),
    FastLaugh(),
    Downloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white60,
            selectedItemColor: Colors.white,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                currentIndex =index;
              });
            },
            items: const <BottomNavigationBarItem>[
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
          ),
        ));
  }
}
