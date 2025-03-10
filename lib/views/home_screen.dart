import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/audio_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AudioViewModel>(context, listen: false).fetchAudioFiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioVM = Provider.of<AudioViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Audio Notes")),
      body: ListView.builder(
        itemCount: audioVM.audioFiles.length,
        itemBuilder: (context, index) {
          final file = audioVM.audioFiles[index];
          return ListTile(
            title: Text(file.path.split('/').last),
            trailing: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => audioVM.playAudio(file.path),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (audioVM.isRecording) {
            audioVM.stopRecording();
          } else {
            audioVM.startRecording(context);
          }
        },
        child: Icon(audioVM.isRecording ? Icons.stop : Icons.mic),
      ),
    );
  }
}
