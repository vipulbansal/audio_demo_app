import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AudioRepository {
  Future<String> getFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName.aac';
  }

  Future<List<File>> getAudioFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory
        .listSync()
        .where((file) => file.path.endsWith('.aac'))
        .map((file) => File(file.path))
        .toList();
  }
}
