import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';

import 'package:toptanci_stok_takip_app/UrunlerSayfa.dart';

class UrunDetay extends StatefulWidget {
  Urunler urun;
  var urunAdi;
  var urunResim;
  var urunFiyati;
  UrunDetay({Key? key, required this.urun}) : super(key: key){
    urunAdi = urun.urunAdi;
    urunResim = urun.urunResim;
    urunFiyati = urun.urunFiyati;
  }


  @override
  State<UrunDetay> createState() => _UrunDetayState();
}


class _UrunDetayState extends State<UrunDetay> {
  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120,left: 10, right: 10,bottom: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Görüntünün köşe yuvarlaklığı
                    border: Border.all(
                      color: Colors.deepPurple, // Kenar çizgisi rengi
                      width: 1.0, // Kenar çizgisi kalınlığı
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurpleAccent.withOpacity(0.5), // Gölge rengi
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Gölge konumu
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Görüntünün köşe yuvarlaklığı
                    child: Image.asset(widget.urunResim as String, // Görüntünün yolunu belirtin
                      width: ekranGenisligi*3/4,
                      fit: BoxFit.cover, // Görüntüyü boyutlandırma modu
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 8,right: 8, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Görüntünün köşe yuvarlaklığı
                    color: Colors.deepPurple,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurpleAccent.withOpacity(0.5), // Gölge rengi
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Gölge konumu
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(widget.urunAdi as String,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(widget.urunFiyati.toString() ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Adet",
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),

                  ),
                  onPressed: (){

                  },
                  child: Text("Sipariş ver", style: TextStyle(color: Colors.white,),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
