import 'package:flutter/material.dart';

class Register extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Register")
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
                    TextField(),
                    Text("First Name", style: TextStyle(color: Colors.blue)),
                    TextField(),
                    Text("Last Name", style: TextStyle(color: Colors.blue)),
                    TextField(),
                    Text("Email", style: TextStyle(color: Colors.blue)),
                    TextField(),
                    ElevatedButton(onPressed: () {}, child: Text("Register"))
                  ],
                ),
              ),
            )


          ],
        ),

      );
  }

}