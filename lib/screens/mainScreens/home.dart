import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:green_chops/screens/mainScreens/chatScreen.dart';
import 'package:green_chops/screens/mainScreens/favorite.dart';
import 'package:green_chops/screens/mainScreens/homeScreen.dart';
import 'package:green_chops/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 1;
  final barKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    final screens = [
      Favorite(),
      HomeScreen(),
      ChatScreen()
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 600),
        index: 1,
        key: barKey,
        color: Colors.white,
        
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.4),
        items: <Widget>[
          Icon(Icons.star, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.message, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            page = index;
          });
        },
        letIndexChange: (value) => true,
      ),
      body: screens[page]
    );
  }
}
