import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Kullanici.dart';
import 'package:toptanci_stok_takip_app/Sayfalar.dart';
import 'package:toptanci_stok_takip_app/HesapAc.dart';
import 'package:toptanci_stok_takip_app/VeriTabaniYardimcisi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ekranGenisligi / 2,
              child: Image.asset(
                "resimler/logo.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 40),
              child: SizedBox(
                width: ekranGenisligi * 4 / 5,
                child: TextField(
                  controller: tfKullaniciAdi,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 40),
              child: SizedBox(
                width: ekranGenisligi * 4 / 5,
                child: TextField(
                  obscureText: true,
                  controller: tfSifre,
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi / 30),
              child: SizedBox(
                width: ekranGenisligi / 2,
                child: ElevatedButton(
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                        fontSize: ekranGenisligi / 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  /*onPressed: () async {
                    Future<bool> kayitKontrol(String kullaniciAdi, String sifre) async {
                      var db = await VeriTabaniYardimcisi.veriTabaniErisim();

                      List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kullanici WHERE kullaniciAdi = $kullaniciAdi AND sifre =$sifre");
                      return maps.isNotEmpty;
                    }
                    if(await kayitKontrol(tfKullaniciAdi.text, tfSifre.text)){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sayfalar()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Kayıt Bulunamadı"),
                        ),
                      );
                    }

                  },*/
                  onPressed: () async {
                    Future<bool> kayitKontrol(String kullaniciAdi, String sifre) async {
                      var db = await VeriTabaniYardimcisi.veriTabaniErisim();

                      String sqlQuery = '''
                        SELECT * FROM kullanici 
                         WHERE kullaniciAdi = $kullaniciAdi AND sifre = $sifre
                         ''';

                      // Sorgudaki parametreleri '?' işaretiyle belirtiyoruz
                      List<dynamic> params = [kullaniciAdi, sifre];

                      // SQL sorgusunu çalıştırarak veritabanından sonuçları alıyoruz
                      List<Map<String, dynamic>> maps =
                          await db.rawQuery(sqlQuery, params);

                      // Geri dönen sonuca göre kayıt var mı yok mu kontrol ediyoruz
                      return maps
                          .isNotEmpty; // Eğer kayıt bulunduysa true, bulunamadıysa false döner
                    }

                    String kullaniciAdi = tfKullaniciAdi.text;
                    String sifre = tfSifre.text;

                    // Kullanıcı adı ve şifreyi kontrol etmek için kayitKontrol fonksiyonunu çağır
                    bool kayitVarMi = await kayitKontrol(kullaniciAdi, sifre);

                    if (kayitVarMi) {
                      // Kayıt bulunduysa, Sayfalar widget'ını aç
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Sayfalar()));
                    } else {
                      // Kayıt bulunamadıysa, hata mesajı göster
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Kayıt Bulunamadı"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HesapAc()));
              },
              child: Text(
                "Hesap Aç",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: ekranGenisligi / 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
