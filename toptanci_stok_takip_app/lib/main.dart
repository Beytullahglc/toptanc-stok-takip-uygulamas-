import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Sayfalar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toptanci_stok_takip_app/Service/Auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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

  var refUrunler = FirebaseDatabase.instance.reference().child("urunler_tablo");
  var refSiparisler = FirebaseDatabase.instance.reference().child("siparisler_tablo");



  @override
  void initState() {
    super.initState();


  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMassage;
  bool isLogin = true;
  String? userId;

  Future<void> createUser() async {
    try{
      await Auth().createUser(email: emailController.text, password: passwordController.text);
      _showSnackBar();
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMassage = e.message;
      });
    }
  }

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Hesap Başarıyla Kaydedildi!'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signIn(BuildContext context) async {
    try{
      await Auth().signIn(email: emailController.text, password: passwordController.text);
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sayfalar()));
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMassage = e.message;
      });
    }
  }

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
                   controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
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
            errorMassage != null ? Text(errorMassage!) : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi/30),
              child: SizedBox(
                width: ekranGenisligi/2,
                child: ElevatedButton(
                  child: isLogin ?  Text("Giriş Yap", style: TextStyle(fontSize: ekranGenisligi/20, color: Colors.white),) : Text("Kayıt Ol", style: TextStyle(fontSize: ekranGenisligi/20, color: Colors.white),),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                    if(isLogin){
                      signIn(context);
                    }else{
                      createUser();
                    }
                  },

                ),
              ),
            ),
            
            GestureDetector(
              onTap: (){
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text("Kayıt Ol", style: TextStyle(
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
