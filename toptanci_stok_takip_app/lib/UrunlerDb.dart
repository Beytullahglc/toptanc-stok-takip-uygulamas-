import 'package:flutter/cupertino.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';
import 'package:toptanci_stok_takip_app/UrunlerSayfa.dart';
import 'package:toptanci_stok_takip_app/VeriTabaniYardimcisi.dart';

class UrunlerDb{


  Future<List<UrunlerSayfa>> tumUrunler() async {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler");
    
    return List.generate(maps.length, (i){
      var satir = maps[i];

      var u = UrunlerSayfa();

      return UrunlerSayfa();
    });
  }
}