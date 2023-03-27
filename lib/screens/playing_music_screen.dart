import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayingMusicScreen extends StatefulWidget {
  const PlayingMusicScreen({super.key});

  @override
  State<PlayingMusicScreen> createState() => _PlayingMusicScreenState();
}

class _PlayingMusicScreenState extends State<PlayingMusicScreen> {
  bool isFavoritePressed = false;
  bool isRepeatPressed = false;
  bool isPlayPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: Icon(Icons.keyboard_arrow_down_sharp)),
        actions: [],
        centerTitle: true,
        title: Text("Chill Collection",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: NetworkImage(imageUrl),
                    //   fit: BoxFit.cover,
                    // ),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            Text("Chill Collection",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Rubik')),
            SizedBox(
              height: 10,
            ),
            Text("Chill Collection",
                style: const TextStyle(
                    fontSize: 13, color: Colors.grey, fontFamily: 'Rubik')),
            const SizedBox(
              height: 25,
            ),
            //slider,
            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Next:",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: 'Rubik')),
                Text("Next Music()",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontFamily: 'Rubik')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        isFavoritePressed = !isFavoritePressed;
                      });
                    },
                    icon: isFavoritePressed
                        ? Icon(Icons.favorite, color: Colors.green)
                        : Icon(Icons.favorite_border,
                            color: Colors.grey, size: 20)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.backward_end_fill,
                        color: Colors.white, size: 20)),
                Container(
                  height: 100,
                  width: 100,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPlayPressed = !isPlayPressed;
                        });
                      },
                      icon: isPlayPressed
                          ? Icon(
                              CupertinoIcons.pause_circle_fill,
                              color: Colors.white,
                              size: 70,
                            )
                          : Icon(
                              CupertinoIcons.play_circle_fill,
                              color: Colors.white,
                              size: 70,
                            )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.forward_end_fill,
                        color: Colors.white, size: 20)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isRepeatPressed = !isRepeatPressed;
                      });
                    },
                    icon:  Icon(CupertinoIcons.repeat,
                        color: isRepeatPressed? Colors.green:Colors.grey, size: 20)),
              ],
            ),
            const SizedBox(height:15),
             TextButton(onPressed: (){},
               child: Column(
                 children: [
                   Text("LYRICS",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: 'Rubik')),
                              Icon(Icons.keyboard_arrow_down_rounded, color:Colors.grey)
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
