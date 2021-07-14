import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamerev/Data/account.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Data/gameReviews.dart';
import 'package:gamerev/Pages/reviews.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gamerev/CustomWidgets/ratingsBar.dart';

import 'login.dart';


class AddReview extends StatefulWidget {
  const AddReview({ Key? key, required this.title, required this.game }) : super(key: key);
  final String title;
  final Game game;

  @override
  State<StatefulWidget> createState()  => AddReviewState(this.game, title: title);
}

class AddReviewState extends State<AddReview>
{
  AddReviewState(this.game, { required this.title });
  final String title;
  final Game game;

  @override
  void initState()  {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if(Account.account.id == -1)
    {

      return Login("Login to leave review");
    }
    else
    {
      return AddReview(context);
    }
  }

  double rate = 0;

  Widget AddReview(BuildContext context) {
    var username =  "sinbaddoraji";

    var review = TextField(
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            labelText: 'Description',
            prefixText: ' ',
            suffixStyle: const TextStyle(color: Colors.green)
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: TextEditingController(text: "\n\n\n\n")
    );


    var rating =  StarRating(
        onRatingChanged: (double rating)
        {
            //rate = rating;
        },
        color: Colors.yellow, rating: rate,);


    var circleAvatar = Container(
      width: 500,
      height: 500,
      child: Image.network("https://images.nintendolife.com/c59ebd4f6d6c2/exvl66vuyae8pud.original.jpg", fit: BoxFit.cover),
    );
    return new Scaffold(
        appBar: AppBar(
            title: Text(this.title)
        ),
        body:  ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            SizedBox(height: 20),
            Text("$rate/5"),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number, controller: TextEditingController(text: "$rate"),
              onChanged: (text) {
                setState(() {
                  rate = double.parse(text);
                });
              },
            ),
            SizedBox(height: 20),
            rating,
            SizedBox(height: 20),
            review,
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: ()
                {
                  var newReview = GameReview(0, game.id, rating.rating, review.controller!.text, username, "", "");
                  var add = newReview.Post();
                  if(add)
                  {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AlertDialog(
                              title: const Text('Succesfully added game review'),
                              content: const Text('Succesfully added game review'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            )
                        )
                    );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => Reviews(game: game, title: "${game.title} reviews"))
                    );
                  }
                }
                , child: Text("Add Game"))
          ],
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