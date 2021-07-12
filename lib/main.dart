import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Pages/myGames.dart';

import 'Pages/gameDetails.dart';
import 'Pages/homepage.dart';
import 'Pages/profile.dart';
import 'Pages/addGame.dart';

import 'Pages/register.dart';
import 'Pages/reviews.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

  static List<Game> allGames = [];
   @override
   Widget build(BuildContext context) 
   {
        var routes = {
            '/profile' : (context) => Profile(),
            '/register' : (context) => Register(),
            '/addgame' : (context) => AddGame(title: 'Add Game'),
            '/mygames' : (context) => MyGames(title: 'My Games')
        };

       return MaterialApp(
          title: 'Material App',
          routes: routes,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new HomePage()
        );

   }
}
