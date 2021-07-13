import 'package:flutter/material.dart';
import 'package:gamerev/CustomWidgets/gameCard.dart';
import 'package:gamerev/Data/account.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/main.dart';

class MyGames extends StatelessWidget {
   MyGames({Key? key, required this.title}) : super(key: key);
   final String title;


   @override
   Widget build(BuildContext context) {
     List<Game> game = [];
      for(Game g in MyApp.allGames)
      {
          if(g.username == Account.account.user)
          {
              game.add(g);
          }
      }
      return Scaffold(
          appBar: AppBar(
             title: Text("Your games"),
          ),
          body: GridView.builder(
              itemCount: game.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8
              ),
              itemBuilder: (cx, index) {
                 return GamePreview(context, game: game[index]);
              }
          ),
          floatingActionButton:  FloatingActionButton.extended(
             onPressed: () {
                //Add game
                Navigator.of(context).pushNamed('/addgame');
             },
             label: Text('Add Game'),
             icon: Icon(Icons.add),
             backgroundColor: Colors.blueAccent,
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                if (index == 0)
                  Navigator.of(context).popUntil((route) => route.isFirst);
                if(index == 1)
                  Navigator.of(context).pushNamed('/mygames');
                if(index == 2)
                  Navigator.of(context).pushNamed('/profile');
              },
              items: [
                 BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                 BottomNavigationBarItem(icon: Icon(Icons.my_library_books),label: "My Games"),
                 BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              ]
          )
      );
   }
}