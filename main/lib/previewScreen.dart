import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/cameraScreen.dart';
import 'package:main/widget/SocialButton.dart';

class PreviewScreen extends StatelessWidget {
  final String imagePath;
  const PreviewScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double
            .infinity, // This will make the container take up all available height
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Use MainAxisSize.min to make the Column take the minimum height needed
          children: [
            Center(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: Socialbutton(
                    label: "Retake",
                    routeName: CameraScreen(),
                    horizontalPadding: MediaQuery.of(context).size.width / 6,
                    verticalPadding: 20,
                    borderRadius: 30,
                    bgColor: Color.fromRGBO(235, 81, 70, 1),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Socialbutton(
                    label: "Proceed",
                    routeName: CameraScreen(),
                    horizontalPadding: MediaQuery.of(context).size.width / 6,
                    verticalPadding: 20,
                    borderRadius: 30,
                    bgColor: Color.fromRGBO(95, 179, 98, 1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
