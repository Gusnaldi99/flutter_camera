import 'package:camera/camera.dart';
import 'package:flutter_camera/widget/takepicture_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakepictureScreen(camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );
}
