import 'package:flutter/material.dart';
import 'package:dudedelivery/models/clients.dart';

class ClientWidget extends StatelessWidget {
  final Client client;

  const ClientWidget({Key key, @required this.client})
      : assert(client != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          onTap: (){
            print("${client.clientName} pressed");
          },
          title: Text(client.clientName),
          leading: Icon(Icons.face_unlock_rounded),
          subtitle: Text(client.clientAddress),
          trailing: Icon(Icons.phone),
        ),
    );
  }
}
