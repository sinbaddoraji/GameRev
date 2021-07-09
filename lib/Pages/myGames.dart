import 'package:flutter/material.dart';
import 'package:gamerev/CustomWidgets/gameCard.dart';

class MyGames extends StatelessWidget {
   MyGames({Key? key, required this.title}) : super(key: key);
   final String title;

   @override
   Widget build(BuildContext context) {

    List<Widget> postedGames = [
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null), 
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
    ];

    List<Widget> favorites = [
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null), 
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
      GamePreview(title: "Super Mario", year: 2001, thumbnail: null),
    ];
    
    
    var count = 2;
    if (MediaQuery.of(context).orientation == Orientation.landscape)
        count = 3;

      return Scaffold(
         appBar: AppBar(
            title: Text(this.title),
         ),
         body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisCount: count,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.78,
              mainAxisSpacing: 12.0,
              shrinkWrap: true,
              children: postedGames
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            if (index == 1)
              Navigator.popUntil(context, ModalRoute.withName('/'));
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