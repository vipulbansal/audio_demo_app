class AudioNote {
  final String id;
  final String filePath;
  final DateTime timestamp;

  AudioNote({required this.id, required this.filePath, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {'id': id, 'filePath': filePath, 'timestamp': timestamp.toIso8601String()};
  }
}
