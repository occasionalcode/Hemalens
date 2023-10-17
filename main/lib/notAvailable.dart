import 'package:flutter/material.dart';
import 'package:main/pallete.dart';
import 'package:main/widget/backButton.dart';

class NotAvailable extends StatelessWidget {
  const NotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [CustomBack()],
              ),
              SizedBox(height: height * 0.25),
              Image.asset("assets/images/WhiteBloodCell.png"),
              const Text(
                "Coming soon",
                style: TextStyle(
                    fontFamily: "UrbanistB",
                    color: Pallete.almostBlack,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Exciting things are \njust around the corner",
                style: TextStyle(
                  fontFamily: "UrbanistSB",
                  color: Pallete.forgotPass,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
