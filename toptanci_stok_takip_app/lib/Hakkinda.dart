import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  const Hakkinda({super.key});

  @override
  State<Hakkinda> createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Hakkında",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text("Mercatus Maximus olarak sizlere uzun seneler hizmet vermenin gururunu yaşıyor"
              " ve toptancılık sektörünün hızla büyüyen bir şirketi olarak vizyonumuzu geliştirerek"
              " sizlere her zaman daha iyi hizmet vermeyi temenni ediyoruz...", style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
        ),
      ),
    );
  }
}
