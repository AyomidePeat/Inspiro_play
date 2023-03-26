import 'package:flutter/material.dart';

class LongMusicCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const LongMusicCard({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 120,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(name,
                    //     style: const TextStyle(
                    //         fontSize: 30,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontFamily: 'Rubik')),
                    const Text(
                      "Discover More",
                      style: TextStyle(fontSize: 14, fontFamily: 'Rubik'),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ))),
       
      ],
    );
  }
}
