import 'package:flutter/material.dart';
import 'package:green_chops/screens/form/login.dart';
import 'package:green_chops/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
      ),
    );
  }
}
