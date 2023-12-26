import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      autofocus: true,
      onTap:onTap,
      child: ListTile(
        leading: Icon(icon),
        title:  Text(title, style: TextStyle(fontSize: 18),),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
