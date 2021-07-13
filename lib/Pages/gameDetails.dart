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
            width: 1000,
            child: ListView(
              children: [
                SizedBox(height: 16),
                circleAvatar,
                Text("Name of Game: ${game.title}", textScaleFactor: 2, textAlign: TextAlign.center),
                SizedBox(height: 16),
                Text("Publisher: ${game.publisher}", textScaleFactor: 2, textAlign: TextAlign.center),
                SizedBox(height: 16),
                Text("Release year: ${game.release_year}", textScaleFactor: 2, textAlign: TextAlign.center),
                SizedBox(height: 16),
                Text("Posted ${game.post_date} by ${game.username}", textScaleFactor: 2, textAlign: TextAlign.center),
                SizedBox(height: 16),
                TextField(
                  readOnly: true,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder
                          (
                            borderSide: new BorderSide(color: Colors.teal)
                        ),
                        labelText: 'Description',
                        prefixText: ' ',
                        suffixStyle: const TextStyle(color: Colors.green)
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: TextEditingController(text: "${game.description}\n\n\n\n")
                )
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