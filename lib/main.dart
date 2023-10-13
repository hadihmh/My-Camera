import 'package:flutter/material.dart';
import 'package:my_test/ui/screens/camera/camera_screen.dart';

void main() {
  runApp(const CameraAwesomeApp());
}

class CameraAwesomeApp extends StatelessWidget {
  const CameraAwesomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Camera',
      home: CameraPage(),
    );
  }
}
