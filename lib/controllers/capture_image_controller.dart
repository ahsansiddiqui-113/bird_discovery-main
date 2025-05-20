import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:gal/gal.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CaptureImageController extends GetxController {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  CropController? cropController;
  RxBool isCameraInitialized = false.obs;
  Uint8List? imageData;
  Uint8List? croppedData;
  RxBool isCropping = false.obs;
  XFile picture = XFile('');

  Future<bool> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      picture = pickedFile;
      final Uint8List fileData = await pickedFile.readAsBytes();
      imageData = fileData;
      update(); // Notify listeners about the change
      return true;
    }
    return false;
  }

  Future<void> setupCameraController() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      cameras = _cameras;
      cameraController = CameraController(cameras.first, ResolutionPreset.high);
      await cameraController?.initialize();
      isCameraInitialized.value = true;
    }
  }

  Future<bool> takePicture() async {
    picture = await cameraController!.takePicture();
    // await Gal.putImage(picture.path);
    // await imagePicker(picture);
    print(picture.path);
    if (picture.path.isNotEmpty) {
      final Uint8List fileData = await picture.readAsBytes();
      imageData = fileData; // Load the captured image into memory
      print(imageData);
      cropController?.image = fileData;
      update();
      return true;
    }
    return false;

    // print(picture.path);
  }

  Future<void> savePicture() async {
    await Gal.putImage(picture.path);
    Get.snackbar('Successful', 'Successfully saved');
  }

  void cropImage(result) {
    isCropping.value = true;
    switch (result) {
      case CropSuccess(:final croppedImage):
        croppedData = croppedImage;
        print(croppedData);
      // update();
    }
    // controller.croppedData = croppedData;
    isCropping.value = false;
    // cropController?.crop();
  }
}
