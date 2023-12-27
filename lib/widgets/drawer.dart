import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_chops/screens/form/login.dart';
import 'package:green_chops/widgets/listTile.dart';
import 'package:image_picker/image_picker.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  void signOut() async {
    try {
      await firebase.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Forms(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  File? selectedImg;
  void pickImage() async {
    final pickedImage = ImagePicker();
    final selected = await pickedImage.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (selected == null) {
      return;
    }
    setState(() {
      selectedImg = File(selected.path);
    });
  }
  void changeImage() async {
    final pickedImage = ImagePicker();
    final selected = await pickedImage.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (selected == null) {
      return;
    }
    setState(() {
      selectedImg = File(selected.path);
    });
  }

  final user = firebase.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder(
      future:
          FirebaseFirestore.instance.collection("user").doc(user!.uid).get(),
      builder: (context, snapshot) {
        final userData = snapshot.data;
        final accountName = userData?["name"] ?? "name";
        final accountEmail = userData?["email"] ?? "exam@gmail.com";
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return const LinearProgressIndicator();
        }

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              accountName: Text(accountName),
              accountEmail: Text(accountEmail),
              currentAccountPicture: CircleAvatar(
                foregroundImage:
                    selectedImg != null ? FileImage(selectedImg!) : null,
                backgroundColor: Colors.grey,
                child: IconButton(icon: Icon(Icons.camera), onPressed:changeImage, hoverColor: Colors.grey, highlightColor: Colors.grey,),
              ),
            ),
            if(selectedImg == false)
            ListTile(
              leading: Icon(Icons.camera),
              title: TextButton(

                onPressed: pickImage,
                child: Text(
                  'Upload Image',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            if(selectedImg==true)

            MyListTile(
              icon: Icons.person,
              title: "Profile",
              onTap: () {},
            ),
            MyListTile(
              icon: Icons.chat,
              title: "Messages",
              onTap: () {},
            ),
            MyListTile(
              icon: Icons.notification_important,
              title: "Notifications",
              onTap: () {},
            ),
            MyListTile(
              icon: Icons.settings,
              title: "Setting",
              onTap: () {},
            ),
            MyListTile(
              icon: Icons.logout_outlined,
              title: "Log out",
              onTap: signOut,
            ),
          ],
        );
      },
    ));
  }
}
