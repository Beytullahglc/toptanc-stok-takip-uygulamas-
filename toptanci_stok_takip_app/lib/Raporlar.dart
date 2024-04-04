import 'package:flutter/material.dart';

class Raporlar extends StatefulWidget {
  const Raporlar({super.key});

  @override
  State<Raporlar> createState() => _RaporlarState();
}

class _RaporlarState extends State<Raporlar> {
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
        Text('Raporlar', style: TextStyle(color: Colors.white),),
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
        child: Text("Raporlar"),
      ),
    );
  }
}
