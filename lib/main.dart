import 'package:flutter/material.dart';
import 'package:inspiro_play/screens/discover_screen.dart';
import 'package:inspiro_play/screens/home_screen.dart';
import 'package:inspiro_play/screens/model/screen_layout.dart';
import 'package:inspiro_play/screens/playing_music_screen.dart';
import 'package:inspiro_play/screens/profile_screen.dart';

import 'package:inspiro_play/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ScreenLayout(),
    );
  }
}
