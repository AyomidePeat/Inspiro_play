import 'package:flutter/material.dart';

class DailyWidget extends StatelessWidget {
  final String name;
  final String artist;
  final String imageUrl;
  const DailyWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return  Align(alignment: Alignment.bottomRight,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              )),
              const SizedBox(width:15),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               const   SizedBox(height:13),
                  SizedBox(width:100,
                    child: Text(name,
                    maxLines:1,softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Rubik')),
                  ),
                  Text('By $artist',
                  style: const TextStyle(
                      fontSize: 10,
                  
                      color: Colors.white,
                      fontFamily: 'Rubik')),
                ],
              ),
    
        ],
      ),
    );
  }
}
