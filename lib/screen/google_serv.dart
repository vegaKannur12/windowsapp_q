// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:google_speech/speech_client_authenticator.dart';
// import 'dart:io';

// import 'package:path_provider/path_provider.dart';

// class GooGleSer extends StatefulWidget {
//   const GooGleSer({super.key});

//   @override
//   State<GooGleSer> createState() => _GooGleSerState();
// }

// class _GooGleSerState extends State<GooGleSer> {
//   String apiKey = 'AIzaSyB8Tj0Nx-QjAjkvjm5YHZ9AJqFNZPdfuG0';

//     speakText(String text) async {
//     final url =
//         'https://texttospeech.googleapis.com/v1/text:synthesize?key=$apiKey';
//     final headers = {'Content-Type': 'application/json'};
//     final body = json.encode({
//       'input': {'text': text},
//       'voice': {
//         'languageCode': 'en-US',
//         'name': 'en-US-Wavenet-D',
//         'ssmlGender': 'NEUTRAL'
//       },
//       'audioConfig': {'audioEncoding': 'LINEAR16'},
//     });
//     final response =
//         await http.post(Uri.parse(url), headers: headers, body: body);
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     final String audioBase64 = responseData['audioContent'];
//     final Uint8List audioData = Uint8List.fromList(base64.decode(audioBase64));
//     print("audio data--------------$audioData");
//     final audioPlayer = AudioPlayer();
//     await audioPlayer.setSourceBytes(audioData);
//     // AudioPlayer audioPlayer = AudioPlayer();
//     //  int result = await audioPlayer.playBytes(audioData);
//   }

//   // Future<void> generateAndPlaySpeech(String text) async {
//   //   final synthesisInput = SynthesisInput()..text = text;
//   //   final voiceSelectionParams = VoiceSelectionParams(
//   //     languageCode: 'en-US',
//   //     name: 'en-US-Wavenet-D',
//   //   );
//   //   final audioConfig = AudioConfig(
//   //     audioEncoding: 'LINEAR16',
//   //   );

//   //   final synthesisResponse = await textToSpeech.text.synthesizeSpeech(
//   //     SynthesizeSpeechRequest(
//   //       input: synthesisInput,
//   //       voice: voiceSelectionParams,
//   //       audioConfig: audioConfig,
//   //     ),
//   //   );

//   //   if (synthesisResponse.audioContent != null) {
//   //     // Decode the audio content from base64
//   //     final audioBytes = base64.decode(synthesisResponse.audioContent!);

//   //     // Play the decoded audio using the audioplayers package
//   //     final audioPlayer = AudioPlayer();
//   //     int result = await audioPlayer.playBytes(audioBytes);

//   //     if (result == 1) {
//   //       // Playback started successfully
//   //     } else {
//   //       // Handle playback error
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//           onPressed: () async {
//              speakText('Hello, world!');
//             // final serviceAccount = ServiceAccount.fromString(r'''{YOUR_JSON_STRING}''');
//           },
//           child: Text("CLick")),
//     );
//   }
// }
