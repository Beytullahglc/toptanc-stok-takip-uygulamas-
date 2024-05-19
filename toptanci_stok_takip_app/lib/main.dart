import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Sayfalar.dart';
import 'package:toptanci_stok_takip_app/HesapAc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});


  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: ekranGenisligi/2,
                child: Image.asset("resimler/logo.png", ),
            ),

             Padding(
               padding: EdgeInsets.all(ekranYuksekligi/40),
               child: SizedBox(
                 width: ekranGenisligi*4/5,
                 child: TextField(
                    decoration: InputDecoration(
                      hintText: "Kullanıcı Adı",
                      hintStyle: TextStyle(color: Colors.deepPurple),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                    ),
                  ),
               ),
             ),

            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/40),
              child: SizedBox(
                width: ekranGenisligi*4/5,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi/30),
              child: SizedBox(
                width: ekranGenisligi/2,
                child: ElevatedButton(
                  child: Text("Giriş Yap", style: TextStyle(fontSize: ekranGenisligi/20, color: Colors.white),),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sayfalar()));
                  },

                ),
              ),
            ),
            
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HesapAc()));
              },
              child: Text("Hesap Aç", style: TextStyle(
                color: Colors.green,
                fontSize: ekranGenisligi/25,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),

    );
  }
}
