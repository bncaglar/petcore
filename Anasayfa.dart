import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:log_in_deneme/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class Anasayfa extends StatefulWidget {
  final User user;

  const Anasayfa({Key key, this.user}) : super(key: key);
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Anasayfa"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed:() async{
              _signOut().whenComplete(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return LoginScreen();
                }));
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Anasayfaya geçiş yaptınız!",style: TextStyle(fontSize: 30),),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text("-TEST-"),
                onPressed:(){
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text("Uygulama Test Aşamasındadır!"),)
                  );
                },
              ),
            ],

          ),
        ),
      ),
    );
  }
  Future _signOut() async{
    await _auth.signOut();
  }
}
