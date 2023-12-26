import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Lottie.network("https://lottie.host/090e8f09-4bb0-47cf-aba4-62b61e794b19/VkikncqYOz.json"),
        ),
        SizedBox(height: 30,),
        Container(
          alignment: Alignment.bottomLeft,
      
          padding: EdgeInsets.all(10),
          height: 200,
          child: Text("Discover amazing new recipes and much more", style: GoogleFonts.aboreto(
            fontSize: 35,
            letterSpacing: 3
          ),),
          )
      ],
    );
  }
}