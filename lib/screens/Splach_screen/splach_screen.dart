import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pratice_language_app/screens/constant.dart';
import 'package:pratice_language_app/screens/login/login_screen.dart';

class Splach_Screen extends StatefulWidget {
  const Splach_Screen({super.key});

  @override
  State<Splach_Screen> createState() => _Splach_ScreenState();
}

class _Splach_ScreenState extends State<Splach_Screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kprimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Ecommere.PK!",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100.0),
          SizedBox(
            height: 5,
            width: 270,
            child: LinearProgressIndicator(
              color: kprimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
