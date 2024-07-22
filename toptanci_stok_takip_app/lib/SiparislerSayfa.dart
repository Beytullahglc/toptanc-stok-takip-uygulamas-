import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toptanci_stok_takip_app/Siparisler.dart';

class SiparislerSayfa extends StatefulWidget {
  const SiparislerSayfa({Key? key}) : super(key: key);

  @override
  State<SiparislerSayfa> createState() => _SiparislerState();
}

class _SiparislerState extends State<SiparislerSayfa> {
  var refUrunler = FirebaseDatabase.instance.reference().child("urunler_tablo");
  var refSiparisler = FirebaseDatabase.instance.reference().child("siparisler_tablo");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Siparişler',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple ,Colors.purpleAccent], // Gradient renkleri
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refSiparisler.onValue,
        builder: (context, event) {
          if (event.hasData) {
            var siparisListesi = <Siparisler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenSiparis = Siparisler.fromJson(key, nesne);
                siparisListesi.add(gelenSiparis);
              });
            }

            return ListView.builder(
              itemCount: siparisListesi?.length,
              itemBuilder: (context, index) {
                var siparis = siparisListesi![index];
                return GestureDetector(
                  onTap: () async {},
                  child: Card(
                    shadowColor: Colors.deepPurple,
                    child: SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 80,
                                child: Image.asset("resimler/${siparis.urunAdi.toLowerCase()}.png"),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${siparis.siparisAdeti} Adet",
                                    style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.delete, color: Colors.deepPurple,),

                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Siparişi Sil"),
                                              content: Text("Bu siparişi silmek istediğinizden emin misiniz?"),
                                              actions: [
                                                TextButton(
                                                  child: Text("Evet"),
                                                  onPressed: () {
                                                    refSiparisler.child(siparis.siparisId).remove();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("Hayır"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
