import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'widget/filter_selector.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  Color selectedFilterColor = Colors.white; // warna filter
  XFile? capturedImage; // menyimpan

  final List<Color> _filters = [
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.medium,
      );
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  void _onFilterChanged(Color filterColor) {
    setState(() {
      selectedFilterColor = filterColor;
    });
  }

  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    capturedImage = await _cameraController!.takePicture();
    setState(() {}); // update tampilan
  }

  Future<void> _retakePicture() async {
    setState(() {
      capturedImage = null; // hapus gambar dan kembali ke kamera
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("1122140107")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child:
                capturedImage == null
                    ? (_cameraController != null &&
                            _cameraController!.value.isInitialized
                        ? Stack(
                          children: [
                            CameraPreview(_cameraController!),
                            Container(
                              color: selectedFilterColor.withOpacity(
                                0.3,
                              ), // overlay filter
                            ),
                          ],
                        )
                        : const Center(child: CircularProgressIndicator()))
                    : Stack(
                      children: [
                        Image.file(File(capturedImage!.path)),
                        Container(
                          color: selectedFilterColor.withOpacity(
                            0.3,
                          ), // overlay filter
                        ),
                      ],
                    ),
          ),

          if (capturedImage == null)
            FilterSelector(
              filters: _filters,
              onFilterChanged: _onFilterChanged,
            ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                capturedImage == null
                    ? Container(
                      decoration: BoxDecoration(
                        shape:
                            BoxShape
                                .circle, // Membuat border berbentuk lingkaran
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ), // Warna dan ketebalan border
                      ),
                      child: IconButton(
                        onPressed: _takePicture,
                        icon: const Icon(Icons.camera_alt),
                        tooltip: "Ambil Foto",
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: IconButton(
                        onPressed: _retakePicture,
                        icon: const Icon(Icons.camera_alt),
                        tooltip: "Ambil Ulang",
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
