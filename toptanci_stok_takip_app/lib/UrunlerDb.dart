import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';
import 'package:toptanci_stok_takip_app/UrunlerSayfa.dart';
import 'package:toptanci_stok_takip_app/VeriTabaniYardimcisi.dart';

class UrunlerDb{


  Future<List<Urunler>> tumUrunler() async {
    try {
      Database db = await VeriTabaniYardimcisi.veriTabaniErisim();
      List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM urunler");

      List<Urunler> urunlerListesi = [];

      for (var satir in maps) {
        print('Satır verisi: $satir');
      }

      if (maps.isNotEmpty) {
        for (var satir in maps) {
          Urunler urun = Urunler(
            urunId: satir['urunId'],
            urunAdi: satir['urunAdi'],
            urunFiyati: satir['urunFiyat'],
            urunStok: satir['urunStok'],
            urunResim: satir['urunResim'],
          );
          urunlerListesi.add(urun);
        }
      }

      return urunlerListesi;
    } catch (e) {
      print('Ürünler getirilirken hata oluştu: $e');
      return []; // Hata durumunda boş liste döndürülebilir veya null döndürülebilir
    }
  }


  Future<List<Urunler>> urunArama(String arananUrun) async {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler WHERE urunAdi like '%$arananUrun%'");

    return List.generate(maps.length, (i){
      var satir = maps[i];

      return Urunler(urunId: satir["urunId"], urunAdi: satir["urunAdi"], urunFiyati: satir["urunFiyati"], urunStok: satir["urunStok"],urunResim: satir['urunResim']);
    });
  }
}
