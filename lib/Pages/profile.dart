import 'package:flutter/material.dart';
import 'package:gamerev/Data/account.dart';
import 'package:gamerev/Pages/login.dart';
import 'package:gamerev/Pages/register.dart';

class Profile extends StatelessWidget
{

  @override
  Widget ProfileView(BuildContext context) {
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
                    TextField(controller: TextEditingController(text: "${Account.account.user}"), enabled: false),
                    Text("First Name", style: TextStyle(color: Colors.blue)),
                    TextField(controller: TextEditingController(text: "${Account.account.first_name}"), enabled: false),
                    Text("Last Name", style: TextStyle(color: Colors.blue)),
                    TextField(controller: TextEditingController(text: "${Account.account.last_name}"), enabled: false),
                    Text("Email", style: TextStyle(color: Colors.blue)),
                    TextField(controller: TextEditingController(text: "${Account.account.email}"), enabled: false)
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

  @override
  Widget build(BuildContext context) {
      if(Account.account.id == -1)
      {

        return Login("Login to view profile");
      }
      else
        {
          return ProfileView(context);
        }
  }

}