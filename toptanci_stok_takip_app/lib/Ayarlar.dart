import 'package:flutter/material.dart';

import 'package:toptanci_stok_takip_app/Hakkinda.dart';
import 'package:toptanci_stok_takip_app/SifreDegistirme.dart';
import 'package:toptanci_stok_takip_app/main.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {

  bool bildirim = false;

  @override

  bool aramaYapiliyorMu = false;
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar",style: TextStyle(color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple ,Colors.purpleAccent], // Gradient renkleri
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: ListTile(
              title: Text("Hesap Değiştir",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
              trailing: Icon(Icons.arrow_right,color: Colors.deepPurple,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: "",)));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:10,bottom: 10),
            child: ListTile(
              title: Text("Şifre Değiştir",style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
              trailing: Icon(Icons.arrow_right,color: Colors.deepPurple,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SifreDegistirme()));
              },
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top:10,bottom: 10),
            child: ListTile(
              title: Text("Hakkında",style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
              trailing: Icon(Icons.arrow_right,color: Colors.deepPurple,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Hakkinda()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
