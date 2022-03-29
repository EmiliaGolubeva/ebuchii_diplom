import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
