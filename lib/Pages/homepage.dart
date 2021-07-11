import 'package:flutter/material.dart';
import 'package:gamerev/CustomWidgets/gameCard.dart';
import 'package:gamerev/Data/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState()  => HomePageState();
}

class HomePageState extends State<HomePage> {

   late Future<List<Game>> games;

   @override
   void initState() {
     super.initState();
     games = Game.GetAllGames();
   }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: Text("Home"),
         ),
        body: FutureBuilder<List<Game>>(
          future: games,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8
                  ),
                  itemBuilder: (context, index) {
                    return GamePreview(game: snapshot.data![index]);
                  }
              );
            }
            else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error} Data = ${snapshot.data}");
            }
            return Text("Loading...");
          },
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