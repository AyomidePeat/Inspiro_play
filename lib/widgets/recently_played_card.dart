import 'package:flutter/material.dart';

class RecentlyPlayedCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String artist;
  const RecentlyPlayedCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            width: 120,
            // margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
           
            ),
        const SizedBox(height: 5),
        Text(name, maxLines: 1, 
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Rubik')),
        Text(artist,
            style: const TextStyle(
                fontSize: 12,
              
                color: Colors.white,
                fontFamily: 'Rubik')),
      ],
    );
  }
}
