import 'package:flutter/material.dart';
import 'package:gamerev/Data/game.dart';

import 'Pages/gameDetails.dart';
import 'Pages/homepage.dart';
import 'Pages/profile.dart';
import 'Pages/addGame.dart';

import 'Pages/register.dart';
import 'Pages/reviews.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget 
{
   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) 
   {
        var routes = {
            '/profile' : (context) => Profile(),
            '/reviews' : (context) => Reviews(title: 'Reviews'),
            '/addgame' : (context) => AddGame(title: 'Add Game')
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
