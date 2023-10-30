import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;

import 'my_audio_stream.dart';

class TestAudio extends StatefulWidget {
  const TestAudio({super.key});

  @override
  State<TestAudio> createState() => _TestAudioState();
}

class _TestAudioState extends State<TestAudio> {
  String apiKey = 'AIzaSyB8Tj0Nx-QjAjkvjm5YHZ9AJqFNZPdfuG0';
  final player = AudioPlayer();

  Future<void> speakText(String text) async {
    String mydata1 = "Hy How are you";
    final List<int> codeUnits = mydata1.codeUnits;
    print("code------------$codeUnits");
    final Uint8List unit8Listd = Uint8List.fromList(codeUnits);
    await player.setSpeed(1);
    await player.setVolume(1);
    await player.setAudioSource(MyJABytesSource(
        [72, 121, 32, 72, 111, 119, 32, 97, 114, 101, 32, 121, 111, 117]));
    print("cmkmck");
    // player.play();
    // final url = Uri.parse(
    //     'https://texttospeech.googleapis.com/v1/text:synthesize?key=$apiKey');
    // final response = await http.post(
    //   url,
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: json.encode({
    //     'input': {'text': text},
    //     'type'
    //         'voice': {'languageCode': 'en-US', 'name': 'en-US-Wavenet-D'},
    //     'audioConfig': {'audioEncoding': 'LINEAR16'},
    //   }),
    // );
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> responseData = json.decode(response.body);
    //   final String audioBase64 = responseData['audioContent'];
    //   final Uint8List audioData =
    //       Uint8List.fromList(base64.decode(audioBase64));
    //   final player = await Player.bytes(audioData);
    //   setState(() {
    //     player.toggle();
    //   });
    // } else {
    //   // Handle the error
    //   print(
    //       'Text-to-Speech API request failed with status ${response.statusCode}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                speakText("Hai hello how are you");
                // await player.setSpeed(1); // Twice as fast
                // await player.setVolume(1); // Create a player
                // await player.setUrl(// Load a URL
                //     'https://physia.github.io/kflutter/kplayer/online_example/assets/assets/Introducing_flutter.mp3'); // Schemes: (https: | file: | asset: )
                await player.play(); // Play while waiting for completion
              },
              child: Text("Click")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                await player.stop();
              },
              child: Text("stop"))
        ],
      ),
    );
  }
}
