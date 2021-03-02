import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_in_deneme/Forgot_Password/forgetpass.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class forgetpass extends StatefulWidget {
  @override
  _forgetpassState createState() => _forgetpassState();
  var tfSifreUnut = TextEditingController();
}

Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 10.0,left: 5.0),
            hintText: 'Kullanıcı adı veya e-posta',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}
Widget _buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 7.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () {
       // girisKontrol();
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'İleri',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
class _forgetpassState extends State<forgetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFA3DD4A6),
                    Color(0xFA37C197),
                    Color(0xFA31AC86),
                    Color(0xFA268B6B),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hesabımı Bul',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Hesabına ait kullanıcı adı veya e-posta adresini gir.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _buildEmailTF(),
                    SizedBox(height: 20.0),
                    _buildLoginBtn(),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(height: 95.0),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
