import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/MyBtn.dart';
import '../constants.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'Registration_Screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 8.0,
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
            SizedBox(
              height: 24.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextDecoration.copyWith(hintText: 'Enter your password'),
            ),
            MyBtn(
                text: 'Register',
                onPress: () async {
                  if (email != null && password != null) {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    if (newUser.user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                      print(' current user  ${newUser.user}');
                    } else {
                      const snackBar = SnackBar(
                        content: Text('An Error !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('fill field !'),
                    ));
                  }
                },
                color: Colors.pink.shade300),
          ],
        ),
      ),
    );
  }
}
