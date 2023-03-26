import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspiro_play/screens/discover_screen.dart';
import 'package:inspiro_play/screens/home_screen.dart';
import 'package:inspiro_play/screens/playing_music_screen.dart';
import 'package:inspiro_play/screens/profile_screen.dart';
import 'package:inspiro_play/screens/settings.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget getBodyWidget() {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return DiscoverScreen();

      case 2:
        return PlayingMusicScreen();
    }
    return ProfileScreen();
  }

  Widget build(BuildContext context) {
    return CupertinoTabScaffold(backgroundColor: Colors.black,
     // body:getBodyWidget(),
       tabBar:CupertinoTabBar(iconSize: 18,
        currentIndex: currentIndex,
       backgroundColor: Colors.black,
     activeColor: Colors.green,
    
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,  ),label:''),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_replace_sharp,), label: '',
            
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.double_music_note), label: ''
              ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings, ), label:''),
        ],
      ), tabBuilder: (BuildContext context, int index) {  return CupertinoTabView(
          builder: (BuildContext context) => getBodyWidget(),
        ); },
    );
  }
}
