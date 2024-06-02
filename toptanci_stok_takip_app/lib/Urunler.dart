class Urunler {
  String urunId;
  String urunAdi;
  int urunFiyati;
  int urunStok;
  String urunResim;

  Urunler(this.urunId ,this.urunAdi, this.urunFiyati, this.urunStok, this.urunResim);

  factory Urunler.fromJson(String key, Map<dynamic,dynamic> json){
    return Urunler(key, json["urunAdi"] as String,  json["urunFiyati"] as int, json["urunStok"] as int, json["urunResim"] as String);
  }
}