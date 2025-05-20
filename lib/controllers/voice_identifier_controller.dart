import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../views/home/voice_identifier/bird_photo_screen.dart';
import '../views/home/voice_identifier/scan_bird_screen.dart';

class BirdSoundController extends GetxController {
  // Options and navigation
  var selectedOption = 'By Sound'.obs;

  // Audio recording
  late final RecorderController recorderController;
  final flutterSoundRecorder = FlutterSoundRecorder();
  var isRecording = false.obs;
  var timer = "00:00:00".obs;
  var recordedFilePath = ''.obs;
  StreamSubscription<String>? timerInterval;
  var shouldNavigateToAnalysis = false.obs;

  // Photo handling
  var isProcessing = false.obs;
  var imageFile = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    recorderController =
        RecorderController()
          ..androidEncoder = AndroidEncoder.aac
          ..androidOutputFormat = AndroidOutputFormat.mpeg4
          ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
          ..sampleRate = 44100;

    await flutterSoundRecorder.openRecorder();
    await flutterSoundRecorder.setSubscriptionDuration(
      const Duration(milliseconds: 100),
    );
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  Future<void> startRecording() async {
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      Get.snackbar(
        'Permission Required',
        'Microphone access is needed to record',
      );
      return;
    }

    try {
      isRecording(true);
      shouldNavigateToAnalysis.value = false;
      timer.value = "00:00:00";
      recordedFilePath.value = '';

      await recorderController.record();
      await flutterSoundRecorder.startRecorder(toFile: 'audio_recording.wav');

      int seconds = 0;
      timerInterval = Stream.periodic(const Duration(seconds: 1), (_) {
        if (isRecording.value) {
          seconds++;
          final hours = seconds ~/ 3600;
          final minutes = (seconds % 3600) ~/ 60;
          final secs = seconds % 60;
          return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
        }
        return timer.value;
      }).takeWhile((_) => isRecording.value).listen((time) => timer.value = time);
    } catch (e) {
      isRecording(false);
      Get.snackbar('Error', 'Failed to start recording: ${e.toString()}');
    }
  }

  Future<void> stopRecording() async {
    try {
      isRecording(false);
      timerInterval?.cancel();

      recordedFilePath.value = await recorderController.stop() ?? '';
      await flutterSoundRecorder.stopRecorder();

      if (recordedFilePath.isNotEmpty) {
        shouldNavigateToAnalysis.value = true;
      } else {
        throw Exception('Failed to save recording');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to stop recording: ${e.toString()}');
    }
  }

  void navigateBasedOnOption(String option) {
    selectOption(option);
    switch (option) {
      case 'Bird photo AI Enhance':
        Get.to(() => ScanBirdScreen());
        break;
      case 'By Photo':
        Get.to(() => BirdPhotoScreen());
        break;
      case 'By Sound':
        break;
    }
  }

  // Photo handling methods
  Future<void> requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final photosStatus = await Permission.photos.request();

    if (!cameraStatus.isGranted || !photosStatus.isGranted) {
      Get.snackbar(
        'Permissions Required',
        'Camera and gallery access are needed',
      );
    }
  }

  Future<void> capturePhoto() async {
    try {
      isProcessing(true);
      await requestPermissions();
      final photo = await ImagePicker().pickImage(source: ImageSource.camera);
      if (photo != null) {
        imageFile.value = File(photo.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture photo: ${e.toString()}');
    } finally {
      isProcessing(false);
    }
  }

  Future<void> selectPhotoFromGallery() async {
    try {
      isProcessing(true);
      await requestPermissions();
      final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (photo != null) {
        imageFile.value = File(photo.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to select photo: ${e.toString()}');
    } finally {
      isProcessing(false);
    }
  }

  void confirmPhoto() {
    if (imageFile.value != null) {
      // Process the image here
      isProcessing(false);
      Get.snackbar('Success', 'Photo ready for processing');
    } else {
      Get.snackbar('Error', 'No photo selected');
    }
  }

  @override
  void onClose() {
    recorderController.dispose();
    flutterSoundRecorder.closeRecorder();
    timerInterval?.cancel();
    super.onClose();
  }
}
