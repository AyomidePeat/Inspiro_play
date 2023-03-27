import 'package:flutter/material.dart';
import 'package:inspiro_play/screens/model/song.api.dart';
import 'package:inspiro_play/screens/model/song_model.dart';
import 'package:inspiro_play/widgets/daily_widget_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Song> songs = [];
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 19,
            )),
        centerTitle: true,
        title: const Text("Profile",
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
                :Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(/*backgroundImage:NetworkImage(""),*/ radius: 46),
                const SizedBox(
                  height: 13,
                ),
               const Text("Computer Surgeon",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Rubik')),
                const SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 0.5, color: Color.fromARGB(255, 51, 49, 49)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Edit Profile",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'))),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('0',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                        const SizedBox(height: 5),
                        Text('Fav. Songs',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('0',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                        const SizedBox(height: 5),
                        Text('Followers',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('0',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                        const SizedBox(height: 5),
                        Text('Following',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Rubik')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  constraints: const BoxConstraints(
                    maxHeight: 380,
                  ),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 70,
                      crossAxisCount: 1,
                    ),
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DailyWidget(
                          artist: songs[index].artist,
                          name: songs[index].name,
                          imageUrl: songs[index].image);
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
