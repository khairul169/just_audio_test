import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final player = AudioPlayer();

  Future<void> onPlay(String url) async {
    try {
      if (player.playbackState != AudioPlaybackState.none) {
        await player.stop();
      }

      var duration = await player.setUrl(url);
      print('Duration: $duration');

      await player.play();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Radio Streaming:'),
            RaisedButton(
              child: Text('Play'),
              onPressed: () => onPlay('http://202.147.199.99:8000/stream/1/'),
            ),
            SizedBox(height: 24),
            Text('Fffmpeg stream with express & nodejs:'),
            RaisedButton(
              child: Text('Play'),
              onPressed: () =>
                  onPlay('http://ytstream-api.herokuapp.com/get/6dDRvr18CXU'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Test',
    home: Test(),
  ));
}
