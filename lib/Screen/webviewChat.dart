// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// class webviewChat extends StatefulWidget {
//   const webviewChat({Key? key}) : super(key: key);
//
//   @override
//   State<webviewChat> createState() => _webviewChatState();
// }
//
// class _webviewChatState extends State<webviewChat> {
//   final Set<JavascriptChannel> jsChannels = [
//     JavascriptChannel(
//         name: 'Print',
//         onMessageReceived: (JavascriptMessage message) {
//           print(message.message);
//         }),
//   ].toSet();
//
//   var kAndroidUserAgent =
//       'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
//
//   String selectedUrl = 'https://chat.primal.fm/';
//
//   var isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       WebView.platform = AndroidWebView();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//         url: selectedUrl,
//         mediaPlaybackRequiresUserGesture: false,
//         withZoom: true,
//         withLocalStorage: true,
//         hidden: true,
//         initialChild: Container(
//           color: Colors.redAccent,
//           child: const Center(
//             child: Text('Waiting.....'),
//           ),
//         ));
//   }
// }
