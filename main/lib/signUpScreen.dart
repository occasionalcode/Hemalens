import 'package:flutter/material.dart';
import 'package:main/notAvailable.dart';
import 'pallete.dart';
import 'package:main/widget/EntryField.dart';
import 'package:main/widget/SocialButton.dart';
import 'package:main/widget/backButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomBack(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.08, right: width * 0.08),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Use MainAxisAlignment.spaceBetween
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Pallete.almostBlack,
                          fontSize: 50,
                          fontFamily: 'UrbanistB',
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/hemalens black.png",
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ]),
              ),
              const Divider(
                height: 37,
              ),
              const LoginField(
                hintText: "Username",
              ),
              const Divider(
                height: 25,
              ),
              const LoginField(hintText: "Email"),
              const Divider(
                height: 25,
              ),
              const LoginField(hintText: "Password", obscured: true),
              const Divider(
                height: 25,
              ),
              const LoginField(hintText: "Confirm password", obscured: true),
              const Divider(
                height: 39,
              ),
              const Socialbutton(
                label: "Register",
                routeName: NotAvailable(),
              )
            ],
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 620),
            SizedBox(
              width: double.infinity, // Set the width to the screen width
              child: AspectRatio(
                aspectRatio: 9 / 9.2, // Adjust the aspect ratio as needed
                child: Image.asset(
                  "assets/images/EclipseSignUp.png",
                  fit: BoxFit.cover, // Use BoxFit.cover to fill the container
                ),
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}
