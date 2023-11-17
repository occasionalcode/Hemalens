import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:main/previewScreen.dart';
import 'package:main/pallete.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isFrontCamera = false; // Initially set to back camera
  bool isFlashOn = false;
  bool isCapturing = false;
  IconData flashIcon = Icons.flash_off;

  @override
  void initState() {
    _controller = CameraController(
      CameraDescription(
        sensorOrientation: 1,
        name: "0",
        lensDirection: CameraLensDirection.back,
      ),
      ResolutionPreset.max,
    );
    _initializeControllerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFlash() {
    if (isFrontCamera) {
      return; // Do nothing if the front camera is active
    }

    if (isFlashOn) {
      _controller.setFlashMode(FlashMode.off);
    } else {
      _controller.setFlashMode(FlashMode.torch);
    }

    setState(() {
      isFlashOn = !isFlashOn;
      flashIcon =
          isFlashOn ? Icons.flash_on : Icons.flash_off; // Update flashIcon
    });
  }

  void toggleCameraDirection() async {
    final cameras = await availableCameras();
    CameraDescription newCamera;

    if (isFrontCamera) {
      newCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => cameras[0]);

      setState(() {
        isFrontCamera = !isFrontCamera;
        _controller = CameraController(newCamera, ResolutionPreset.max);
        _initializeControllerFuture = _controller.initialize();
        flashIcon =
            isFlashOn ? Icons.flash_on : Icons.flash_off; // Update flashIcon
      });
    } else {
      newCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras[0]);

      setState(() {
        isFrontCamera = !isFrontCamera;
        _controller = CameraController(newCamera, ResolutionPreset.max);
        _initializeControllerFuture = _controller.initialize();
        flashIcon = isFlashOn
            ? Icons.flash_on
            : Icons.highlight_off; // Set flashIcon to Icons.back_hand
      });
    }
  }

  Future<void> captureImage() async {
    try {
      setState(() {
        isCapturing = true;
      });

      // Set the flash mode to off just before capturing the image
      await _controller.setFlashMode(FlashMode.off);

      final image = await _controller.takePicture();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PreviewScreen(imagePath: image.path),
      ));
    } catch (e) {
      // Handle capture error
    } finally {
      setState(() {
        isCapturing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 71),
          child: Stack(
            children: [
              Positioned(
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),

              // Shutter button
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!isCapturing) {
                          captureImage(); // Only capture if not already capturing
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3.0,
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.2,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isCapturing)
                Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              ///// Camera adjustment Floatie (top right)
              Positioned(
                top: 26,
                right: 11,
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        height: 183,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Pallete.transparentBlack,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 183,
                        width: 52,
                        child: GestureDetector(
                          onTap: toggleFlash,
                          child: Icon(
                            flashIcon, // Use the updated flash icon
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                          height: 83,
                          width: 52,
                          child: GestureDetector(
                            onTap: toggleCameraDirection,
                            child: Icon(
                              isFrontCamera
                                  ? Icons.camera_front
                                  : Icons.camera_rear,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),

              // Camera adjustments

              // Shutter button
            ],
          ),
        ),
      ),
    );
  }
}
