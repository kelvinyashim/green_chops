import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_chops/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.categorys, required this.onTap});

  final Categorys categorys;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(122, 158, 151, 151),
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            categorys.color,
            categorys.color.withOpacity(0.3)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
        child: Text(
  
          categorys.title, 
          textAlign: TextAlign.center,
          style: GoogleFonts.arizonia(
            fontSize: 24,
          ),
          ),
      ),
    );
  }
}
