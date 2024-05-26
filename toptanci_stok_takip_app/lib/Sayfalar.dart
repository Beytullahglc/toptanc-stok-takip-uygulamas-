import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Ayarlar.dart';
import 'package:toptanci_stok_takip_app/SiparislerSayfa.dart';
import 'package:toptanci_stok_takip_app/UrunlerSayfa.dart';

class Sayfalar extends StatefulWidget {
  const Sayfalar({super.key});

  @override
  State<Sayfalar> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<Sayfalar> {

  var sayfaListesi = [Siparisler(), UrunlerSayfa(), Ayarlar()];

  int secilenIndeks = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Siparişler"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Ürünler"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],

        currentIndex: secilenIndeks,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
          setState(() {
            secilenIndeks = index;
          });
        },

      ),
    );
  }
}
