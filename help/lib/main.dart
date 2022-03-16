import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help/src/blocs/application_bloc.dart';
import 'package:help/src/screens/google_map_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: GoogleMapScreen(),
        ),
    );
  }
}
