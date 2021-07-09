import 'package:flutter/material.dart';

class AddGame extends StatelessWidget 
{
  AddGame({Key? key, required this.title}) : super(key: key);
   final String title;

  @override
  Widget build(BuildContext context) {

      String name = "Mary";
      String publisher = "Sus";
      //String description =  "Email@gmail.com";
      //String username = "bfhrb345";
      double publishYear = 2000;

      return new Scaffold(
          appBar: AppBar(
            title: Text(this.title)
          ),
          body:  ListView(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    children: [
                      Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 120.0,
                          )
                      ),
                      Text("Game Name:", style: TextStyle(color: Colors.blue)), 
                      TextField(controller: TextEditingController(text: "$name")),
                      Text("Publisher", style: TextStyle(color: Colors.blue)),
                      TextField(controller: TextEditingController(text: "$publisher")),
                      Text("Description", style: TextStyle(color: Colors.blue)),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: TextEditingController(text: "Description tmdkrnjn")
                      ),
                      Slider(
                          value: publishYear,
                          min: 1980,
                          max: 2021,
                          divisions: 1,
                          label: publishYear.round().toString(),
                          onChanged: (double value) {
                            //publishYear = value;
                          }
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Add Game"))
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