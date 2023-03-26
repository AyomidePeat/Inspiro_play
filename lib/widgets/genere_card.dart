import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const GenreCard({
    Key? key,
    required this.name,
    required this.imageUrl,
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
            // child: Align(
            //   alignment: Alignment.topCenter,
            //   child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Text(name,
            //           style: const TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.w500,
            //               color: Colors.white,
            //               fontFamily: 'Rubik'))),
            // )
            ),
           const  SizedBox(height:5),
        Text(name,maxLines: 1,overflow: TextOverflow.clip,
            style: const TextStyle(
              
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Rubik')),
      ],
    );
  }
}
