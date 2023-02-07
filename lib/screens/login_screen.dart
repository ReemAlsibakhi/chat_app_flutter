import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/MyBtn.dart';
import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'Login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void getLoginState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void initState() {
    getLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: showSpinner
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    //     keyboardType: FontFeature.enable(email!),
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration:
                        kTextDecoration.copyWith(hintText: 'Enter your email'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  MyBtn(
                      text: 'Log In',
                      onPress: () async {
                        try {
                          if (email!.trim() != null &&
                              password!.trim() != null) {
                            setState(() {
                              showSpinner = true;
                            });
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                            if (newUser.user != null) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  ChatScreen.id,
                                  //  ModalRoute.withName(WelcomeScreen.id)  ,
                                  (r) => false);
                              print(' current user  ${newUser.user}');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('fill field !'),
                            ));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                          ));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      },
                      color: Colors.pink.shade300),
                  // color: Colors.lightBlueAccent),
                ],
              ),
            ),
    );
  }
}
