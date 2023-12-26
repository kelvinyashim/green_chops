import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Lottie.network("https://lottie.host/b9a776f3-5e26-4013-8ff8-d8e24e77ef88/ewmriKRYm2.json"),
        ),
      const  SizedBox(height: 40,),
        Container(
          alignment: Alignment.bottomRight,
          padding:const EdgeInsets.all(20),
          child: Text("Join a community\nMeet new people from around the World",       
          style: GoogleFonts.aboreto(
            fontSize: 30,
            textStyle:const TextStyle(
              letterSpacing: 3
            )
          ),),
        )
      ],
    );
  }
}