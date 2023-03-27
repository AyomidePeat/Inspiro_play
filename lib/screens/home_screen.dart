import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inspiro_play/model/song.api.dart';
import 'package:inspiro_play/model/song_model.dart';

import 'package:inspiro_play/widgets/daily_widget_card.dart';
import 'package:inspiro_play/widgets/followed_artist_widget.dart';
import 'package:inspiro_play/widgets/recently_played_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController1 = ScrollController();
  bool closeTopWidgets = false;

  List<Song> songs = [];
  List<Artist> artists = [];
  List<Playlist> playlists = [];
  bool isLoading = true;

  String errorMessage = '';
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

  Future<void> getArtists() async {
    try {
      final apiArtists = await SongApi.getArtists();
      setState(() {
        artists = apiArtists;
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

  Future<void> getPlaylist() async {
    try {
      final apiPlaylists = await SongApi.getPlaylist();
      setState(() {
        playlists = apiPlaylists;
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
    getArtists();
    getPlaylist();
    scrollController.addListener(() {
      setState(() {
        closeTopWidgets = scrollController.offset > 50;
      });
    });
  }

  var now = DateTime.now();

  String _getGreeting(int hour) {
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final double topWidgetsHeight= size.height*0.52;
    var greeting = _getGreeting(now.hour);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        actions: [ CircleAvatar( foregroundImage:AssetImage("images/johndoe.jpg",), radius: 50),],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
         
        centerTitle: false,
        title: Text(greeting,
            style: const TextStyle(
                fontSize: 32,
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: size.width,
                            alignment: Alignment.topCenter,
                            height: closeTopWidgets?0:topWidgetsHeight,

                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Followed Artists",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Rubik')),
                                const SizedBox(height: 20),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 100,
                                  ),
                                  child: GridView.builder(
                                    controller:  scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 90,
                                      crossAxisCount: 1,
                                    ),
                                    itemCount: artists.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Artist artist = artists[index];
                                      return FollowedArtistWidget(
                                          name: artists[index].artist,
                                          imageUrl: artists[index].image);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text("Recently Played",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Rubik')),
                                const SizedBox(height: 20),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 200,
                                  ),
                                  child: GridView.builder(
                                   controller:  scrollController1,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 135,
                                      crossAxisCount: 1,
                                    ),
                                    itemCount: songs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return RecentlyPlayedCard(
                                        artist: songs[index].artist,
                                        name: songs[index].name,
                                        imageUrl: songs[index]
                                            .image, // imageUrl: "imageUrl"
                                      );
                                    },
                                  ),
                                ),
                              
                              ],
                            ),
                          ), 
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Top Daily Playlists",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Rubik')),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("See all",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15,
                                                ))),
                                        Icon(Icons.arrow_forward_ios,
                                            color: Colors.grey[700], size: 14)
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: size.height,
                            ),
                            child: GridView.builder(
                              controller: scrollController,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 100,
                                crossAxisCount: 1,
                              ),
                              itemCount: playlists.length-50,
                              itemBuilder: (BuildContext context, int index) {
                                return DailyWidget(
                                  artist: playlists[index].name,
                                  imageUrl: playlists[index].image,
                                  name:
                                      songs[index].name, // imageUrl: "imageUrl"
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
