import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  CameraController? controller;
  int selectedCameraIdx = 0;
  FlashMode flashMode = FlashMode.off;
  double zoomLevel = 1.0;
  double maxZoom = 1.0;
  double minZoom = 1.0;
  bool isZoomSuported = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async{
    cameras = await availableCameras();
    await _setupCamera(selectedCameraIdx);
  }

  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}