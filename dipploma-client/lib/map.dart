import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants.dart';
// import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF161615),
        title: Text(
          'Карты',
          style: kMainHeading.copyWith(
              color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.google.ru/maps/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
