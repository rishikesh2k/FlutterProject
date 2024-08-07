import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:record/record.dart';

class RecorderScreen extends StatefulWidget {
  const RecorderScreen({super.key});

  @override
  State<RecorderScreen> createState() => _RecorderScreenState();
}

class _RecorderScreenState extends State<RecorderScreen> {
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  String? recordingPath;
  bool isRecording = false, isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _recordingButton(),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (recordingPath != null)
            MaterialButton(
              onPressed: () async {
                if (audioPlayer.playing) {
                  audioPlayer.stop();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await audioPlayer.setFilePath(recordingPath!);
                  audioPlayer.play();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: Text(isPlaying ? "Playing" : "Stop"),
            ),
          if (recordingPath == null) const Text("No Recording Found :("),
        ],
      ),
    );
  }

  Widget _recordingButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (isRecording) {
          String? filePath = await audioRecorder.stop();
          if (filePath != null) {
            setState(() {
              isRecording = false;
              recordingPath = filePath;
            });
          }
        } else {
          if (await audioRecorder.hasPermission()) {
            final Directory appDocumentDir =
                await getApplicationDocumentsDirectory();
            final String pathFile =
                p.join(appDocumentDir.path, "recording.wav");
            await audioRecorder.start(const RecordConfig(), path: pathFile);
            setState(() {
              isRecording = true;
              recordingPath = null;
            });
          }
        }
      },
      child: Icon(isRecording ? Icons.mic_rounded : Icons.mic_off_rounded),
    );
  }
}
