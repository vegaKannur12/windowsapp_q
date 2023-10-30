// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qmanagement/controller/controller.dart';
import 'package:qmanagement/screen/doubleCall.dart';
import 'package:qmanagement/screen/endtoendvide.dart';
import 'package:qmanagement/screen/google_serv.dart';
import 'package:qmanagement/screen/homepage.dart';
import 'package:qmanagement/screen/hospitalDisplay.dart';
import 'package:qmanagement/screen/periodic_call.dart';
import 'package:qmanagement/screen/qHospitalYutube.dart';
import 'package:qmanagement/screen/test_audio.dart';
import 'package:window_manager/window_manager.dart';

import 'components/globaldata.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  // final customNotifier = CustomNotifier();
  WidgetsFlutterBinding.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(900, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  // await getbr();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: MyApp(),
  ));
  });
  // runApp(MyApp());
}

getbr() async {
  print("getbr---");

  final File file = File('C:/flu/Tkn.txt');
  var text = await file.readAsString();
  // timerTest(text);
  var map = jsonDecode(text);
  ip = map["ip"];
  br = map["br_id"];
  img = map["img"];
  // ip = "192.168.18.168/clinic2";
  // br = "1";
  // img = "add.mp4";
  print('Ip--$ip--$br-');
  // return ip;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HospitalScreen(),
    );
  }
}

// class Base extends StatefulWidget {
//   const Base({Key? key}) : super(key: key);

//   @override
//   State<Base> createState() => _BaseState();
// }

// class _BaseState extends State<Base> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: WebView(
//           javascriptMode: JavascriptMode.unrestricted,
//           initialUrl:
//               "https://www.jqueryscript.net/demo/Lightweight-jQuery-Based-Text-To-Speech-Engine-Articulate-js/",
//         ),
//       ),
//     );
//   }
// }
