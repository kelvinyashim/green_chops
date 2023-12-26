import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_chops/screens/form/login.dart';
import 'package:green_chops/screens/slide_pages/intro.dart';
import 'package:green_chops/screens/slide_pages/intro2.dart';
import 'package:green_chops/screens/slide_pages/intro3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViews extends StatefulWidget {
  const PageViews({Key? key});

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    bool isLastpage = false;
    return Stack(
      children: [
        PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastpage = index ==
                    2; //here we are setting the condition for lastPage to be true
              });
            },
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ]),
        Positioned(
          top: 0,
          bottom: 30,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: const Text("Skip"),
                      onTap: () {
                        controller.jumpToPage(2);
                      },
                    ),
                    SmoothPageIndicator(
                      effect: WormEffect(
                        activeDotColor: Theme.of(context).colorScheme.primary,
                      ),
                      controller: controller,
                      count: 3,
                    ),
                    isLastpage
                        ? GestureDetector(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: const Text("done"),
                          )
                        : GestureDetector(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: const Text("next"),
                          )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.bottomCenter,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          animationDuration: const Duration(seconds: 2),
                          padding: EdgeInsets.all(8),
                          foregroundColor:
                              const Color.fromARGB(255, 42, 88, 44)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                          return const Forms();
                          },
                        ));
                      },
                      child: Text(
                        "Get started",
                        style: GoogleFonts.labrada(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
