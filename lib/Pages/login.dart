import 'package:flutter/material.dart';
import 'package:gamerev/Data/account.dart';

class Login extends StatefulWidget
{
  String title;
  Login(this.title);

  @override
  State<StatefulWidget> createState() => LoginState(title);

}


class LoginState extends State<Login>
{

  String title;
  LoginState(this.title);

  var user = TextField(controller: TextEditingController(),

    decoration: new InputDecoration(
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal)),
        prefixIcon: const Icon(
          Icons.supervised_user_circle,
          color: Colors.blue,
        ),
        labelText: 'Username',
        suffixStyle: const TextStyle(color: Colors.green)),
  );
  var pass = TextField(obscureText: true, controller: TextEditingController(),

      decoration: new InputDecoration(
      border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.teal)),
          labelText: 'Password',
          prefixIcon: const Icon(
          Icons.password,
          color: Colors.blue,
      ),
      prefixText: ' ',
      suffixStyle: const TextStyle(color: Colors.green)),
  );
  Future<void> Login() async
  {
      var acc = await Account.Login(user.controller!.text,pass.controller!.text);
      Account.account = acc;
      print(acc.id);

      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text(title)
      ),
      body: ListView(
        padding:  EdgeInsets.all(30),
        shrinkWrap: true,
        children: [
          Center(
            child: Container(
              width: 900,
              child: ListView(
                padding: EdgeInsets.all(30),
                shrinkWrap: true,
                children: [
                  Center(
                    child: Text("Login", textScaleFactor: 2,),
                  ),
                  SizedBox(height: 10),
                  user,
                  SizedBox(height: 10),
                  pass,
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: Login,
                      child: Text("Login")),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Do not have an account? "),
                      TextButton(onPressed: (){
                        Navigator.pushReplacementNamed(context, '/register');
                      }, child: Text("Register"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }

}