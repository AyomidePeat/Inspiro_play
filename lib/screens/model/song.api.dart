// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:inspiro_play/screens/model/song_model.dart';

// class SongApi {
//   static Future<List<Song>> getSong() async {
//     var uri = Uri.https('https://spotify23.p.rapidapi.com/playlist/',
//  'id: 37i9dQZF1DX4Wsb4d7NKfP');

//      final response = await http.get(uri, headers: {
//       "x-rapidapi-Key": "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32",
//       "x-rapidapi-Host": "spotify23.p.rapidapi.com",

//     });

//      Map data = jsonDecode(response.body);
//     List _temp = [];
//     for (var i in data['tracks']['items']) {
//       _temp.add(i['content']['details']);
//     }
//     return Song.songsFromSnapshot(_temp);

//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inspiro_play/screens/model/song_model.dart';

class SongApi {
  static Future<List<Song>> getSong() async {
    // var uri = Uri.https(
    //   'genius-song-lyrics1.p.rapidapi.com','song/recommendations/',
    //   {'id': '2396871'},
    // );
 final response = await http.get(Uri.parse(
      'https://api.musixmatch.com/ws/1.1/album.get?apikey=35ba5d7d631b77092fa6084e43a0cb51&album_id=14250417'));

//musickey = 35ba5d7d631b77092fa6084e43a0cb51

   if (response.statusCode != 200) {
  print('Failed to fetch songs from Genius API with response code: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Exception('Failed to fetch songs from Genius API');
}
    Map data = jsonDecode(response.body);
    List _temp = [];
     {
      _temp.add(['album']);
    }

    return Song.songsFromSnapshot(_temp);
  }
}
