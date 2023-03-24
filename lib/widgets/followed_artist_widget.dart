import 'package:flutter/material.dart';

class FollowedArtistWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  const FollowedArtistWidget({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 33,
            backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 5,),
        Text(name,
            style: const TextStyle(
                fontSize: 10, color: Colors.white, fontFamily: 'Rubik')),
      ],
    );
  }
}
