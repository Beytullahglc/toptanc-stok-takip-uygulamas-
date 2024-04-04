import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/AnaSayfa.dart';
import 'package:toptanci_stok_takip_app/Ayarlar.dart';
import 'package:toptanci_stok_takip_app/Raporlar.dart';
import 'package:toptanci_stok_takip_app/Siparisler.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';

class Sayfalar extends StatefulWidget {
  const Sayfalar({super.key});

  @override
  State<Sayfalar> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<Sayfalar> {

  var sayfaListesi = [Raporlar(), Siparisler(), AnaSayfa(), Urunler(), Ayarlar()];

  int secilenIndeks = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Raporlar"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Siparişler"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
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
