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
    var urunListesi = await UrunlerDb().tumUrunler();

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
                          child: Image.asset("resimler/pirinç.png",),
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

