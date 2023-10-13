import 'package:flutter/material.dart';
import 'package:main/pallete.dart';
import 'package:main/widget/EntryField.dart';
import "package:main/widget/SocialButton.dart";
import 'package:main/widget/LinkText.dart';
import 'package:main/widget/HorizontalLine.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            decoration: const BoxDecoration(color: Pallete.backgroundColor),
            child: Column(children: <Widget>[
              const SizedBox(height: 35),
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
            const SizedBox(height: 170),
            SizedBox(
              width: double.infinity, // Set the width to the screen width
              child: AspectRatio(
                aspectRatio: 9 / 13.5, // Adjust the aspect ratio as needed
                child: Image.asset(
                  "assets/images/EclipseSignIn.png",
                  fit: BoxFit.cover, // Use BoxFit.cover to fill the container
                ),
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
              height: MediaQuery.of(context).size.height * 0.65,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 500,
              ),
              const LoginField(
                hintText: "Enter your email",
              ),
              const SizedBox(
                height: 5,
              ),
              const LoginField(
                hintText: "Enter your password",
                obscured: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.64),
                  const FittedBox(
                    child: LinkText(label: "Forgot password?"),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Socialbutton(label: "Login"),
              const Divider(
                height: 68,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalLine(
                    pallete: Pallete.faintLine,
                    width: width * 0.20,
                    height: 1,
                    margin: EdgeInsets.only(left: 0.05, right: width * 0.02),
                  ),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontFamily: "UrbanistSB",
                        color: Pallete.forgotPass,
                        fontSize: 14),
                  ),
                  HorizontalLine(
                    pallete: Pallete.faintLine,
                    width: width * 0.20,
                    height: 1,
                    margin: EdgeInsets.only(right: 0.05, left: width * 0.02),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const LinkText(
                label: "Sign Up",
                pallete: Pallete.coloredLink,
              ),
            ],
          ),
        ],
      )
    ])));
  }
}
