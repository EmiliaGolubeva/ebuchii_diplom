import 'package:dudedelivery/auth.dart';
import 'package:dudedelivery/clients_screen.dart';
import 'package:dudedelivery/home_screen.dart';
import 'package:dudedelivery/map.dart';
import 'package:dudedelivery/profile.dart';
import 'package:dudedelivery/reg.dart';
import 'package:flutter/material.dart';

import 'new_shipments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Auth(),
        '/reg': (context) => const Reg(),
        '/homescreen': (context) => const HomeScreen(),
        '/map': (context) => const MapPage(),
        '/profile': (context) => const Profile(),
        '/newshimpent': (context) => const NewShipments(),
        '/clients': (context) => ClientsPage()
      },
    );
  }
}