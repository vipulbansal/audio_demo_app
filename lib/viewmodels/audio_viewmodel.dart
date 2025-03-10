import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../repositories/audio_repository.dart';
import '../services/audio_service.dart';

class AudioViewModel extends ChangeNotifier {
  final AudioRepository _repository = AudioRepository();
  final AudioService _audioService = AudioService();

  bool isRecording = false;
  bool isPlaying = false;
  List<File> audioFiles = [];

  Future<void> startRecording(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.request();

    if (status.isGranted) {
      final filePath = await _repository.getFilePath(DateTime.now().millisecondsSinceEpoch.toString());
      await _audioService.startRecording(filePath);
      isRecording = true;
      notifyListeners();
    } else {
      // Show Snackbar if permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status.isPermanentlyDenied
                ? "Microphone permission permanently denied! Open settings."
                : "Microphone permission denied! Please allow to record.",
          ),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: "Open Settings",
            onPressed: () {
              openAppSettings();
            },
          ),
        ),
      );
    }
  }

  Future<void> stopRecording() async {
    await _audioService.stopRecording();
    isRecording = false;
    await fetchAudioFiles();
    notifyListeners();
  }

  Future<void> playAudio(String filePath) async {
    isPlaying = true;
    notifyListeners();
    await _audioService.playAudio(filePath);
    isPlaying = false;
    notifyListeners();
  }

  Future<void> fetchAudioFiles() async {
    audioFiles = await _repository.getAudioFiles();
    notifyListeners();
  }
}
