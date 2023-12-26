import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.network("https://lottie.host/6873c898-96d5-410c-92b8-1d3cf84c115c/7OADjjzZFK.json"),
        ),
      ],
    );
  }
}