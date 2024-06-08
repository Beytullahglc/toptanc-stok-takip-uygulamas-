import 'package:toptanci_stok_takip_app/Kullanici.dart';
import 'package:toptanci_stok_takip_app/Urunler.dart';

class Siparisler{
  String siparisId;
  String urunAdi;
  int siparisAdeti;

  Siparisler(this.siparisId, this.urunAdi, this.siparisAdeti);

  factory Siparisler.fromJson(String key, Map<dynamic,dynamic> json){
    return Siparisler(key, json["urunAdi"] as String, json["siparisAdeti"] as int);
  }
}