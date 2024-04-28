import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Adres.dart';
import 'package:toptanci_stok_takip_app/AnaSayfa.dart';
import 'package:toptanci_stok_takip_app/Hakk%C4%B1nda.dart';
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
        backgroundColor: Colors.deepPurple,
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
              title: Text("Adres",style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
              trailing: Icon(Icons.arrow_right,color: Colors.deepPurple,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Adres()));
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

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text("Bildirimler",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                Spacer(),
                Switch(
                    value: bildirim,
                    onChanged: (veri){
                      setState(() {
                        bildirim = veri;
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
