import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              
              Container(
                 width: MediaQuery.of(context).size.width, // Ekran genişliği kadar yap
              height: MediaQuery.of(context).size.height /6, // Ekran yüksekliği kadar yap
              decoration: BoxDecoration(border: Border.all()),
              child: Center(child: Text(("store and make reusable user location data (WEATHER)"))),
                ),
                SizedBox(height: 100,),
                Container(
                 width: MediaQuery.of(context).size.width, // Ekran genişliği kadar yap
              height: MediaQuery.of(context).size.height /6, // Ekran yüksekliği kadar yap
              decoration: BoxDecoration(border: Border.all()),
              child: Center(child: Text("closer Cafe/Avm/Atm/restaurant list")),
                ),
           SizedBox(height: 100,),
                Container(
                 width: MediaQuery.of(context).size.width, // Ekran genişliği kadar yap
              height: MediaQuery.of(context).size.height /6, // Ekran yüksekliği kadar yap
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border(),color: Colors.amber),
              child: Center(child: Text("Chatbot")),

                ),
          
              

            ],
          ),
        ),
      ),
    );
    
  }

}