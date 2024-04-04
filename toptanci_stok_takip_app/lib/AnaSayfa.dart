import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override

  bool aramaYapiliyorMu = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:aramaYapiliyorMu?
        TextField(
          decoration: InputDecoration(hintText: "Ara",hintStyle: TextStyle(color: Colors.white)),

          onChanged: (aramaSonucu){
            print("Arama Sonucu: $aramaSonucu");
          },
        ) :
        Text('Mercatus Maximus', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions:[
          aramaYapiliyorMu ?
          IconButton(
            color: Colors.white,
            icon:Icon(Icons.cancel_outlined),

            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
              });
            },
          ):
          IconButton(
            color: Colors.white,
            icon:Icon(Icons.search),

            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text("AnaSayfa"),
      ),
    );
  }
}
