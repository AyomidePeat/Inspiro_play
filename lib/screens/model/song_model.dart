
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
