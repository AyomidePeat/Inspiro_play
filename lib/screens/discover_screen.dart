

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspiro_play/screens/model/song.api.dart';
import 'package:inspiro_play/screens/model/song_model.dart';
import 'package:inspiro_play/widgets/default_music_card.dart';
import 'package:inspiro_play/widgets/long_music_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Song> songs = [];
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
         errorMessage =e.toString();
         print(errorMessage);
      });
    }
  }

  void initState() {
    super.initState();

    getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: const [CircleAvatar(/*backgroundImage:NetworkImage("")*/)],
          centerTitle: true,
          title: const Text("Discover",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik')),
        ),
        body: isLoading
            ?const Center(child: CircularProgressIndicator())
          :errorMessage.isNotEmpty? Center(child:Text(errorMessage, style:TextStyle(color:Colors.red))) : ConstrainedBox(
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
                          constraints:const BoxConstraints(
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
                            itemCount: songs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return LongMusicCard(
                                name: songs[index].name,
                                imageUrl: songs[index].image,
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
