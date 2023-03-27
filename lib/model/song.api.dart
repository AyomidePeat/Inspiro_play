import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inspiro_play/model/song_model.dart';

class SongApi {
  static Future<List<Song>> getSong() async {
    //  String query = artistNames.join('+');
    var uri = Uri.https('spotify23.p.rapidapi.com', '/search/',
        {'q': 'all songs', ' type': 'multi', 'limit': '33'});

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

  static Future<List<Artist>> getArtists() async {
    var uri = Uri.https('spotify23.p.rapidapi.com', '/artists/', {
      'ids':
          '3SgHzT552wy2W8pNLaLk24,22JNV0JWTJkY1qzKJhxdRe,7eEP4TA1RioDH3OBKPcQEC,509E47UmbRPKWPXOMaieh2,06HL4z0CvFAxyc27GXpf02,1ukmGETCwXTbgrTrkRDnmn',
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-Key': '155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32',
      'x-rapidapi-Host': 'spotify23.p.rapidapi.com',
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to retrieve artists: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final artists = data['artists'] as List<dynamic>?;
    if (artists == null) {
      throw Exception('Unexpected response format');
    }

    return Artist.artistFromSnapshot(artists);
  }

  static Future<List<Playlist>> getPlaylist() async {
    var uri = Uri.https('spotify23.p.rapidapi.com', '/playlist_tracks/', {
      'id': '37i9dQZF1DX8091X7wyurB',
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-Key': '155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32',
      'x-rapidapi-Host': 'spotify23.p.rapidapi.com',
    });

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to retrieve playlist tracks: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final tracks = data['items'] as List<dynamic>?;
    if (tracks == null) {
      throw Exception('Unexpected response format');
    }

    return Playlist.playlistFromSnapshot(tracks);
  }
  static Future<List<PlaylistTrack>> getPlaylistTracks() async {
    var uri = Uri.https('spotify23.p.rapidapi.com', '/playlist_tracks/', {
      'id': '37i9dQZF1DX4NsREGkRuCe',
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-Key': '155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32',
      'x-rapidapi-Host': 'spotify23.p.rapidapi.com',
    });

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to retrieve playlist tracks: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final tracks = data['items'] as List<dynamic>?;
    if (tracks == null) {
      throw Exception('Unexpected response format');
    }

    return PlaylistTrack.playlistTrackFromSnapshot(tracks);
  }

  
}
