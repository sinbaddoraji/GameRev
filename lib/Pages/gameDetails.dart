import 'package:flutter/material.dart';

class GameDetails extends StatelessWidget
{
  GameDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Container(
            width: 500,
            child: ListView(
              children: [
                Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 120.0,
                    )
                ),
                Text("Name of Game: Mario")
              ],
            ),
          )
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
              if(index == 1)
                Navigator.of(context).popAndPushNamed('/reviews');
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