// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:spotify_app/services/category_operations.dart';
import 'package:spotify_app/services/music_operations.dart';

import '../models/category.dart';
import '../models/music.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createCategory(Category category) {
    return Container(
      color: Colors.grey.shade900,
      child: Row(
        children: [
          Image.network(category.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList = CategoryOperations.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 150,
            child: InkWell(
              onTap: () {
                _miniPlayer(music, stop: true);
              },
              child: Image.network(
                music.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      height: 150,
      child: GridView.count(
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String msg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          msg,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: const [Icon(Icons.settings)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          // padding: EdgeInsets.all(value),
          color: Colors.black,
          child: Column(
            children: [
              createAppBar('Good Morning'),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: createGrid(),
              ),
              createMusicList('Made For You'),
              createMusicList('Popular Playlists'),
            ],
          ),
        ),
      ),
    );
  }
}
