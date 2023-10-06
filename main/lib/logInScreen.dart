import 'package:flutter/material.dart';
import 'package:main/pallete.dart';
import 'package:main/widget/EntryField.dart';
import "package:main/widget/SocialButton.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: const BoxDecoration(color: Pallete.backgroundColor),
              child: Column(children: <Widget>[
                const SizedBox(height: 60),
                Image.asset("assets/images/hemalens white 1.png"),
                const Text(
                  "HEMALENS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'MontserratEB'),
                ),
                const Text(
                  "TECHNOLOGY",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "MontserratEB",
                      color: Colors.white,
                      letterSpacing: 3),
                ),
              ])),
        ),
        Center(
          child: Column(
            children: [
              const SizedBox(height: 38),
              Container(
                child: Image.asset(
                  "assets/images/EclipseSignIn.png",
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 373.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: 700,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 45),
              child: Column(
                children: [
                  SizedBox(height: 403),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "UrbanistB",
                        color: Pallete.almostBlack,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            const Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                  ),
                  LoginField(
                    hintText: "Enter your email",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  LoginField(
                    hintText: "Enter your password",
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Socialbutton(label: "Log In"),
                ],
              ),
            )
          ],
        )
      ],
    )));
  }
}
