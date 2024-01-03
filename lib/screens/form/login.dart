import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_chops/screens/mainScreens/home.dart';
import 'package:lottie/lottie.dart';

final firebase = FirebaseAuth.instance;

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final formKey = GlobalKey<FormState>();
  var isLogin = true;
  var enteredName = "";
  var enteredEmail = "";
  var enteredPsw = "";
  bool isAuth = false;

  void signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    formKey.currentState!.save();
    try {
      setState(() {
        isAuth = true;
      });
      if (isLogin) {
        final loggedIn = await firebase.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPsw);
            //if the user doesnt exist 
            if(loggedIn.user == null){
              throw "Invalid Email or Password";
            }
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ));
      
      } else {
        final usercredential = await firebase.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPsw);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Home(),
        ));

        FirebaseFirestore.instance
            .collection("user")
            .doc(usercredential.user!.uid)
            .set({
          "name": enteredName,
          "email": enteredEmail,
          "password": enteredPsw,
          "firstTime": true
        });
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Authentication failed"),
        ),
      );
      setState(() {
        isAuth = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                // image: DecorationImage(image: NetworkImage(url) ),
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 10, 75, 12).withOpacity(1.0),
              Color.fromARGB(255, 91, 136, 93).withOpacity(0.3)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Text( isLogin ? "Welcome back \nMissed you" : "Hello\nSign Up",
                  textAlign: TextAlign.left,
                  textScaleFactor: 2.3,
                  style: GoogleFonts.amethysta(
                      color: Colors.white,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400, letterSpacing: 2))),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                width: double.infinity,
                height: 630,
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                     Center(
                      child:Icon(Icons.person_outline_outlined,size: 84, color: Colors.green.shade200,)
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            if (isLogin == false)
                              TextFormField(
                                onSaved: (newValue) {
                                  enteredName = newValue!;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Name",
                                  errorBorder: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 5) {
                                    return "Must be above 5 characters";
                                  }
                                  return null;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                autocorrect: true,
                                enableSuggestions: true,
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onSaved: (newValue) {
                                enteredEmail = newValue!;
                              },
                              decoration: const InputDecoration(
                                hintText: "Email",
                                errorBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().length < 5 ||
                                    !value.contains("@")) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                              autocorrect: true,
                              enableSuggestions: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onSaved: (newValue) {
                                enteredPsw = newValue!;
                              },
                              decoration: const InputDecoration(
                                hintText: "Password",
                                errorBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().length < 8) {
                                  return "8 - 15 characters";
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (isAuth) CircularProgressIndicator(),
                            if (!isAuth)
                              Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: signUp,
                                      child: Text(
                                          isLogin ? "Log in" : "Sign Up"))),
                            if (!isAuth)
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isLogin = !isLogin;
                                    });
                                  },
                                  child: Text(isLogin
                                      ? "Don't have an account?  Sign Up"
                                      : "Already have an account? Log in "))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
