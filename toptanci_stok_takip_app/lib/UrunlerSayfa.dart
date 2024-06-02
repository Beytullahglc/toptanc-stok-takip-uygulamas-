import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/UrunDetay.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';

class UrunlerSayfa extends StatefulWidget {
  String? urunAdi;
  String? urunFiyati;
  String? urunResim;



  @override
  State<UrunlerSayfa> createState() => _UrunlerSayfaState();

}

class _UrunlerSayfaState extends State<UrunlerSayfa> {

  var refUrunler = FirebaseDatabase.instance.reference().child("urunler_tablo");



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
        Text('Ürünler', style: TextStyle(color: Colors.white),),
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
      body: StreamBuilder<DatabaseEvent>(
        stream: refUrunler.onValue,
        builder: (context,event){
          if(event.hasData){
            var urunListesi = <Urunler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if(gelenDegerler != null){
              gelenDegerler.forEach((key,nesne){
                var gelenUrun = Urunler.fromJson(key, nesne);
                urunListesi.add(gelenUrun);
              });
            }


            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/2.5,
              ),
              itemCount: urunListesi?.length,
              itemBuilder: (context,index){
                var urun = urunListesi![index];
                return GestureDetector(
                  onTap:  () async{
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetay (urun: urun)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(urun.urunResim),
                        ),
                        Text("", style: TextStyle(fontSize: 10, color: Colors.deepPurple),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      )
    );
  }
}
