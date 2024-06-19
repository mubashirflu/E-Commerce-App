import 'package:flutter/material.dart';
import 'package:pratice_language_app/screens/auth/auth_provider.dart';
import 'package:pratice_language_app/screens/constant.dart';
import 'package:pratice_language_app/screens/login/login_screen.dart';

class Custome_app_bar extends StatefulWidget {
  const Custome_app_bar({
    super.key,
  });

  @override
  State<Custome_app_bar> createState() => _Custome_app_barState();
}

class _Custome_app_barState extends State<Custome_app_bar> {
  @override
  AuthServices _auth = AuthServices();
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          icon: Image.asset(
            "assets/images/icon.png",
            height: 20,
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor,
                padding: const EdgeInsets.all(20)),
            onPressed: () async {
              await _auth.Signout();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
            },
            iconSize: 30,
            icon: const Icon(Icons.logout_outlined)),
      ],
    );
  }
}
