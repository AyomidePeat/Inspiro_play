class Song {
  final String name;
  final String artist;
  final String image;
  Song({required this.name, required this.image, required this.artist});

  static List<Song> songsFromSnapshot(List<dynamic> snapshot) {
    List<Song> songs = [];
    for (var i in snapshot) {
      String name = i['name'];
      String artist = i['artists']['items'][0]['profile']['name'];
      String image = i["coverArt"]['sources'][0]['url'];
      songs.add(Song(name: name, artist: artist, image: image));
    }
    return songs;
  }
}

class Artist {
  final String artist;
  final String image;
  Artist({required this.image, required this.artist});

  static List<Artist> artistFromSnapshot(List<dynamic> snapshot) {
    List<Artist> artists = [];
    for (var i in snapshot) {
      String artist = i['name'];
      String image = i["images"][0]['url'];
      artists.add(Artist(artist: artist, image: image));
    }
    return artists;
  }
}
class Playlist {
  final String name;
  final String image;
 Playlist({required this.image, required this.name});

  static List<Playlist> playlistFromSnapshot(List<dynamic> snapshot) {
    List<Playlist> playlist = [];
    for (var i in snapshot) {
      String name = i['track']['name'];
      String image = i['track']['album']["images"][0]['url'];
      playlist.add(Playlist(name: name, image: image));
    }
    return playlist;
  }
}

 