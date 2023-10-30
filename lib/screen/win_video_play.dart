import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'dart:developer';

import 'package:video_player_win/video_player_win_plugin.dart';

import '../components/globaldata.dart';
import '../controller/controller.dart';

class WinPlayVideo extends StatefulWidget {
  const WinPlayVideo({super.key});

  @override
  State<WinPlayVideo> createState() => _WinPlayVideoState();
}

class _WinPlayVideoState extends State<WinPlayVideo> {
  late VideoPlayerController controller;
  double adv_vol1 = 0.0;
  @override
  void initState() {
    adv_vol1 = Provider.of<Controller>(context, listen: false).adv_vol!;
    print("dssadsads---${adv_vol1}");
    if (!kIsWeb && Platform.isWindows) WindowsVideoPlayer.registerWith();

    super.initState();
    // controller = VideoPlayerController.file(File("E:\\add.mp4"));

    // Uri url = Uri.parse("http://146.190.8.166/API/$img");
    Uri url = Uri.parse("http://146.190.8.166/API/add.mp4");

    controller = VideoPlayerController.networkUrl(
      url,
      // videoPlayerOptions:VideoPlayerOptions()
    );
    controller.initialize().then((value) {
      if (controller.value.isInitialized) {
        controller.setVolume(adv_vol1);
        controller.play();
        setState(() {});
        controller.setLooping(true);
      } else {
        log("video file load failed");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: VideoPlayer(controller),
    );
  }
}
