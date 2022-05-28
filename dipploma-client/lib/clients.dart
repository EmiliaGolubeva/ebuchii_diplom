import 'package:dudedelivery/post/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/delivery.dart';
import 'package:url_launcher/url_launcher.dart';

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  late Future<List<Delivery>> futureDelivery;

  @override
  void initState() {
    super.initState();
    // futureDelivery = fetchDelivery();
  }

  @override
  Widget build(BuildContext context) {
    final number = "+89219918810";
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF161615),
            title: Text(
              'Клиенты',
              style: kMainHeading.copyWith(
                  color: Colors.white, fontSize: 20.0),
            ),
          ),
        body: Center(
            child: ListView(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 0.5,
                    ),
                  ),
                  child: ListTile(
                    leading:Image(
                    image: AssetImage('assets/images/client.png'),
                    ),
                    title: Text('Three-line ListTile'),
                    subtitle: Text(
                        'A sufficiently long subtitle warrants three lines.'
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.phone_in_talk),
                      onPressed: () async {
                        launch('tel://$number');
                      }, ),
                    isThreeLine: true,
                  ),
                ),
              ],
            )
          ),
        );
  }
}
