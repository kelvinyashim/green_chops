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
  @override
  Widget build(BuildContext context) {
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
      imageQuality: 100,
    );
    if (selected == null) {
      return;
    }
    setState(() {
      selectedImg = File(selected.path);
    });
    
  }

    final user = firebase.currentUser;

    return Drawer(
        elevation: 2,
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("user")
              .doc(user!.uid)
              .get(),
          builder: (context, snapshot) {
            final userData = snapshot.data;
            final accountName = userData?["name"] ?? "name";
            final accountEmail = userData?["email"] ?? "exam@gmail.com";
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            }
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGXW9lIBYG9EzSxRtgu1liCvciqClaPQzqu5twB_hyAoxglZkmP7jDBqHo1a0xb7vryOw&usqp=CAU"))),
                  accountName: Text(accountName),
                  accountEmail: Text(accountEmail),
                  currentAccountPicture: ClipOval(
                    child: CircleAvatar(
                      foregroundImage: FileImage(selectedImg!),
                      backgroundImage: NetworkImage("https://louisville.edu/enrollmentmanagement/images/person-icon/image") ,
                    ),
                  ),
                ),
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
