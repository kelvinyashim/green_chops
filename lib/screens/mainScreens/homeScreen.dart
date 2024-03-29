import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_chops/model/category.dart';
import 'package:green_chops/model/dummy.data/data.dart';
import 'package:green_chops/widgets/catScreen.dart';
import 'package:green_chops/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _offsetGrid;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _offsetAnimation = Tween<Offset>(
      begin: Offset(3, 0.0), // Start from the right side
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _offsetGrid = Tween<Offset>(
            begin: Offset(0, 1.0),
            end: Offset(0, 0) // Move to the left and down a bit
            )
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward(); // Start the animation
    _controller1.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
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
            top: 50,
            child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  children: [
                    for (final cat in availableCategories)
                      SlideTransition(
                          position: _offsetGrid,
                          child: CategoryGridItem(categorys: cat, onTap: () {}))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
