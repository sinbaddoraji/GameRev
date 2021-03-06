import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Pages/gameDetails.dart';
import 'dart:convert';

class GamePreview extends Card {

   GamePreview(this.parentContext, {
    Key? key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
    required this.game
  }) : super(key: key);

   final Game game;

  final Color color; 
  final Widget? child;
  final BuildContext parentContext;
  
  @override
  Widget build(BuildContext context) {
      var _base64 = base64Decode(game.thumbnail);
      Image img = Image.memory(_base64);

      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Ink(
              color: Colors.blue,
              child: ListTile(
                title: Text("${game.title}"),
                subtitle: Text("(Release year - ${game.release_year})"),
              ),
          ),
          Expanded(
            child: new InkWell(
              highlightColor: Colors.blueAccent,
              hoverColor: Colors.black26,
              child: Container(
                child: img,
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameDetails(game: game, img: img)));
              },

            )
          )
          
        ],
      );
    //return Container(color: color, child: child);
  }
}