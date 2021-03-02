import 'package:js/js.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_in_deneme/Forgot_Password/forgetpass.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Anasayfa.dart';
import 'Register.dart';
import 'constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Main Project',
      debugShowCheckedModeBanner: false,
    );
  }
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _rememberMe = false;
  var formKey = GlobalKey<FormState>();
/*
  Future<void> girisKontrol() async{
    var ka = _emailController.text;
    var s = _passwordController.text;

    if(ka==_emailController.text && s =="Fa1357araba."){
      var sp = await SharedPreferences.getInstance();
      sp.setString("kullaniciAdi",ka);
      sp.setString("sifre",s);
      Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context) => Anasayfa()));
    }
  }

 */
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-posta',
          style: kLabelStyle,
        ),
        SizedBox(height: 15.0),
        Form(

          key: _formKey,

          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none  ,
                  contentPadding: EdgeInsets.only(top: 10.0,left: 5.0),
                  hintText: 'E-postanızı girin',
                  hintStyle: kHintTextStyle,

                ),
                validator: (tfgirdisi){
                  if(tfgirdisi.isEmpty){
                    return"Gerekli*";
                  }else{
                    return null;
                  }
                },
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre',
          style: kLabelStyle,
        ),
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            controller: _passwordController,
            style: TextStyle(
              color: Color(0xFA3DD4A6),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0,left: 5.0),
              hintText: 'Şifrenizi girin.',
              hintStyle: kHintTextStyle,
            ),
            validator: (tfgirdisi){
              if(tfgirdisi.isEmpty){
                return"Gerekli*";
              }
              if(tfgirdisi.length < 6){
                return"Şifre en az 6 karakter olmak zorundadır!";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(this.context, MaterialPageRoute(builder: (context) => forgetpass()));
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Şifreni mi unuttun?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if(_formKey.currentState.validate()){
            _signinWithEmailPassword();
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Giriş Yap',
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
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(this.context, MaterialPageRoute(builder: (context) => Register())),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hesabın mı yok? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Kaydol',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 120.0),
                      Text(
                        'Petcore',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 120.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      //  _buildSignInWithText(),
                      // _buildSocialBtnRow(),
                      SizedBox(height: 65.0),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
    void _signinWithEmailPassword() async{
     try{
       final User user =
       (await _auth.signInWithEmailAndPassword(email: _emailController.text , password: _passwordController.text,))
      .user;
       if(!user.emailVerified){
         await user.sendEmailVerification();
       }
       Navigator.of(this.context).push(MaterialPageRoute(builder: (_){
         return Anasayfa(user: user,
         );
       }));
     }catch (e){
       _scaffoldKey.currentState.showSnackBar(SnackBar(
           content: Text("Giriş başarısız oldu"),
       ));
       print(e);
     }
  }
}
