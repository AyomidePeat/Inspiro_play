import 'package:flutter/material.dart';

class LongMusicCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const LongMusicCard({Key? key, required this.imageUrl, required this.name}) : super(key: key);

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
          child:  Center(
            child: Text(name, overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik')),
          ),
        ),
      ],
    );
  }
}
