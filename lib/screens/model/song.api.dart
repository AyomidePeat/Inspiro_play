import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inspiro_play/screens/model/song_model.dart';

class SongApi {
  static Future<List<Song>> getSong() async {
    //  String query = artistNames.join('+');
    var uri = Uri.https(
        'spotify23.p.rapidapi.com', '/search/', {'q': 'all songs',' type': 'multi', 'limit': '33'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-Key": "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32",
      "x-rapidapi-Host": "spotify23.p.rapidapi.com",
    });
    Map data = jsonDecode(response.body);
    
    List _temp = [];
    for (var i in data['albums']['items']) {
      _temp.add(i['data']);
      
    }
   
    return Song.songsFromSnapshot(_temp);
  }
}

