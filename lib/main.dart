import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'Screen/About_us/About_us_screen.dart';
import 'Screen/Drawer/DrawerScreen.dart';
import 'Screen/Home/HomeScreen.dart';
import 'Screen/MessageSent/MessageSentScreen.dart';
import 'Screen/Policy/PolicyScreen.dart';
import 'Screen/Popup/PopupScreen.dart';
import 'Screen/StartScreen/StartScreen.dart';
import 'package:audio_service/audio_service.dart';

import 'Screen/audioPlayerHandler.dart';

late AudioHandler _audioHandler;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // _audioHandler = await AudioService.init(
  //   builder: () => AudioPlayerHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //     androidNotificationChannelName: 'Audio playback',
  //     androidNotificationOngoing: true,
  //   ),
  // );

  // _audioHandler.playMediaItem()

  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );
  runApp(const PrimalApp());
}
class PrimalApp extends StatelessWidget {
  const PrimalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      StartScreenpage(),
    );
  }
}
