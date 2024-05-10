import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';
import 'package:toptanci_stok_takip_app/UrunlerDb.dart';
import 'package:toptanci_stok_takip_app/UrunlerSayfa.dart';

class UrunDetay extends StatelessWidget {
  const UrunDetay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    Future<List<Urunler>> urunleriGoster() async {
      var urunListesi = await UrunlerDb().tumUrunler();
      return urunListesi;
    }

        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 10, right: 10, bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'resimler/pirinç.png',
                          width: ekranGenisligi * 3 / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Pirinç", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("50TL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                      onPressed: () {},
                      child: Text(
                        "Sipariş ver",
                        style: TextStyle(color: Colors.white),
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


