import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';

class GamePreview extends Card {

   GamePreview({
    Key? key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
    required this.game
  }) : super(key: key);

   final Game game;

  final Color color; 
  final Widget? child;

  
  @override
  Widget build(BuildContext context) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Ink(
              color: Colors.blue,
              child: ListTile(
                title: Text("${game.title} "),
                subtitle: Text("(${game.description})"),
                
              ),
          ),
          Expanded(
            child: new InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/gameDetails');
              },

            )
          )
          
        ],
      );
    //return Container(color: color, child: child);
  }
}