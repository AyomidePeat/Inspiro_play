import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspiro_play/model/song.api.dart';
import 'package:inspiro_play/model/song_model.dart';
import 'package:inspiro_play/widgets/default_music_card.dart';
import 'package:inspiro_play/widgets/genere_card.dart';
import 'package:inspiro_play/widgets/long_music_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Song> songs = [];
  List<PlaylistTrack> playlistTracks = [];
  List genres = [
    'Classical',
    'Pop',
    'Jazz',
    'Rock',
    'Hip-hop',
    'Blues',
    'Country',
    'Karoke'
  ];
  List imageUrl = [
    "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg",
    "https://i.scdn.co/image/ab67706c0000da84121aa0838c964a931587d535",
    "https://i.scdn.co/image/ab67706f000000025ea54b91b073c2776b966e7",
    "https://i.scdn.co/image/ab67706f00000002c80d206d12633e1bd848440d",
    "https://i.scdn.co/image/ab67706c0000da842f2a2f4b44bc5737585c9558",
    "https://i.scdn.co/image/ab67706f00000002e8d2d867e32fdaa12aa79d57",
    "https://i.scdn.co/image/ab67706f00000002e5f5faf5b929c733c8a1b824",
    "https://i.scdn.co/image/ab67706c0000da846b92e44ac1af9d8b46668d14"
  ];
  bool isLoading = true;
  String errorMessage = '';
  SongApi songApi = SongApi();

  Future<void> getSongs() async {
    try {
      final apiSongs = await SongApi.getSong();
      setState(() {
        songs = apiSongs;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
        print(errorMessage);
      });
    }
  }

  Future<void> getPlaylistTrack() async {
    try {
      final apiPlaylistTrack = await SongApi.getPlaylistTracks();
      setState(() {
        playlistTracks = apiPlaylistTrack;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
        print(errorMessage);
      });
    }
  }

  void initState() {
    super.initState();

    getSongs();
    getPlaylistTrack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: const [
            CircleAvatar(
                foregroundImage: AssetImage(
                  "images/johndoe.jpg",
                ),
                radius: 50)
          ],
          centerTitle: true,
          title: const Text("Discover",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik')),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(
                    child:
                        Text(errorMessage, style: TextStyle(color: Colors.red)))
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(),
                            const SizedBox(height: 25),
                            const Text("Perfect for you",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rubik')),
                            const SizedBox(height: 25),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 180,
                              ),
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 130,
                                  crossAxisCount: 1,
                                ),
                                itemCount: genres.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GenreCard(
                                    name: genres[index],
                                    imageUrl: imageUrl[index],
                                  );
                                },
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 180,
                              ),
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 310,
                                  crossAxisCount: 1,
                                ),
                                itemCount: playlistTracks.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return LongMusicCard(
                                    name:playlistTracks[index].name,
                                    imageUrl: playlistTracks[index].image,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Text("Popular Hits",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rubik')),
                            const SizedBox(height: 25),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 180,
                              ),
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 130,
                                  crossAxisCount: 1,
                                ),
                                itemCount: songs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return DefaultMusicCard(
                                    name: songs[index].name,
                                    imageUrl: songs[index].image,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontFamily: 'Rubik'),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          filled: true,
          fillColor: Color.fromARGB(255, 24, 22, 22),
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.grey[700], fontSize: 20, fontFamily: 'Rubik'),
          prefixIcon: Icon(Icons.search, size: 40, color: Colors.grey[700]),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(14.0))),
    );
  }
}
