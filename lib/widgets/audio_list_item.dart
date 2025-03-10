import 'package:flutter/material.dart';

class AudioListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPlay;
  final VoidCallback onDelete;

  AudioListItem({required this.title, required this.onPlay, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.play_arrow), onPressed: onPlay),
          IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
        ],
      ),
    );
  }
}
