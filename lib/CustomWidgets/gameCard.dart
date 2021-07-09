import 'package:flutter/material.dart';

class GamePreview extends Card {
  const GamePreview({
    Key? key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
    required this.title,
    required this.year,
    required this.thumbnail
  }) : super(key: key);

  final String title;
  final int year;
  final Image? thumbnail;

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
                title: Text("$title "),
                subtitle: Text("($year)"),
                
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