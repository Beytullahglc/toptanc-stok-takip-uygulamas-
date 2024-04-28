import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:toptanci_stok_takip_app/UrunDetay.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';
import 'package:toptanci_stok_takip_app/UrunlerDb.dart';
import 'package:toptanci_stok_takip_app/VeriTabaniYardimcisi.dart';

class UrunlerSayfa extends StatefulWidget {
  const UrunlerSayfa();

  @override
  State<UrunlerSayfa> createState() => _UrunlerSayfaState();
}

class _UrunlerSayfaState extends State<UrunlerSayfa> {

  Future<List<Urunler>> urunleriGoster() async {
    var urunListesi = <Urunler>[];

    var u1 = Urunler(1, "pirinç", 50, 300);
    var u2 = Urunler(1, "bulgur", 30, 400);
    var u3 = Urunler(1, "makarna", 20, 450);
    var u4 = Urunler(1, "mercimek", 60, 500);

    urunListesi.add(u1);
    urunListesi.add(u2);
    urunListesi.add(u3);
    urunListesi.add(u4);

    return urunListesi;
  }

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
      body: FutureBuilder<List<Urunler>>(
        future: urunleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var urunListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/2.5,
              ),
              itemCount: urunListesi?.length,
              itemBuilder: (context,index){
                var urun = urunListesi![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetay()));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/pirinç.png"),
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
