import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3000,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.network(
              "https://lottie.host/2d36f244-adb6-46a1-8241-4f2c28ebfeeb/Hnnahv8AXC.json"),
        const  SizedBox(
            height: 75,
          ),
          Text(
            "Green Chops",
            style: GoogleFonts.viga(
              textStyle:const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5,),
          Text("Providing meals that edifies", style: GoogleFonts.aBeeZee(
            textStyle:const TextStyle(
              letterSpacing: 4,
              fontSize: 16
              
            )
          ),)
          
        ],
      ),
    );
  }
}
