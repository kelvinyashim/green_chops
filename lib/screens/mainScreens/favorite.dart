import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("data"),
      ),
      body: Container(
        child: Center(child: Text("Fav"),),
      ),
    );
  }
}