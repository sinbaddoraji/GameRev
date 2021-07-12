import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Pages/reviews.dart';

class GameDetails extends StatelessWidget
{
  GameDetails({Key? key, required this.game, required this.img}) : super(key: key);
  final Game game;
  Image img;

  @override
  Widget build(BuildContext context) {

    var _base64 = base64Decode(game.thumbnail);

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
                circleAvatar,
                Text("Name of Game: ${game.title}"),
                Text("Name of Game: ${game.publisher}"),
                Text("Release year: ${game.release_year}"),
                Text("Posted ${game.post_date} by ${game.username}"),
              ],
            ),
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index){
              if (index == 0)
                Navigator.of(context).popUntil((route) => route.isFirst);
              if(index == 1)
                Navigator.of(context).pushNamed('/mygames');
              if(index == 2)
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reviews(game: game, title: "${game.title} reviews")));
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