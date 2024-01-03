import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_chops/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(3, 0.0), // Start from the right side
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: SlideTransition(
          position: _offsetAnimation,
          child: Text(
            'Categories',
            style: GoogleFonts.akatab(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 1.2,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Text(
                "You are what you eat, so don't be fast, cheap, easy, or fake.",
                style: GoogleFonts.pacifico(
                    decorationColor: Colors.white,
                    letterSpacing: 2,
                    fontSize: 20),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
