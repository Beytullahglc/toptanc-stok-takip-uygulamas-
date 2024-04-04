import 'package:flutter/material.dart';

class Siparisler extends StatefulWidget {
  const Siparisler({super.key});

  @override
  State<Siparisler> createState() => _SiparislerState();
}

class _SiparislerState extends State<Siparisler> {
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
        Text('Siparişler', style: TextStyle(color: Colors.white),),
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
        child: Text("Siparişler"),
      ),
    );
  }
}
