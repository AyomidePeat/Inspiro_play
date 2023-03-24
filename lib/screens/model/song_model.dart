
class Song {
  final String name;
  final String image;
  final String artist;

  Song({required this.name, required this.image, required this.artist});
  factory Song.fromJson(dynamic json) {
  return Song(
    artist: json['artist_name'] as String,
    image: json[''] as String,
    name: json['album_name'] as String,
  );
}


  static List<Song> songsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Song.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Song{name:$name, image:$image, artist:$artist}';
  }
}
