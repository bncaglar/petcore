import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Anasayfa.dart';
import 'login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*
  Future<bool> oturumKontrol() async{
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanıcı adı yok ";
    String spSifre = sp.getString("sifre") ?? "Şifre adı yok ";

    if(spKullaniciAdi=="bn" && spSifre=="Fa1"){
      return true;
    }else{
      return false;
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
