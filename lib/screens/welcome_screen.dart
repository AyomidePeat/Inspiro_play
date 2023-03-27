import 'package:flutter/material.dart';
import 'package:inspiro_play/screens/discover_screen.dart';
import 'package:inspiro_play/screens/playing_music_screen.dart';
import 'package:inspiro_play/screens/profile_screen.dart';
import 'package:inspiro_play/screens/screen_layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      'images/music3.png',
                      height: size.height * 0.7,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 510,
                      right: 1,
                      left: 1,
                     
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(15),
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 10, 10, 10),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Millions of Musics",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: Colors.white,
                                      fontFamily: 'Rubik')),
                              SizedBox(height: 5),
                              Text(
                                  "Be the first to discover, play and share your favorite tracks from emerging artists",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Rubik')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Container(height:100, width:100,
                child: IconButton(
                  icon: Icon(Icons.play_circle_fill,
                      color: Colors.green, size:100 ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenLayout()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
