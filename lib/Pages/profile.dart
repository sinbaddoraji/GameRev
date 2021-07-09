import 'package:flutter/material.dart';

class Profile extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    String firstName = "Mary";
    String lastName = "Sus";
    String email =  "Email@gmail.com";
    String username = "bfhrb345";

    return Scaffold(
      appBar: AppBar(
          title: Text("Profile")
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 120.0,
            ),
          ),
          Center(
            child: Container(
              width: 500,
              height: 500,
              child: ListView(
                children: [
                  Text("Username", style: TextStyle(color: Colors.blue)),
                  TextField(controller: TextEditingController(text: "$username"), enabled: false),
                  Text("First Name", style: TextStyle(color: Colors.blue)),
                  TextField(controller: TextEditingController(text: "$firstName"), enabled: false),
                  Text("Last Name", style: TextStyle(color: Colors.blue)),
                  TextField(controller: TextEditingController(text: "$lastName"), enabled: false),
                  Text("Email", style: TextStyle(color: Colors.blue)),
                  TextField(controller: TextEditingController(text: "$email"), enabled: false)
                ],
              ),
            ),
          ),
        ],
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