import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';

class GameDetails extends StatelessWidget
{
  GameDetails({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  Widget build(BuildContext context) {

    var _base64 = base64Decode(game.thumbnail);
    Image img = Image.memory(_base64);

    var circleAvatar = Container(
      width: 300,
      height: 300,
      child: img
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(this.game.title),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Center(
                    child: circleAvatar
                ),
                Text("Name of Game: ${game.title}"),
                Text("Name of Game: ${game.publisher}"),
                Text("Release year: ${game.release_year}"),
                Text("Posted ${game.post_date} by ${game.username}"),
              ],
            ),
          )
        ),
        floatingActionButton:  FloatingActionButton.extended(
          onPressed: () {
            //Add game
            Navigator.of(context).pushNamed('/addgame');
          },
          label: const Text('Add Game'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index){
              if(index == 1)
                Navigator.of(context).popAndPushNamed('/reviews');
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.my_library_books),label: "My Games"),
              BottomNavigationBarItem(icon: Icon(Icons.reviews),label: "Reviews"),
            ]
        )
    );
  }

}