import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamerev/Data/account.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Pages/login.dart';
import 'package:image_picker/image_picker.dart';


class AddGame extends StatefulWidget {
  const AddGame({ Key? key, required this.title }) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState()  => AddGameState(title: title);
}

class AddGameState extends State<AddGame>
{
  AddGameState({ required this.title });
  final String title;
  //late Future<Uint8List> file;
  ImagePicker _imagePicker = ImagePicker();
  File _pickedImage = File('null');

  @override
 void initState()  {
    super.initState();
  }

  _loadPicker(ImageSource source) async {
    _pickedImage= await ImagePicker.pickImage(source: source);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if(Account.account.id == -1)
    {

      return Login("Login to add game");
    }
    else
    {
      return AddGameView(context);
    }
  }




  @override
  Widget AddGameView(BuildContext context) {

      String name = "Mary";
      String publisher = "Sus";
      //String description =  "Email@gmail.com";
      //String username = "bfhrb345";
      double publishYear = 2000;

      String thumbnail = "infrjnfrmfr";
      String username = "sinbaddoraji";

      var nameField = TextField(controller: TextEditingController(text: "$name"));
      var publisherField = TextField(controller: TextEditingController(text: "$name"));
      var descriptionField = TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: TextEditingController(text: "Description tmdkrnjn")
      );
      var publishYearField = TextField(controller: TextEditingController(text: "$name"));
      var genreField = TextField(controller: TextEditingController(text: "$name"));
      var platformsField = TextField(controller: TextEditingController(text: "$name"));

      //
      Image img = Image.network("https://images.nintendolife.com/c59ebd4f6d6c2/exvl66vuyae8pud.original.jpg", fit: BoxFit.cover);
      if(_pickedImage != null && _pickedImage.path != "null")
        img = Image.file(_pickedImage);

    var circleAvatar = Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
            image: new DecorationImage(image: img.image)
        ),
      );
      return new Scaffold(
          appBar: AppBar(
            title: Text(this.title)
          ),
          body:  ListView(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    children: [
                      Center(
                          child: circleAvatar
                      ),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            TextButton(
                                onPressed: (){
                                  setState(()  {
                                    _loadPicker(ImageSource.gallery);
                                  });
                                },
                                child: Icon(Icons.photo)),
                            TextButton(onPressed: (){
                              setState(() {
                                _loadPicker(ImageSource.camera);
                              });
                            }, child: Icon(Icons.camera_alt))
                          ],
                        ),
                      ),
                      Text("Game Name:", style: TextStyle(color: Colors.blue)), 
                      nameField,
                      Text("Publisher", style: TextStyle(color: Colors.blue)),
                      publisherField,
                      Text("Description", style: TextStyle(color: Colors.blue)),
                      descriptionField,
                      Text("Publish Year", style: TextStyle(color: Colors.blue)),
                      publishYearField,
                      Slider(
                          min: 1980,
                          value: publishYear,
                          max: 2521,
                          divisions: 4,
                          onChanged: (double value) {
                            //setState(() => publishYear = value);

                          }
                      ),
                Text("Genre", style: TextStyle(color: Colors.blue)),
                      genreField,
                      Text("Platforms", style: TextStyle(color: Colors.blue)),
                      platformsField,
                      ElevatedButton(
                          onPressed: ()
                          {
                              var game = Game(0,
                                  title,
                                  thumbnail,
                                  publisher,
                                  int.parse(publishYearField.controller!.text),
                                  descriptionField.controller!.text,
                                  genreField.controller!.text,
                                  platformsField.controller!.text,
                                  username,
                                  "", "");
                              bool add = game.Post();

                              if(add)
                              {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AlertDialog(
                                          title: const Text('Succesfully added Game'),
                                          content: const Text('Succesfully added game to GameRev'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        )
                                    )
                                );
                              }



                          }
                      , child: Text("Add Game"))
                    ],
                ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                if (index == 1)
                  Navigator.of(context).popUntil((route) => route.isFirst);
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