import 'package:flutter/material.dart';

class SifreDegistirme extends StatefulWidget {
  const SifreDegistirme({super.key});

  @override
  State<SifreDegistirme> createState() => _SifreDegistirmeState();
}

class _SifreDegistirmeState extends State<SifreDegistirme> {
  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top:80, bottom: 15),
                child: SizedBox(
                  width: ekranGenisligi/2,
                  child: Image.asset("resimler/logo.png", ),
                ),
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
                padding: EdgeInsets.all(ekranYuksekligi/40),
                child: SizedBox(
                  width: ekranGenisligi*4/5,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre (Tekrar)",
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
                padding: EdgeInsets.all(ekranGenisligi/20),
                child: SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton(
                    child: Text("Değiştir", style: TextStyle(fontSize: ekranGenisligi/20, color: Colors.white),),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: (){

                    },

                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
