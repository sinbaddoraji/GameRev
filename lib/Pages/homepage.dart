import 'package:flutter/material.dart';
import 'package:gamerev/CustomWidgets/gameCard.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key, required this.title}) : super(key: key);
   final String title;

   @override
   Widget build(BuildContext context) {

  List<Widget> games = [
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null), 
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null), 
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null), 
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null)
    ];

      for(var gamePreview in games)
      {
          //gamePreview.
      }
      return Scaffold(
         appBar: AppBar(
            title: Text(this.title),
         ),
         body: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.78,
              mainAxisSpacing: 12.0,
              
              shrinkWrap: true,
              maxCrossAxisExtent: 200,
              children: games
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