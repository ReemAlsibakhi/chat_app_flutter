import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app_class/screens/chat_screen.dart';
import 'package:chat_app_class/screens/login_screen.dart';
import 'package:chat_app_class/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/MyBtn.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'Welcome_Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//custom animation , each animation need controller, contr need ticker
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, ChatScreen.id, (route) => false);
      }
    });

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.forward();
    controller.addListener(() {
      print(controller.value);
    });
    setState(() {});
    super.initState();
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = ColorTween(begin: Colors.blue, end: Colors.pink.shade200)
        .animate(controller);
    animation.addListener(() {
      setState(() {});
      print(animation.value);
    });
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   }
    // });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // backgroundColor: Colors.red.withOpacity(animation.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                //hero
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 100,
                    // height: 60.0,
                  ),
                ),
                // Text(
                //   '${(controller.value * 100).toInt()}',
                //   // 'Chat App',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Chat App',
                      textStyle:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyBtn(
                text: 'Log In',
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.pink.shade50),
            // color: Colors.lightBlueAccent),
            MyBtn(
                text: 'Register',
                onPress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                color: Colors.pink.shade300),
            // color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
