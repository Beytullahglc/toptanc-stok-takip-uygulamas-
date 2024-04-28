import 'package:flutter/material.dart';

class Adres extends StatefulWidget {
  const Adres({super.key});

  @override
  State<Adres> createState() => _AdresState();
}

class _AdresState extends State<Adres> {
  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;



    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Text("Adres:",style: TextStyle(color: Colors.black,fontSize: 17),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 10,  right: 10,bottom: 100),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Adres",
                  hintStyle: TextStyle(color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                onPressed: (){

                },
                child: Text("Değiştir", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
