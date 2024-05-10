import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeriTabaniYardimcisi {
  static final String veriTabaniAdi = "toptanciDatabase.db";

  static Future<Database> veriTabaniErisim() async {
    String veriTabaniYolu = join(await getDatabasesPath(), veriTabaniAdi);

    // Veritabanı dosyasının var olup olmadığını kontrol et
    bool veritabaniVarMi = await databaseExists(veriTabaniYolu);

    if (!veritabaniVarMi) {
      // Veritabanı dosyası bulunamazsa assets'ten kopyala
      ByteData data = await rootBundle.load("database/$veriTabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veriTabaniYolu).writeAsBytes(bytes, flush: true);
    }

    // Veritabanını aç ve döndür
    return openDatabase(veriTabaniYolu);
  }
}
