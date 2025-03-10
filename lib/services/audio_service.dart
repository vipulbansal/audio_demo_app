import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';

class AudioService {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;

  Future<void> startRecording(String filePath) async {
    _recorder = FlutterSoundRecorder();
    await _recorder!.openRecorder();
    await _recorder!.startRecorder(toFile: filePath);
  }

  Future<String?> stopRecording() async {
    return await _recorder?.stopRecorder();
  }

  Future<void> playAudio(String filePath) async {
    _player = FlutterSoundPlayer();
    await _player!.openPlayer();
    await _player!.startPlayer(fromURI: filePath);
  }

  Future<void> stopAudio() async {
    await _player?.stopPlayer();
  }
}
