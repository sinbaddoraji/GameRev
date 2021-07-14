import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamerev/Data/account.dart';
import 'package:gamerev/Data/game.dart';
import 'package:gamerev/Pages/homepage.dart';
import 'package:gamerev/Pages/login.dart';
import 'package:image_picker/image_picker.dart';
import "package:http/http.dart" as http;


class AddGame extends StatefulWidget {
  const AddGame({ Key? key, required this.title }) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState()  => AddGameState(title: title);
}

class AddGameState extends State<AddGame>
{
  AddGameState({ required this.title })
  {
    Image img = Image.network("https://images.nintendolife.com/c59ebd4f6d6c2/exvl66vuyae8pud.original.jpg", fit: BoxFit.cover);

    circleAvatar = Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
          image: new DecorationImage(image: img.image)
      ),
    );
  }
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


    circleAvatar = Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: Image.file(_pickedImage).image
          )
      ),
    );

    final bytes = File(_pickedImage.path).readAsBytesSync();
    thumbnail = base64Encode(bytes);
  }


  Future<String?> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(imageUrl);
    final bytes = response?.bodyBytes;
    return (bytes != null ? base64Encode(bytes) : null);
  }

  _loadUrlImage() async
  {
    var imageField = TextField(controller: TextEditingController(),

      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          prefixIcon: const Icon(
            Icons.link,
            color: Colors.blue,
          ),
          labelText: 'Image Url',
          suffixStyle: const TextStyle(color: Colors.green)),
    );

      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AlertDialog(
                title: const Text('Input game url'),
                content: imageField,
                actions: <Widget>[
                  TextButton(
                    onPressed: () async
                    {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async
                    {
                      var img = Image.network(imageField.controller!.text, fit: BoxFit.cover).image;

                      setState(() {
                        circleAvatar = Container(
                          width: 500,
                          height: 500,
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: img
                              )
                          ),
                        );
                      });



                      thumbnail = (await networkImageToBase64(imageField.controller!.text))!;

                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              )
          )
      );


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


  late Container circleAvatar;
  String thumbnail = "infrjnfrmfr";

  @override
  Widget AddGameView(BuildContext context) {


      String username = Account.account.user;

      var nameField = TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)
              ),
              labelText: 'Name of Game',
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)
          ),
          controller: TextEditingController(text: ""));

      var publisherField = TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)
              ),
              labelText: 'Publisher',
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)
          ),controller: TextEditingController(text: ""));

      var descriptionField = TextField(
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
      var publishYearField = TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)
              ),
              labelText: 'Publish year',
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)
          ),
          controller: TextEditingController(text: ""));
      var genreField = TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)
              ),
              labelText: 'Genre',
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)
          ),
          controller: TextEditingController(text: ""));

      var platformsField = TextField(
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)
              ),
              labelText: 'Platforms',
              prefixText: ' ',
              suffixStyle: const TextStyle(color: Colors.green)
          ),controller: TextEditingController(text: "Windows, 3DS"));

      //

      return new Scaffold(
          appBar: AppBar(
            title: Text(this.title)
          ),
          body:  ListView(
                    padding: const EdgeInsets.all(10),
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
                            }, child: Icon(Icons.camera_alt)),
                            TextButton(onPressed: (){
                              setState(() {
                                _loadUrlImage();
                              });
                            }, child: Icon(Icons.link))
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      nameField,
                      SizedBox(height: 10),
                      publisherField,
                      SizedBox(height: 10),
                      descriptionField,
                      SizedBox(height: 10),
                      publishYearField,
                      SizedBox(height: 10),
                      genreField,
                      SizedBox(height: 10),
                      platformsField,
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: ()
                          {
                              var game = Game(0,
                                  title,
                                  thumbnail,
                                  publisherField.controller!.text,
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

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage())
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