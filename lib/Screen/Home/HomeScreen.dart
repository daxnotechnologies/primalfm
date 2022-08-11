import 'dart:io' as io;
import 'package:audio_service/audio_service.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:primal_fm/Screen/Drawer/DrawerScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Popup/PopupScreen.dart';
import '../audioPlayerHandler.dart';
import '../webviewChat.dart';
import 'package:http_parser/http_parser.dart' as parser;

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  static const urlandroid = 'https://stream.primal.fm';
  static const urlios = 'https://stream.primal.fm/mp3';
  late AudioPlayer _audioPlayer;
  AudioHandler? _audioHandler;

  @override
  void initState() {
    setPlayer();
    // TODO: implement initState
    super.initState();
  }

  setPlayer() async {
    _audioPlayer = AudioPlayer();
    if (io.Platform.isAndroid) {
      await _audioPlayer.setUrl(urlandroid);
    } else {
      await _audioPlayer.setUrl(urlios);
    }    
    
    _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  }

  Stream<http.Response> GetStream() async* {
    yield* Stream.periodic(Duration(milliseconds:500), (_) {
      return http.get(Uri.parse('https://primal.fm/'));
    }).asyncMap((event) async => await event);
  }

  // Future<http.Response> GetCurrentArtist()async{
  //    var response=await http.get(Uri.parse('https://primal.fm/'));
  //    return response;
  //  }
  void playaudio() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerScreenPage(),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: StreamBuilder<http.Response>(
              stream: GetStream(),
              builder: (context, snapshot) {
                var document;
                if (snapshot.hasData) {
                  document = parser.parse(snapshot.data!.body);
                }
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.4,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.colorBurn),
                          image: NetworkImage(
                    '${snapshot.hasData ? document.getElementsByClassName('container')[0].getElementsByClassName('cover-container')[0].querySelector('img').attributes['src']: ""}',
                  ))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
                            child: IconButton(
                              onPressed: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      '${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase() : ""}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 37,
                                        color: Color(0xffFF0000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      '${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[2].text.toString().toUpperCase() : ""}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 37,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                share();
                              },
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse('https://chat.primal.fm/'));
                              },
                              child: Icon(
                                CupertinoIcons.chat_bubble_text,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            GestureDetector(
                              onTap: () { 
                                setState(() {
                                  play = !play;
                                  play == false ? pause() : playaudio();

                                  _audioHandler?.prepareFromUri(io.Platform.isAndroid?
                                  Uri.parse(urlandroid) :
                                  Uri.parse(urlios),
                                  );
                                  _audioHandler!.playMediaItem(MediaItem(
                                    // Specify a unique ID for each media item:
                                    id: '${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase() : ""}',
                                    // Metadata to display in the notification:
                                    album:'${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase() : ""}',
                                    title: "${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[2].text.toString().toUpperCase() : ""}",
                                    artUri: Uri.parse('${snapshot.hasData ? document.getElementsByClassName('container')[0].getElementsByClassName('cover-container')[0].querySelector('img').attributes['src']: ""}',
                                    ),
                                  ),).catchError((err){
                                    print("Eroooooooooooooooooorrrrrrrrrrrrrrrrr");
                                    print(err.toString());
                                  });

                                  AudioSource.uri(
                                  io.Platform.isAndroid?
                                  Uri.parse(urlandroid)
                                  :
                                  Uri.parse(urlios),
                                    tag: MediaItem(
                                      // Specify a unique ID for each media item:
                                      id: '${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase() : ""}',
                                      // Metadata to display in the notification:
                                      album:'${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase() : ""}',
                                      title: "${snapshot.hasData ? document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[2].text.toString().toUpperCase() : ""}",
                                      artUri: Uri.parse('${snapshot.hasData ? document.getElementsByClassName('container')[0].getElementsByClassName('cover-container')[0].querySelector('img').attributes['src']: ""}',
                                      ),
                                    ),
                                  );
                                  
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Icon(
                                    play == false
                                        ? Icons.play_arrow
                                        : Icons.pause,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                            launchUrl(Uri.parse('https://primal.fm/grussbox/frame.html'));
                              },
                              child: ImageIcon(
                                AssetImage('assets/images/person.png'),
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                openwhatsapp();
                              },
                              child: Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Primal FM',
        text: 'Share to freinds',
        linkUrl: 'https://primal.fm/',
        chooserTitle: 'Primal FM');
  }

  openwhatsapp() async {
    var whatsapp = "+4935121789666";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (io.Platform.isIOS) {
      launchUrl(Uri.parse(whatappURL_ios));
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      launchUrl(Uri.parse(whatsappURl_android));
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
sendGreeting()async{
  http.post(Uri.parse('https://api.primal.fm'));
}
