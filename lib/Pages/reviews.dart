import 'package:flutter/material.dart';
import 'package:gamerev/CustomWidgets/ratingsBar.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Data/gameReviews.dart';

import 'addReview.dart';


class Reviews extends StatefulWidget {
  const Reviews({ Key? key, required this.title, required this.game }) : super(key: key);
  final String title;
  final Game game;

  @override
  State<StatefulWidget> createState()  => ReviewsState(this.title, this.game);
}

class ReviewsState extends State<Reviews>
{
  ReviewsState(this.title, this.game);
  String title;
  Game game;

  late Future<List<GameReview>> gameReviews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameReviews = game.GetReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: FutureBuilder<List<GameReview>>(
          future: gameReviews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    var gameReview = snapshot.data![index];

                    return Expanded(
                          child: new InkWell
                          (
                            hoverColor: Colors.blueAccent,
                            child: Expanded(
                                child : Container(
                                  child: Container(
                                    child: ListTile(
                                      title: Text(gameReview.username),
                                      subtitle: Row(
                                        children: [
                                          Text(gameReview.review),
                                          StarRating(onRatingChanged: (double rating) {  }, color: Colors.yellow, rating: gameReview.rating)
                                        ],
                                      ),
                                    ),
                                  )
                                )
                            ),
                            onTap: (){
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameDetails(game: game)));
                            },
                        )
                    );

                  },
                separatorBuilder: (BuildContext context, int index)
                {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                      );
                },
              );
            }
            else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error} Data = ${snapshot.data}");
            }
            return Text("Loading...");
          },
        )
        ,
        floatingActionButton:  FloatingActionButton.extended(
          onPressed: () {
            //Add game
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddReview(game: game, title: "Review for ${game.title}")));
          },
          label: const Text('Add Review'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index){
              if(index == 1)
                Navigator.of(context).pushNamed('/profile');
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